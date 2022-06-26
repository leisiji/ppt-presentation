---
# try also 'default' to start simple
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://source.unsplash.com/collection/94734566/1920x1080
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

# Node-Zone-Page

---

- Node-Zone-Page 名词解释
- 通过 procfs 了解 zone

---

### Node, Zone

NUMA (Non Uniform Memory Access) 系统上有多个 CPU，CPU 与不同位置的内存的延迟不同，每个 node 就是一个 CPU，不同位置的内存属于不同的 node

node, zone:

- Node 是从内存亲和性出发的定义，看到的表现是地址上的分布
- Zone 是根据地址范围来定义，不论系统上的内存大小是多少，每个 zone 的空间是一定的，如 `ZONE_DMA` 一定是 16M 以下的空间

通过 `memblock_add()` 添加物理内存，有了物理内存才可以初始化 zone：

```c
/* 传统的 arm64 是通过 dts 初始化物理内存 */
int early_init_dt_scan_memory(unsigned long node, const char *uname, int depth, void *data)
{
    const __be32 *reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
    while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
        u64 base = dt_mem_next_cell(dt_root_addr_cells, &reg),
            size = dt_mem_next_cell(dt_root_size_cells, &reg);
        memblock_add(base, size);
    }
}
```

---

### node->zone->page

以 `arm64_defconfig` 为例（UMA），讲解层级关系：

- CPU 有 1 个 node（`node_data` 数组）
- 每个 node 下有 4 个 zone（`node_zones` 数组: DMA, DMA32, Normal, Movable）
- 每个 zone 下有 11 种 order 的 `free_area`
- 每个 `free_area` 有 6 种 migratetype 的 `free_list`，`nr_free` 是所有链表的所有节点数
- 每个 `free_list` 上串连了 page（`page::lru`）

```c
struct pglist_data *node_data[MAX_NUMNODES];
typedef struct pglist_data { struct zone node_zones[MAX_NR_ZONES]; /*... */ };
struct zone { struct free_area free_area[MAX_ORDER]; /*... */ };
struct free_area {
    struct list_head free_list[MIGRATE_TYPES];
    unsigned long nr_free;
};
struct page {
    union {
        struct { struct list_head lru; /* ... */ };
    }; //..
};
```

---

### zoneinfo

通过 `/proc/zoneinfo` 认识 zone，以下为 `arm64_defconfig` 的结果：

```bash
# 除了 DMA 外，其他 zone 全是 0，所有的内存都添加到了 node 0，也说明了 arm64 可以使用任意物理地址的内存作为 DMA
Node 0, zone      DMA
  per-node stats
      nr_inactive_anon 128
      nr_active_anon 418
  pages free     245310
        boost    0
        min      5632
        low      7040
        high     8448
        spanned  262144
        present  262144
        managed  250112
        cma      8192
```

- 高于 high 时说明剩余内存充足；低于 low 但高于 min 时说明内存短缺但是仍可分配，此时会唤醒 kswapd 去异步回收；若低于 min 则说明剩余内存极度短缺将停止分配并全力回收
- spanned：zone 能够容纳页数，包括空洞；present：zone 真实存在的页数；managed：buddy 子系统管理的页数（减去了 reserved）
