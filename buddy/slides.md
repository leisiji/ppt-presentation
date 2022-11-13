---
# try also 'default' to start simple
theme: seriph
# apply any windi css classes to the current slide
class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# show line numbers in code blocks
lineNumbers: false
# some information about the slides, markdown enabled
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
# persist drawings in exports and build
drawings:
  persist: false
---

# buddy

buddy 的作用是管理空闲内存页，是指 `zone::free_area[MAX_ORDER]` 这个数据结构

分配和释放都是围绕 order 的切割和合并展开的

---

## zone buddy

- 通过 blocks 管理空闲页面，每个都是 2^order 个 page 组成，即一个 order 对应了一个 page 数组
- 同样大小的 page 数组通过链表连接，`zone::free_area::free_list[i]` 是链表的头节点
- 同样的大小的 page 数组还通过迁移类型进行分类

```c
struct zone {
    struct free_area free_area[MAX_ORDER]; // MAX_ORDER=11
    // ...
};
struct free_area {
    struct list_head free_list[MIGRATE_TYPES];  // struct page 链表的头节点
    unsigned long nr_free;                      // 所有链表的所有节点的数量之和
};
enum migratetype {
    MIGRATE_UNMOVABLE,
    MIGRATE_MOVABLE,
    MIGRATE_RECLAIMABLE,
    MIGRATE_PCPTYPES, /* the number of types on the pcp lists */
    MIGRATE_HIGHATOMIC = MIGRATE_PCPTYPES,
    MIGRATE_CMA,
    MIGRATE_ISOLATE, /* can't allocate from here */
    MIGRATE_TYPES
};
```

---

为什么要引入 migratetype？减小内存碎片，举例如下：

- 第一个请求了 256 页的块做长期使用；第二个请求 256 页的相邻块（与第一个互为伙伴）临时使用
- 第三个请求了 256 页的块做长期使用；第四个请求 256 页的相邻块（与第三个互为伙伴）临时使用
- 临时缓冲区（第二个块和第四个块）不久后被释放，但它们不是伙伴，因此不能合并成 512 页的块，导致出现内存碎片
- 这个问题背后的根本原因是伙伴系统仅仅把大小相同的空闲页帧块组织在一个链表里面，却没有考虑这些页帧的行为特征

migratetype:

- `MIGRATE_UNMOVABLE` 的页帧就是内核长期使用的页帧，较少回收也较少迁移
- `MIGRATE_RECLAIMABLE` 的页帧主要用作磁盘页缓存（Page Cache），在内存紧张时会进行回收
- `MIGRATE_MOVABLE` 的页帧主要给用户态应用程序使用，可以在需要的时候进行迁移
- `MIGRATE_HIGHATOMIC` 是保留给高优先级分配请求使用的页帧
- `MIGRATE_CMA` 的页帧是可迁移的并且能够通过迁移组合成连续的大块

---

## buddy info

```bash
# 可以通过 `/proc/buddyinfo` 查看不同 migratetype 的 page 数：
Node 0, zone      DMA      0      0      0      0      0      0      0      0      1      1      2
Node 0, zone    DMA32     79     31     14      8      6      7      2      3      5      3    338
Node 0, zone   Normal  24226  54553  21227  11612   3748   1612    649    227     90     28     23

# /proc/pagetypeinfo 可以看到已经被分配的 order 0-10 的 page
Page block order: 9
Pages per block:  512

Free pages count per migrate type at order       0      1      2      3      4      5      6      7      8      9     10
Node    0, zone      DMA, type      Isolate      0      0      0      0      0      0      0      0      0      0      0
Node    0, zone    DMA32, type      Isolate      0      0      0      0      0      0      0      0      0      0      0
Node    0, zone   Normal, type      Isolate      0      0      0      0      0      0      0      0      0      0      0

Number of blocks type     Unmovable      Movable  Reclaimable   HighAtomic          CMA      Isolate
Node 0, zone      DMA            3            5            0            0            0            0
Node 0, zone    DMA32            9          922           26            0            0            0
Node 0, zone   Normal          266        10216          766            0            0            0
```

---

buddy API：

```c
/* 分配单独的一个页帧和连续的多个页帧 */
struct page *alloc_pages(gfp_t gfp, unsigned order);
#define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)

// 两个 API 也是分配单独的一个页帧和连续的多个页帧，但它们返回的是第一个页面本身的 va
unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
#define __get_free_page(gfp_mask) __get_free_pages((gfp_mask), 0)

// 释放单独的一个页帧和连续的多个页帧
void __free_pages(struct page *page, unsigned int order);
#define __free_page(page) __free_pages((page), 0)

// 这两个API也用于释放单独的一个页帧和连续的多个页帧，但是参数是第一个页帧的 va
void free_pages(unsigned long addr, unsigned int order);
#define free_page(addr) free_pages((addr), 0)
```

---

buddy 分配页面：快速路径和慢速路径

```c
/* __alloc_pages()` 是 zone buddy 分配器的核心 */
struct page *__alloc_pages(gfp_t gfp, unsigned int order, int preferred_nid, nodemask_t *nodemask)
{
    // 步骤 1
    gfp_t alloc_gfp = gfp;
    struct alloc_context ac = {};
    unsigned int alloc_flags = ALLOC_WMARK_LOW;

    prepare_alloc_pages(gfp, order, preferred_nid, nodemask, &ac, &alloc_gfp, &alloc_flags);

    // 步骤 2：快速路径，不满足 zone watermark 的可能会转到 slowpath
    struct page *page = get_page_from_freelist(alloc_gfp, order, alloc_flags, &ac);
    if (likely(page)) return page;

    // 步骤 3：慢速路径
    alloc_gfp = current_gfp_context(gfp);
    ac.spread_dirty_pages = false;
    ac.nodemask = nodemask;
    return __alloc_pages_slowpath(alloc_gfp, order, &ac);
}
```

---

buddy 快速路径：

```c

```
