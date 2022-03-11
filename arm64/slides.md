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

ARMv8 是 arm 的 64 位指令集

指令集又称为 instruction set architecture (ISA)，ISA 定义了支持的指令、数据类型、寄存器、内存管理、基本特性（例如内存模型、寻址模式、虚拟内存）

---

# 内容

- ARMv8 手册的术语
- Cache
  - Cache-line
  - Cache Miss
- VMSA (Virtual Memory System Architecture)
  - ARMv8 的寻址方式
  - VMSA 地址翻译系统
- 寄存器
  - `TCR_ELx` 寄存器
- head.S 简单导读

---

# 相关术语（前置知识：虚拟地址）

**IA**, Input address; **OA**, Output address; **VA**, Virtual Address; **PA**, Physical Address

**MMU**，Memory Management Unit（MMU 在 ARMv8 手册中也被称为 Translation Regimes）：将 VA 转化为 PA

**EL**, Exception Level：

- kernel 和 userspace 运行在不同的异常等级下，不同异常等级可以实现权限管理
- userspace-EL0, kernel-EL1, 虚拟化-EL2

**Translation Tables**：页表

**TLB**：Translation Lookaside Buffers，页表的 Cache

**Granule Size**：在 ARMv8 手册中，它表示页表的大小

---

# Cache

<div class="grid grid-cols-2 gap-x-4">

<div>

Cache 分类：

- 根据访问速度分类：L1, L2, L3
- 根据用途分类：D-cache (data) 和 I-cache (Instruction)
- 查询 cache 的地址可以是 VA 或 PA，还可以是 2 者的组合

</div>

<div>

ARMv8 的多级 Cache 结构：

<img src="/174171518259495.png" class="h-60 rounded shadow" />

**Cache-line** 是 Cache 的基本组成单位，从 16 Byte 到 128 Byte，一般是 64 Byte

CPU 的内存访问指令本质：先从内存填入各级 Cache，CPU 再访问 Cache；这一个过程是 CPU 自动完成的

</div>

</div>

---

# Cache Miss

汇编指令寻址的地址不在 Cache 中，需要先从内存读取到 Cache

减小 Cache Miss 也是软件的一个优化方向，比如 linux kernel 就有许多 Cache 的优化策略：

- `____cacheline_aligned` 宏：使数据结构和 Cache line 对齐
- Static keys：动态修改跳转的分支，减小分支跳转导致的 I-cache miss，参考 static-keys.rst

> 一个可以感知到 Cache Miss 的例子（test/cache.cpp）

<br>

**ASID** (Address Space ID)，ARMv8 中减小 Cache flush 的机制

- 原本 TLB 只通过 VA 来判断是否出现 TLB miss
- 加入 ASID 后，TLB 可以通过 ASID+VA 来判断是否有 TLB miss
- ASID 是每一个进程分配一个，这样在切换进程后也无需 flush TLB

---

# Cache 一致性

2 个术语 PoU 和 PoC：

- Point of Unification (PoU)：以一个特定的 PE（该 PE 执行了 cache 指令）为视角
  - PE 需要经过各级 cache（icache, dcache, TLB）访问内存，在某个点上会访问到同一个副本，该点就是该 PE 的 PoU
  - 假设 cpu 的每个核都有自己的 L1 icache 和 L1 dcache，所有的核共享 L2 cache，则 PoU 就是 L2 cache
- Point of Coherency (PoC)：以系统中所有的 agent（bus master，也称为 observer，如 CPU、DMA engine）为视角
  - 由于 DMA controller 不通过 cache 访问内存，因此 PoC 只能是内存了

---

# VMSAv8-64 地址翻译系统

VMSA 重要寄存器：

- 页表大小为 4/16/64 KB，配置的寄存器比特是 `TCR_EL1.TG[1|0]`，其决定了 `TTBR[1|0]_EL1` 的页表大小
- OA 大小：`TCR_EL1.{I}PS`
- IA 大小：支持 2 个范围的 VA
  - `TCR_EL1.T0SZ` 用于指定地址较小的 VA 段大小，MMU 使用 `TTBR0_EL1`
  - `TCR_EL1.T1SZ` 用于指定地址较大的 VA 段大小，MMU 使用 `TTBR1_EL1`
- `TTBR0_EL1`/`TBR1_EL1` 保存了 pgd 的地址

`ID_AA64MMFR0_EL1`, AArch64 Memory Model Feature Register 0

- 提供实现内存模型和内存管理的信息
- `TGran4`, [31:28]：对 4KB 页表的支持，其中 0b0000 表示支持
- `TGran64`, [27:24]：对 64KB 页表的支持，其中 0b0000 表示支持，0b1111 不支持
- `PARange`, [3:0]: 物理地址范围，其中 0b0101 表示 48 bits

---

# TCR_ELx 寄存器

`TCR_EL1`, Translation Control Register，控制 stage 1 的 translation regime

- TBID1, [52]：控制 TBI 的作用范围
  - 0 表示用于维护 cache 的指令和数据访问
  - 1 表示只用于数据访问
- HA, [39]：Hardware Access flag update in stage 1 translations
- TBI1, [38]：Top Byte ignored，地址计算是否要考虑 top byte (即最高的 8 位)
- AS, [36]：ASID size，1 表示 16 bits，0 表示 8 bits
- TG1, [31:30], TG0 [15:14]：`TTBR1_EL1` 的 Granule size，即页表大小，如 0b10 表示 4KB
- T1SZ [21:16], T0SZ [5:0]：基于 `TTBR1_EL1` 的寻址区域，大小为 2^(64-T0SZ) bytes
- IRGN1 [25:24], IRGN0 [9:8]：基于 `TTBR1_EL1` 的 inner cacheability
- SH1 [29:28], SH0 [13:12]：基于 `TTBR1_EL1` 的 shareability
- A1, [22]：决定使用 `TTBR0_EL1.ASID` 还是 `TTBR1_EL1.ASID` 来表示 ASID

---
