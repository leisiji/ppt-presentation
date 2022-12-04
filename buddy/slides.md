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

分配和释放都是围绕 order 的切割和合并展开的，buddy 的含义是具有相同的 order

---

## zone buddy

- 通过 blocks 管理空闲页面，每个都是 2^order 个 page 组成，即一个 order 对应了一个 page 数组
- linux 后来加入了迁移类型，进一步对同样大小的 page 数组进行分类
- 同样大小的 page 数组通过链表连接，`zone::free_area[order]::free_list[migratetype]` 是链表的头节点

```c
// 定位 buddy page 所在链表需要 2 个参数：zone::free_area[order]::free_list[migratetype]
struct zone {
    struct free_area free_area[MAX_ORDER];           // MAX_ORDER=11
    struct per_cpu_pages __percpu *per_cpu_pageset;  // 作为 free_area 的 per-cpu cache
};
struct free_area {
    struct list_head free_list[MIGRATE_TYPES];  // struct page 链表的头节点
    unsigned long nr_free;                      // 所有链表的所有节点的数量之和
    // ...
};
enum migratetype {
    MIGRATE_UNMOVABLE,
    MIGRATE_MOVABLE,
    MIGRATE_RECLAIMABLE,
    MIGRATE_PCPTYPES, /* the number of types on the pcp lists */
    // ...
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

buddy page 也是一种类型的 page，它们是归属 buddy 的空闲 page，通过 `PageBuddy` 宏去判断：

```c
struct page {
    union { struct { /* ... */ unsigned long private; /* buddy page 只用到了该字段 */ };
    }; // ...
    atomic_t _refcount; // 记录分配后的引用计数，为 0 时可以将该 page 归还到 buddy
};
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

## buddy 分配快速路径

遍历所有 zone：检查该 zone 是否满足水位需求（`WMARK_MIN`），若不满足触发 `node_reclaim()`，但不触发其他内存回收

```c
struct page *get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
                                    const struct alloc_context *ac)
{
    struct zone *zone;
    for_next_zone_zonelist_nodemask(zone, z, ac->highest_zoneidx, ac->nodemask) {
        // 从 __alloc_pages 可知，判断水位使用的是 WMARK_LOW
        unsigned long mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
        if (!zone_watermark_fast(zone, order, mark, ac->highest_zoneidx, alloc_flags, gfp_mask)) {
            // 回收内存
        }
        struct page *page = rmqueue(ac->preferred_zoneref->zone, zone, order, gfp_mask, alloc_flags, ac->migratetype);
        if (page) {
            prep_new_page(page, order, gfp_mask, alloc_flags);
            return page;
        }
    }
}
```

---

rmqueue

- order<=3 时尝试从 pcp 分配 `zone::per_cpu_pages` (15 个元素的数组)，从而减小锁的竞争
- order>3 从 `zone::free_area::free_list` 链表中获取

```c
struct page *rmqueue(struct zone *preferred_zone, struct zone *zone, unsigned int order,
                     gfp_t gfp_flags, unsigned int alloc_flags, int migratetype)
{
    // PAGE_ALLOC_COSTLY_ORDER=3
    if (order <= PAGE_ALLOC_COSTLY_ORDER && migratetype != MIGRATE_MOVABLE) {
        return rmqueue_pcplist(preferred_zone, zone, order, gfp_flags, migratetype, alloc_flags);
    }

    struct page *page;
    do {
        page = __rmqueue(zone, order, migratetype, alloc_flags);
    } while (page && check_new_pages(page, order));
    return page;
}
```

快速路径快的原因在于使用 pcp (per-cpu-pageset)，即每个 CPU 在每个 zone 缓存一个空闲 page 链表

---

`rmqueue_pcplist()` (per-cpu-pageset), order <= 3:

```c
struct per_cpu_pages {
    int count; /* 链表中的 page 数 */
    int high;  /* 每个 cpu 所能缓存的最多空闲页数目 */
    int batch; /* 每次 cpu 维护的空闲页不足时，向 buddy 一次申请的内存页数目；/proc/zoneinfo 有该值 */
    short free_factor;
    short expire;
    struct list_head lists[NR_PCP_LISTS]; /* 保存物理页的链表，NR_PCP_LISTS=15 (clangd) */
};
struct page *rmqueue_pcplist(struct zone *preferred_zone, struct zone *zone, unsigned int order,
                             gfp_t gfp_flags, int migratetype, unsigned int alloc_flags)
{
    struct per_cpu_pages *pcp = this_cpu_ptr(zone->per_cpu_pageset);
    pcp->free_factor >>= 1;
    struct list_head *list = &pcp->lists[order_to_pindex(migratetype, order)];
    if (list_empty(list)) {
        int alloced = rmqueue_bulk(zone, order, 1, list, migratetype, alloc_flags);
        pcp->count += alloced << order;
    }
    /* 将节点从 pcplists 中摘掉 */
    struct page *page = list_first_entry(list, struct page, lru);
    list_del(&page->lru);
    pcp->count -= 1 << order;
    return page;
}
```

---

`__rmqueue()` (zone free area), order > 3:

```c
struct page *__rmqueue(struct zone *zone, unsigned int order, int migratetype, unsigned int alloc_flags)
{
retry:
    struct page *page = __rmqueue_smallest(zone, order, migratetype);
    if (unlikely(!page)) {
        if (__rmqueue_fallback(zone, order, migratetype, alloc_flags)) goto retry;
    }
    return page;
}
struct page *__rmqueue_smallest(struct zone *zone, unsigned int order, int migratetype)
{
    for (int current_order = order; current_order < MAX_ORDER; ++current_order) {
        struct free_area *area = &(zone->free_area[current_order]);
        struct page *page = list_first_entry_or_null(&area->free_list[migratetype], struct page, lru);
        if (!page) continue;
        del_page_from_free_list(page, zone, current_order);  // 摘掉节点
        expand(zone, page, order, current_order, migratetype); // 分割 current_order，并插入到 zone 的其他 order 的链表
        page->index = migratetype;
        return page;
    }
    return NULL;
}
```

---

## buddy 分配慢速路径

- 动用保留页帧。即忽略 `WMARK_MIN` 水位线，对于高优先级分配请求才会动用保留页帧
  - 分配标志带 `ALLOC_HARDER` 的请求会将水位线降低 1/4；分配标志带 `ALLOC_HIGH` 或 `ALLOC_OOM` 的请求会将水位线降低 1/2
  - `ALLOC_HARDER` 可与 `ALLOC_HIGH` 结合，将水位线降低 3/4；`ALLOC_OOM` 也可与 `ALLOC_HIGH` 结合，将水位线降低到 0
- 内存规整压缩（`__alloc_pages_direct_compact()`）
  - 只有 migratetype 为 `MIGRATE_MOVABLE` 和 `MIGRATE_CMA` 的页帧才允许迁移
- 回收 Slab Cache 和 Page Cache，回收方式是直接丢弃 clean Page Cache（`__alloc_pages_direct_reclaim()`, `try_to_free_pages()`）
- 写回 Buffer：磁盘脏缓冲区页叫 Block Buffer (`__alloc_pages_direct_reclaim()`, `try_to_free_pages()`)
  - Block Buffer 本质是基于 Page Cache，Buffer 包含的实际上都是文件映射页中的脏页，必须回写
- Swap：匿名映射页不像文件映射页那样存在唯一对应的 back file，所以只能换出到 Swap 分区或 Swap 文件（`__alloc_pages_direct_reclaim()`, `try_to_free_pages()`）

---

## 归还 page 给 buddy

单个页帧的释放也是先放回 pcplist 再是 `zone::free_area[order]::free_list[migratetype]` 链表

- 如果 PCP 的总页帧数超过了 PCP 的上限，则通过 `free_pcppages_bulk()` 归还 batch 个页帧到空闲链表
- `free_pcppages_bulk()` 的核心是循环调用 `__free_one_page()` 释放每一个页帧
- 释放页帧时，如果存在 buddy，把两个页进行递归合并

```c
/* 释放 alloc_pages() 返回的页 */
void __free_pages(struct page *page, unsigned int order)
{
    if (0 == atomic_dec_and_test(&page->_refcount))
        free_the_page(page, order);
    else if (!PageHead(page))
        while (order-- > 0) free_the_page(page + (1 << order), order);
}
void free_the_page(struct page *page, unsigned int order)
{
    if (order < PAGE_ALLOC_COSTLY_ORDER || order == pageblock_order)
        free_unref_page(page, order);
    else
        __free_pages_ok(page, order, FPI_NONE);
}
```

---

归还到 pcp 的流程：

```c
void free_unref_page(struct page *page, unsigned int order)
{
    unsigned long pfn = page_to_pfn(page);
    if (!free_unref_page_prepare(page, pfn, order)) return;
    int migratetype = page->index;
    free_unref_page_commit(page, pfn, migratetype, order);
}
void free_unref_page_commit(struct page *page, unsigned long pfn, int migratetype,
                            unsigned int order)
{
    struct zone *zone = page_zone(page);
    struct per_cpu_pages *pcp = this_cpu_ptr(zone->per_cpu_pageset);

    int pindex = order_to_pindex(migratetype, order); // 通过 order 和 migratetype 定位 pcp
    list_add(&page->lru, &pcp->lists[pindex]);
    pcp->count += 1 << order;

    int high = nr_pcp_high(pcp, zone);
    if (pcp->count >= high) {
        int batch = READ_ONCE(pcp->batch);
        free_pcppages_bulk(zone, nr_pcp_free(pcp, high, batch), pcp);
    }
}
```
