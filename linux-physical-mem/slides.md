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

# Linux 物理内存管理

---

- AArch64 虚拟地址空间
- Linux 虚拟内存分配接口
- Node-Zone-Page
- 通过 procfs 了解 node 以及 zone
- Linux 如何添加物理内存

---

#### AArch64 虚拟地址空间

AArch64 Linux 在 4KB pages + 4 levels (48-bit) 下的虚拟地址空间的内存布局：

```txt
Start             End                Size     Use
-----------------------------------------------------------------------
0000000000000000  0000ffffffffffff   256TB    user
ffff000000000000  ffff7fffffffffff   128TB    kernel logical memory map (kmalloc 也在这里)
[ffff600000000000 ffff7fffffffffff]   32TB    [kasan shadow region]
ffff800000000000  ffff800007ffffff   128MB    bpf jit region
ffff800008000000  ffff80000fffffff   128MB    modules
ffff800010000000  fffffbffefffffff   124TB    vmalloc
fffffbfff0000000  fffffbfffdffffff   224MB    fixed mappings (top down)
fffffbfffe000000  fffffbfffe7fffff     8MB    [guard region]
fffffbfffe800000  fffffbffff7fffff    16MB    PCI I/O space
fffffbffff800000  fffffbffffffffff     8MB    [guard region]
fffffc0000000000  fffffdffffffffff     2TB    vmemmap
fffffe0000000000  ffffffffffffffff     2TB    [guard region]
```

虚拟地址空间的每个区间基本是编译时通过宏就确定下来的，注意，虚拟内存的布局和物理内存没有任何关系；Linux 的虚拟内存和物理内存是分开管理的，物理内存最重要的接口就是 `__get_free_pages()`，虚拟内存就是通过该接口获取实际的物理内存；虚拟内存管理方式有多种，其中一种叫做 slab

```c
unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order); // 返回的是物理地址，映射到哪个虚拟地址由调用者决定
```

---

#### Linux 虚拟内存分配接口

`kmalloc` 是有最大限制的，实际的限制取决于硬件以及 kernel config，推荐分配内存要小于一个页：

```c
/* gfp_t 是 get free page 的缩写，最常用的是 GFP_KERNEL */
void *kmalloc(size_t size, gfp_t flags);
void *kzalloc(size_t size, gfp_t flags); // 内存会被设置为 0

// 分配一个数组
void *kmalloc_array(size_t n, size_t size, gfp_t flags);
// 分配一个数组并初始化为 0
void *kcalloc(size_t n, size_t size, gfp_t flags);

void kfree(const void *objp);
```

kmalloc 返回的物理地址空间是连续的，而 vmalloc 的是不连续，vmalloc 适合申请大内存：

```c
void *vmalloc(unsigned long size);
void *vzalloc(unsigned long size); // 内存初始化为 0

/* 先会使用 kmalloc，若超过其最大限制导致失败，会再尝试使用 vmalloc */
void *kvmalloc(size_t size, gfp_t flags);
/* 可释放 kmalloc, vmalloc, kvmalloc 的内存 */
void kvfree(const void *addr);
```

---

#### Node, Zone

NUMA (Non Uniform Memory Access) 系统上有多个 CPU，CPU 与不同位置的内存的延迟不同，每个 Node 可以看作是一个 CPU

> 为什么要把多个 CPU 做成一个 CPU，而不是做一个超多核的 CPU？

Node, Zone:

- Node 可以是从内存亲和性出发的定义，看到的表现是地址上的分布
- Zone 是根据地址范围来定义，不论系统上的内存大小是多少，每个 zone 的空间是一定的，如 `ZONE_DMA` 一定是 16M 以下的空间

---

#### Page

- Linux 物理内存管理的最小单位，通常配置为 4K 的大小，该值其实是和 MMU 相关的，但绝大多数 CPU 都会遵循这个规定去设计 MMU
- 物理页是通过虚拟地址以及多级页表找到的，多级页表机制此处不做展开

AArch64 虚拟地址的比特位含义：

```txt
+----------------------------------------------------------+
|63        48|47   39|38   30|29    21|20    12|11        0|
+----------------------------------------------------------+
 |              |        |       |         |       |
 |              |        |       |         |       v
 |              |        |       |         |   [11:0] in-page offset
 |              |        |       |         +-> [20:12] pte index
 |              |        |       +-----------> [29:21] pmd index
 |              |        +-------------------> [38:30] pud index
 |              +----------------------------> [47:39] pgd index
 +-------------------------------------------> [63] TTBR0/1
```

---

### node->zone->page

以 `arm64_defconfig` 为例（UMA），讲解层级关系：

- CPU 有 1 个 node（`node_data` 数组）
- 每个 node 下有 4 个 zone（`node_zones` 数组: DMA, DMA32, Normal, Movable）
- 每个 zone 下有 11 种 order 的 `free_area`（**buddy**）
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

#### zoneinfo

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

---

#### Linux 如何添加物理内存 (arm64 dts)

通过 `memblock_add()` 添加物理内存，有了物理内存才可以初始化 zone：

```c
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

起始地址为 0x40000000，长度为 0x40000000，即物理内存地址为 [0x40000000, 0x80000000]

```txt
/ {
    #size-cells = <0x02>;
    #address-cells = <0x02>;
    memory@40000000 {
        reg = <0x00 0x40000000 0x00 0x40000000>;
        device_type = "memory";
    };
};
```

---

#### Linux 如何添加物理内存 (x86 e820)

x86 初始化物理内存需要一个额外的硬件 e820：

```c
void e820__memblock_setup(void)
{
    for (i = 0; i < e820_table->nr_entries; i++) {
        struct e820_entry *entry = &e820_table->entries[i];
        // ..
        memblock_add(entry->addr, entry->size);
    }
}
void detect_memory_e820(void)
{
    struct biosregs ireg, oreg;
    struct boot_e820_entry *desc = boot_params.e820_table;
    struct boot_e820_entry buf; /* static so it is zeroed */

    ireg.di  = (size_t)&buf;
    // ...
    do {
        intcall(0x15, &ireg, &oreg);
        count++;
        *desc++ = buf;
    } while (ireg.ebx && count < ARRAY_SIZE(boot_params.e820_table));
}
```

---

#### memblock 是 kernel 启动阶段的简单内存分配器：

```c
int memblock_add(phys_addr_t base, phys_addr_t size);
int memblock_remove(phys_addr_t base, phys_addr_t size);
// 申请内存
void *memblock_alloc(phys_addr_t size, phys_addr_t align); // 返回 va
phys_addr_t memblock_phys_alloc(phys_addr_t size, phys_addr_t align); // 返回 pa
```

memblock 的实现非常简单，它管理了两个 `struct memblock_region` 数组（**为什么使用数组？**）：

- memblock.memory：所有物理上可用的内存区域都会被添加到该区域
- memblock.reserved：被分配或者被系统占用的区域则会添加到该区域

```c
struct memblock memblock __initdata_memblock = {
    .memory.regions   = memblock_memory_init_regions,
    .memory.cnt       = 1, /* empty dummy entry */
    .memory.max       = INIT_MEMBLOCK_REGIONS,
    .memory.name      = "memory",
    .reserved.regions = memblock_reserved_init_regions,
    .reserved.cnt     = 1, /* empty dummy entry */
    .reserved.max     = INIT_MEMBLOCK_RESERVED_REGIONS,
    .reserved.name    = "reserved",
};
```

[扩展阅读](https://richardweiyang-2.gitbook.io/kernel-exploring/00-memory_a_bottom_up_view/02-memblock)

---

#### Node 初始化

<div class="grid grid-cols-2 gap-x-4">

<div>

UMA

```c
// 将所有内存都添加到 Node 0
int dummy_numa_init(void)
{
    phys_addr_t start = memblock_start_of_DRAM();
    phys_addr_t end = memblock_end_of_DRAM() - 1;
    numa_add_memblk(0, start, end + 1);
}
```

</div>

<div>

NUMA

```c
// ACPI 初始化 numa
int arch_acpi_numa_init(void)
{
    acpi_numa_init();
    return srat_disabled() ? -EINVAL : 0;
}
```

</div>

</div>

#### zone 初始化

```c
void zone_sizes_init(unsigned long min, unsigned long max)
{
    /* 每个 zone 的最大 page frame number */
    unsigned long max_zone_pfns[MAX_NR_ZONES] = {0};

    // zone_dma_bits 从 32, dts dma-ranges, acpi table 这 3 者选出最小的
    unsigned int zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
    max_zone_pfns[ZONE_DMA] = PFN_DOWN(max_zone_phys(zone_dma_bits));

    /* max_zone_phys(n) = min(memblock_end_of_DRAM(), 1<<n) */
    max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_phys(32));

    max_zone_pfns[ZONE_NORMAL] = max;
    /* 这里贴出 gdb 的 p/x max_zone_pfns：{0x80000, 0x80000, 0x80000, 0x0} */

    free_area_init(max_zone_pfns);
}
```
