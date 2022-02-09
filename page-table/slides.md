---
# try also 'default' to start simple
theme: seriph
layout: 'intro'
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

# 内容

- 名词介绍：MMU (Memory Management Unit), va (Virtual address), pa (Physical address)
- 为什么需要多级页表
- Linux 的多级页表机制
- 通过调试 Linux 验证学习中的理解：clangd, qemu+gdb

辅助理解的文章：https://www.cnblogs.com/LoyenWang/p/11406693.html

---

# 虚拟地址和物理地址

虚拟地址最大的特点就是：地址由操作系统自身决定，地址的值是由软件定义的，并且不同硬件平台的的大多数虚拟地址范围含义相同

<div class="grid grid-cols-2 gap-x-4">

<div>

arm64 虚拟地址（4K 页表）各个比特位的含义（Documentation/arm64/memory.rst）：

| 比特位  | 含义           |
| ---     | ---            |
| [11:0]  | in-page offset |
| [20:12] | pte index      |
| [29:21] | pmd index      |
| [38:30] | pud index      |
| [47:39] | pgd index      |
| [63]    | TTBR0/1        |

</div>

<div>

物理地址和 CPU 以及内存硬件都有关系，比如 arm64 dts 中就有一个内存用于描述内存起始地址和大小：

```txt
/ {
    // -m size=1024M 导出的内存节点
    memory@40000000 {
        reg = <0x00 0x40000000 0x00 0x40000000>;
        device_type = "memory";
    };
}
```
</div>

</div>

---

# MMU (Memory Management Unit)

MMU 其中一个功能就是将虚拟地址转换物理地址：提取虚拟地址的比特位，定位页表项并获取其保存的物理地址，找到下级页表或物理页，结合页内偏移就是物理地址

虚拟地址转换为物理地址也叫做映射：

- 映射粒度：VA 到 PA 映射的单位大小是页 (Page)，页大小一般为 4K
- 页帧 (Page Frame) 指物理内存中的一页内存
- 页表：这里将页目录（PGD, PUD, PMD）和页表（PTE）都统称页表

<img src="/207305615268480.png" class="h-60" />

---

# 为什么需要多级页表

32 位 linux 使用 2 级页表，到了 64 位时代，就到了 4 级页表，页表的级数增长主要和地址空间大小相关

- 4K 页表的 32 位 linux
  - 指针大小为 4 字节，一个页表可以有 4K/4 = 1024 个页表项
  - 2 级页表能够表达的地址空间就是：1024 * 1024 * 4K = 2^(10+10+12) = 2^32
- 4K 页表的 64 位 linux
  - 指针大小为 8 字节，一个页表可以有 4k/8 = 512 个页表项
  - 4 级页表能够表达的地址空间就是：512^4 * 4K = 2^(9*4+12) = 2^48

在某些 64 位平台上，也不一定需要用完 48 位的地址空间，比如 mt9652 就是 39

```txt
# linux kernel 中页表相关的配置
CONFIG_PGTABLE_LEVELS=4
CONFIG_ARM64_VA_BITS_48=y
CONFIG_ARM64_VA_BITS=48
CONFIG_ARM64_PA_BITS_48=y
CONFIG_ARM64_PA_BITS=48
CONFIG_ARM64_4K_PAGES=y
# CONFIG_ARM64_VA_BITS_39 is not set
```

---

# VA 转化为 PA（kernel）

<div class="grid grid-cols-3 gap-x-2">

<div class="col-span-1">
Linux 页表定义：

```c
typedef struct { u64 pte; } pte_t;
typedef struct { u64 pmd; } pmd_t;
typedef struct { u64 pud; } pud_t;
typedef struct { u64 pgd; } pgd_t;
```
</div>

<div class="col-span-2">
`virt_to_kpte` 很好地展示了通过 va 查找每级页表的过程：

```c
pte_t *virt_to_kpte(unsigned long vaddr) {
    pmd_t *pmd = pmd_off_k(vaddr);
    return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
}
pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address) {
    return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
}
pmd_t *pmd_off_k(unsigned long va) {
    return pmd_offset(pud_offset(p4d_offset(
                      pgd_offset_k(va), va), va), va);
}
// 这里只展示 pmd_offset，而 pud_offset ... 都是类似的
pmd_t *pmd_offset(pud_t *pud, unsigned long address) {
    return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
}
// _va 将 kernel pa 转化为 va
unsigned long pmd_page_vaddr(pmd_t pmd) {
    return (unsigned long)__va(pmd_page_paddr(pmd));
}
phys_addr_t pmd_page_paddr(pmd_t pmd) {
    return pmd.pmd & PTE_ADDR_MASK; // 0xfffff000
}
```

</div>

</div>

---

# 思考

<br>

`__va` 不能转化 kernel img pa 为 va？

- kernel img 通过符号表达地址，其地址不是动态的
- 少有通过 pa 获取 va 场景，通常是用 `pa_symbol` 获取符号的物理地址
- 若有 pa2va 需求，还有 `__phys_to_kimg` 可以使用

`__phys_to_virt` 没有判断是否处于 linear map？因为 kernel img pa 是由 bootloader 决定的，无法在编译时知道


---

# Linux 的多级页表机制

Linux 的多级页表机制是基于硬件的，但是业界对 CPU 都达成了公式，都在 MMU 实现了多级页表的机制

Linux 的 4 级页表名称：PGD, PUD, PMD, PTE

虚拟地址：各级页表项的索引 + 页内偏移

各级页表项的索引计算如下，而页内偏移就是 va 的低 12 位

```c
// 页表项的定义：页表项本质是一个 u64，它的值就是下一级页表起始物理地址
typedef struct { pteval_t pte; } pte_t; // typedef u64 pteval_t;
typedef struct { pmdval_t pmd; } pmd_t; // typedef u64 pmdval_t;
typedef struct { pudval_t pud; } pud_t; // typedef u64 pudval_t;
typedef struct { pgdval_t pgd; } pgd_t; // typedef u64 p4dval_t;

/* 每级页表的 shift 分别为 39, 30, 21, 12, PTRS_PER_PXX 都是 512 */
#define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
unsigned long pud_index(unsigned long address) { return (address >> PUD_SHIFT) & (PTRS_PER_PUD - 1); }
unsigned long pmd_index(unsigned long address) { return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1); }
unsigned long pte_index(unsigned long address) { return (address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1); }
```

---

# 获取页表项值

页表项值 (`pxx_page_paddr` 宏)，代码中只能访问虚拟地址（`pxx_page_vaddr` 宏），但是可以往虚拟地址写入物理地址

```c
phys_addr_t p4d_page_paddr(p4d_t p4d) {
    return __p4d_to_phys(p4d);
}
phys_addr_t pud_page_paddr(pud_t pud) {
    return __pud_to_phys(pud); // __pud_to_phys 本质就是 pud_t.pud
}
phys_addr_t pmd_page_paddr(pmd_t pmd) {
    return __pmd_to_phys(pmd);
}

// pxx_page_vaddr 比较常用，因为代码读取或写入页表项都只能通过 va 进行
#define pgd_page_vaddr(pgd)   (p4d_page_vaddr((p4d_t){ pgd }))
unsigned long p4d_page_vaddr(p4d_t p4d) {
    return (unsigned long)__va(p4d_page_paddr(p4d));
}
unsigned long pmd_page_vaddr(pmd_t pmd) {
    return (unsigned long)__va(pmd_page_paddr(pmd));
}
unsigned long pud_page_vaddr(pud_t pud) {
    return (unsigned long)__va(pud_page_paddr(pud));
}
```

---

# 页表项

获取页表项 va 有多种接口，不同接口的输入参数不同，而且名字风格也有不同：

| 接口名                      | 输入参数                   |
| ---                         | ---                        |
| `[pgd,pud,pmd]_offset`      | 上级页表项和 va            |
| `pgd_offset_pgd`            | pgd 首地址和 va            |
| `pgd_offset_k`              | kernel va                  |
| `pmd_off`                   | mm 和 va                   |
| `pmd_off_k`                 | kernel va                  |
| `virt_to_kpte`              | kernel va                  |
| `pte_offset_kernel()`       | 上级页表项 pmd 和 va       |

---

# 页表项相关代码

这里只有 pmd 和 pte 的代码，其他参考源码进行类比即可

pmd:

```c
// 可以用于 userspace 和 kernel va
pmd_t *pmd_offset(pud_t *pud, unsigned long address) { return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address); }
// 可以用于 userspace 和 kernel va
pmd_t *pmd_off(struct mm_struct *mm, unsigned long va) { return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va); }
// 只能用于 kernel va
pmd_t *pmd_off_k(unsigned long va) { return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va); }
```

pte:

```c
pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address) {
    return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
}
pte_t *virt_to_kpte(unsigned long vaddr) {
    pmd_t *pmd = pmd_off_k(vaddr);
    return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
}
```

---

# 页表项相关代码

其他 2 个宏：

`pxx_offset_kimg`：

- 输入上级页表项和 va，也是返回页表项 va
- 但是只能用于处在 kernel img 的页表如 `bm_pud`（用到了 `__phys_to_kimg`）

`pxx_offset_phys`：输入上级页表项和 va，但是返回页表项 pa

```c
#define pmd_offset_kimg(dir, addr)                                             \
    ((pmd_t *)__phys_to_kimg(pmd_offset_phys(dir, addr)))

#define pmd_offset_phys(dir, addr)                                             \
    (pud_page_paddr(READ_ONCE(*(dir))) + pmd_index(addr) * sizeof(pmd_t))
```

---

# qemu+gdb 调试 linux

软件：qemu, qemu-arch-extra, aarch64-linux-gnu-gdb, aarch64-linux-gnu-gcc, cpio

步骤：

- 制作 initrd
- 编译 kernel
- qemu 启动 kernel，并进入监听状态，等待 gdb 连接
- 启动 gdb，之后可以加入断点、打印变量、单步调试

---

# 制作 initrd 和编译 kernel

```bash
# 首先要制作 initrd：
wget https://busybox.net/downloads/busybox-1.34.1.tar.bz2
tar -jxvf busybox-1.31.0.tar.bz2
cd busybox-1.33.2
# 选择 Settings -> Build static binary (no shared libs)
# Settings -> Cross compiler prefix 填入 aarch64-linux-gnu-
make menuconfig
make && make install
cd _install
mkdir dev && cd dev
sudo mknod console c 5 1
sudo mknod null c 1 3
sudo mknod tty1 c 4 1
sudo mknod tty2 c 4 2
sudo mknod tty3 c 4 3
sudo mknod tty4 c 4 4
cd ..
find . | cpio -o -H newc |gzip > ../rootfs.cpio.gz

# 编译 kernel：生成的内核镱像位于 arch/arm[64]/boot/zImage
make ARCH=arm64 defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8
```

---

# qemu 启动 kernel

gdb 调试 kernel，qemu 必须加 nokaslr，否则无法插入断点

```bash
qemu-system-aarch64 \
    -machine virt \
    -nographic \
    -m size=1024M \
    -cpu cortex-a57 \
    -smp 1 \
    -kernel arch/arm64/boot/Image \
    --append "console=ttyAMA0 rdinit=/linuxrc nokaslr" \
    -initrd ~/rootfs.cpio.gz \
    -S -s
```

gdb

```bash
aarch64-linux-gnu-gdb vmlinux -ex "target remote:1234" -tui
```

---

# clangd+vscode 阅读 linux 源码

优势：

- 可以显示宏的值
- 基于语义查找定义、引用、调用树
- arm64 代码的定义不会跳转到 x86 的定义上，会根据编译结果查找

利用 `scripts/clang-tools/gen_compile_commands.py` 脚本生成 `compile_commands.json`

- clangd 会根据 `compile_commands.json` 生成代码索引
- 该脚本在高版本的 kernel 源码树中，但在低版本的源码也可以工作
