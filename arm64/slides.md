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

# ARMv8 架构学习

从软件的角度，ARMv8 包含了 AArch64 **指令集**（64 位），并前向兼容 ARMv7

---

# 指令集

又称为 instruction set architecture (ISA)

ISA 定义了支持的指令、数据类型、寄存器、内存管理、基本特性（例如内存模型、寻址模式、虚拟内存）

---

# 内容

- Cache
- VMSA (Virtual Memory System Architecture)
- ARMv8 内存模型

---

# 相关术语

**IA**, Input address; **OA**, Output address; **VA**, Virtual Address; **PA**, Physical Address

**MMU**，Memory Management Unit（MMU 在 ARMv8 手册中也被称为 Translation Regimes）：将 VA 转化为 PA

**EL**, Exception Level：

- kernel 和 userspace 运行在不同的异常等级下，不同异常等级可以实现权限管理
- userspace-EL0, kernel-EL1, 虚拟化-EL2

**TLB**：Translation lookup table，页表的 Cache

**Granule Size**：ARMv8 手册中表示页表大小

---

# 前置知识：虚拟地址

虚拟地址用于隔离各个程序；开启 MMU 后，系统的所有程序（包括 kernel 和 userspace）都运行在虚拟地址上

MMU 负责将虚拟地址翻译为物理地址，这种翻译也称为映射，映射的大小是以页为单位的，页的大小通常是 4K

建议观看这个[视频](https://www.bilibili.com/video/BV1bf4y147PZ?p=23)学习分页机制

arm64 Linux 默认是 4 级（pgd, pud, pmd, pte）页表，其在 4K 页表下的虚拟地址组成：

- 64 位的虚拟地址只用到了 48 位
- bit 63 最高位表示是虚拟地址属于 kernel (0) 还是 userspace (1)

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

# Cache

- 根据访问速度分类：L1, L2, L3
- 根据用途分类：D-cache (data) 和 I-cache (Instruction)

ARMv8 的多级 Cache 结构：

<img src="/174171518259495.png" class="h-40 rounded shadow" />

**Cache-line**

- Cache 的基本组成单位，也就是 Cache 缓存的最小内存大小就是 Cache 的大小
- 大小从 16 Byte 到 128 Byte，一般是 64 Byte

---

# Cache Miss

汇编指令寻址的地址不在 Cache 中，需要先从内存读取到 Cache

减小 Cache Miss 也是软件的一个优化方向，比如 linux kernel 就有许多 Cache 的优化策略：

- `____cacheline_aligned` 宏：使数据结构和 Cache line 对齐
- Static keys：动态修改跳转的分支，减小分支跳转导致的 I-cache miss，参考 Documentation/staging/static-keys.rst

一个可以感知到 Cache Miss 的例子（test/cache.cpp）

<br>

**ASID** (Address Space ID)，ARMv8 中减小 Cache flush 的机制

- 原本 TLB 只通过 VA 来判断是否出现 TLB miss
- 加入 ASID 后，TLB 可以通过 ASID+VA 来判断是否有 TLB miss
- ASID 是每一个进程分配一个，这样在切换进程后也无需 flush TLB

---

# VMSAv8-64 地址翻译系统

VMSA 涉及的寄存器：

- 页表在 ARMv8 中被统称为 translation tables，页表大小可以是 4/16/64KB
  - 配置的寄存器是 `TCR_EL1.TG[1|0]`
  - TG1 决定了 `TTBR1_EL1` 的页表大小，TG0 决定了 `TTBR0_EL1` 的页表大小
- OA 大小：`TCR_EL1.{I}PS`
- IA 大小：支持 2 个范围的 VA
  - `TCR_EL1.T0SZ` 用于指定地址较小的 VA 段大小，MMU 使用 `TTBR0_EL1`
  - `TCR_EL1.T1SZ` 用于指定地址较大的 VA 段大小，MMU 使用 `TTBR1_EL1`
- `TTBR0_EL1`/`TBR1_EL1` 保存了 pgd 的地址
