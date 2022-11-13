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

# slub

基于 buddy 的小内存分配器

---

# slub 分类和 API

slub 有 3 类快速缓存（相应的也有 3 类 slab 和 3 类内存对象）：元快速缓存、通用快速缓存和专用快速缓存

- 元快速缓存是快速缓存的快速缓存（即 `kmem_cache` 和 `kmem_cache_node`），分别保存于变量 `kmem_cache` 和 `kmem_cache_node`
- 通用快速缓存大小是 2 的 n 次方（8 字节 ~ 2 个页的大小），保存于二维数组 `kmalloc_caches[NR_KMALLOC_TYPES][KMALLOC_SHIFT_HIGH + 1]`
- 专用快速缓存对应于某种特定的数据结构

通用 slab API 包括 kmalloc 和 kfree，专用 slab API：

```c
struct kmem_cache *kmem_cache_create(const char *name, unsigned int size, unsigned int align,
                                     slab_flags_t flags, void (*ctor)(void *));
void *kmem_cache_alloc(struct kmem_cache *s, gfp_t gfpflags);
void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node);

void kmem_cache_destroy(struct kmem_cache *s);
void kmem_cache_free(struct kmem_cache *s, void *x); // 释放一个专用 slub 对象
```

---

slub 中的主要数据结构包括快速缓存描述符 `kmem_cache`、CPU 管理数据 `kmem_cache_cpu` 和节点管理数据 `kmem_cache_node`

```c
struct kmem_cache {
    struct kmem_cache_cpu __percpu *cpu_slab; /* per-CPU */

    unsigned int size;        /* 包含元数据在内的对象的大小 */
    unsigned int object_size; /* 不包含元数据的对象的大小 */
    unsigned int offset;

    unsigned int cpu_partial; /* 本地 cpu partial 链表需要维持的空闲对象数量，不能大于该值 */
    unsigned int cpu_partial_slabs; /* 本地 cpu partial 链表需要维持的 page 数量，不能大于该值 */

    struct kmem_cache_order_objects oo; /* 高 16 位是 buddy order，低 16 位是 slab 的对象个数 */

    int refcount;                               /* 用于 slab cache 销毁 */
    const char *name;                           /* Name (only for display!) */
    struct list_head list;                      /* slab_caches 链表上的节点 */
    struct kobject kobj;                        /* For sysfs */
    struct kmem_cache_node *node[MAX_NUMNODES]; /* per-node */
};
struct kmem_cache_order_objects {
    unsigned int x;
};
```

---

slub page：`struct slab` 复用了 struct page 的比特位（`PG_slab`）；`page_slab(x)` 宏可以转化 slab 和 page

```c
struct slab {
    unsigned long __page_flags;

    union {
        struct list_head slab_list;  // kmem_cache_node::partial 链表的节点
        struct rcu_head rcu_head;
        struct {
            struct slab *next; /* 下一个空闲的 struct slab */
            int slabs;         /* Nr of slabs left */
        };
    };
    struct kmem_cache *slab_cache;
    void *freelist; /* first free object */
    union {
        unsigned long counters;
        struct {
            unsigned inuse : 16;
            unsigned objects : 15;
            unsigned frozen : 1;
        };
    };
    atomic_t __page_refcount;
};
```
