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
  - Cache 层次
  - Cache Line
  - Cache Miss
- 寄存器
- ARMv8 部分指令的介绍

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

**PE**：Processing Element，其实就是 CPU core

---

# Cache 层级

<div class="grid grid-cols-2 gap-x-4">

<div>

Cache 分类：

- 访问速度分类：L1 (每个 core 独有), L2 (每个 cluster 共享), L3 (所有 cluster 共享)
- 用途分类：D-cache (data) 和 I-cache (Instruction)

<img src="/24033713268590.png" class="h-60 rounded shadow" />
</div>

<div>

- Point of Coherency (PoC)：
  - 系统中所有观察者（如 CPU、DMA engine）都能看到同样的内存值的位置
  - 由于 DMA controller 不通过 cache 访问内存，因此 PoC 只能是内存了
- Point of Unification (PoU)：
  - 以一个 PE 为视角，其执行的指令或 D-cache 或 TLB 都能看到相同的内存值
  - 假设 cpu 的每个核都有自己的 L1 cache，所有的核共享 L2 cache，则 PoU 就是 L2 cache
  - 若 core 外没有 cache，则内存就是 PoU

</div>

</div>

---

# Cache Line

<div class="grid grid-cols-2 gap-x-4">

<div>

<img src="/74232620268590.png" class="h-60 rounded shadow" />

**Cache-line** 是 Cache 的基本组成单位，从 16 Byte 到 128 Byte，一般是 64 Byte

</div>

<div>

- Cache 将内存地址被划分为 3 个部分：
  - tag 是内存地址的 Top bits，并会保存在 cache 中
  - index 是内存地址的一部分，决定在 cache 的哪些行中
  - offset 则是内存地址的低位
- way 是对 cache 的一个划分，每个 way 都是一样的大小而且用同样的方式索引
- set 是所有 way 中拥有相同的 index 的 cache line 的集合

</div>

</div>

---

# Cache Miss

Cache Miss：内存没有缓存到 Cache 中，需要先从内存读取到 Cache，会造成 CPU 流水线清空

减小 Cache Miss 也是软件的一个优化方向，比如 linux kernel 就有许多 Cache 的优化策略：

- `____cacheline_aligned` 宏：使数据结构和 Cache line 对齐
- Static keys：动态修改跳转的分支，减小分支跳转导致的 I-cache miss，参考 static-keys.rst

> 一个可以感知到 Cache Miss 的例子（test/cache.cpp）

<br>

硬件方案：如 **ASID** (ARMv8) 能够减小 Cache flush

- 原本 TLB 只通过 VA 来判断是否出现 TLB miss
- 加入 ASID 后，TLB 可以通过 ASID+VA 来判断是否有 TLB miss
- ASID 是每一个进程分配一个，这样在切换进程后也无需 flush TLB

---

## ARMv8 寄存器

- R0-R30：31 个通用器，X0-X30 以 64 位模式访问，W0-W30 以 32 位模式访问；其中 X30 通常用作 link register
- SP：Stack Pointer register
- PC：Program Counter，当前指令的地址，程序无法直接写入 PC

PSTATE 的部分 fields：

- Condition flag：*N* - Negative flag, *Z* - Zero flag, *C* - Carry flag, *V* - Overflow flag
- 执行状态控制：*IL* - Illegal Execution state bit, *EL* - Current Exception level
- 异常 mask：0 表示不屏蔽异常，1 表示屏蔽异常
  - *D*: Debug exception mask bit
  - *A*: SError interrupt mask bit
  - *I*: IRQ interrupt mask bit
  - *F*: FIQ interrupt mask bit

---

## ARMv8 寻址方式

| Addressing Mode                | Immediate              | Register               |
| ---                            | ---                    | ---                    |
| Base register only (no offset) | [base]                 | -                      |
| Base register plus offset      | [base{, #imm}]         | [base, Xm{, LSL #imm}] |
| Pre-indexed (++a)              | [base, #imm]!          | -                      |
| Post-indexed (a++)             | [base], #imm           | [base], Xma            |
| Literal (PC-relative)          | label (19 bits signed) | -                      |

<div class="grid grid-cols-2 gap-x-4">

<div>

```asm
/* u64 boot_args[4] = { x21, x1, x2, x3 }; */
adr_l   x0, boot_args
stp     x21, x1, [x0]      /* 寄存器寻址 */
stp     x2, x3, [x0, #16]  /* 寄存器相对寻址 */
/* 跳转 __primary_switched */
ldr     x8, =__primary_switched
adrp    x0, __PHYS_OFFSET /* x0 作为参数 */
blr     x8
```

</div>

<div>

```asm
    /* Clear the init page tables. */
    adrp    x0, init_pg_dir
    adrp    x1, init_pg_end
    sub     x1, x1, x0
1:  stp     xzr, xzr, [x0], #16 /* post-index */
    stp     xzr, xzr, [x0], #16
    stp     xzr, xzr, [x0], #16
    stp     xzr, xzr, [x0], #16
    subs    x1, x1, #64
    b.ne    1b
```

</div>

</div>

---

## ARMv8 指令 (PC Load/Store)

`ADR <Xd>, <label>`

- 在 PC 值上加一个立即数，得到 PC 相对地址，并将结果写入目的寄存器
- 偏移大小为 21 bits，寻址范围是 ±1MB

`ADRP <Xd>, <label>`, Form PC-relative address to 4KB page

- 将立即数算术左移 12 位 (保持 32 位)，PC 低 12 位清零，然后把这两者相加
- 寻址范围是 ±4 GB，但缺点是加载的地址只能是 4K 对齐

```asm
.macro  adr_l, dst, sym
adrp    \dst, \sym
add     \dst, \dst, :lo12:\sym
.endm
adr_l   x5, vectors

/* adrp 多用于页表这类地址必然是 4K 对齐的变量 label */
adrp    x0, init_pg_dir
adrp    x1, init_pg_end
bl  dcache_inval_poc
```

---

## ARMv8 指令 (Load/Store)

LDR 指令：

- `LDR <Xt>, [<Xn|SP>], #<simm>`：将立即数写到寄存器
- `LDR <Xt>, <label>`：将 PC 和立即数相加得到地址，读取地址对应的值到寄存器

STR, Store Register

- `STR <Xt>, [<Xn|SP>], #<simm>`，将寄存器值写到内存
- `STR <Xt>, [<Xn|SP>, (<Wm>|<Xm>){, <extend> {<amount>}}]`，将寄存器值和偏移相加得到地址，将寄存器值写到该地址；Xn 是 base register，Xm 是 index register，extend 和 amount 是 index 的移位操作

<div class="grid grid-cols-2 gap-x-4">

<div>

```asm
/* ldr_l 解决了 `ldr Xd, label` 寻址范围只有 1MB 的问题 */
.macro  ldr_l, dst, sym, tmp=
adrp    \dst, \sym
ldr     \dst, [\dst, :lo12:\sym]
.endm
ldr_l    x4, kimage_vaddr
```

</div>

<div>

```asm
.macro  str_l, src, sym, tmp
adrp    \tmp, \sym
str     \src, [\tmp, :lo12:\sym]
.endm
str_l   x4, kimage_voffset, x5
```

</div>

</div>

---

## ARMv8 指令 (Load/Store)

`LDP <Dt1>, <Dt2>, [<Xn|SP>], #<imm>`, Load Pair of SIMD&FP registers

- 从基址寄存器加偏移从内存取出 2 个 32 位或 2 个 64 位，写到 2 个寄存器中

`STP <Xt1>, <Xt2>, [<Xn|SP>], #<imm>`, Store Pair of Registers

- 根据基址寄存器值和立即数计算地址，并从 2 寄存器将两个 32 位字或两个 64 位双字存储到计算出的地址

`MRS <Xt>, <systemreg>`，Move System Register，将系统寄存器读取到通用寄存器

MSR 分为 immediate 和 register

- `MSR <pstatefield>, #<imm>`，将立即数写到 PSTATE 特定位
- `MSR <systemreg>, <Xt>`，将通用寄存器写入到系统寄存器

---

## ARMv8 算术和逻辑运算指令

`ADD <Xd|SP>, <Xn|SP>, <#imm|Xm>`：将寄存器值和寄存器值或立即数相加，并将结果保存到目的寄存器

`SUB <Xd|SP>, <Xn|SP>, <#imm|Xm>`：将寄存器值和寄存器值或立即数相减，并将结果保存到目的寄存器

移位指令：

- ASR, Arithmetic shift right: `ASR <Xd>, <Xn>, #<shift>`
- LSL, Logical shift left: `LSL <Xd>, <Xn>, #<shift>`
- LSR, Logical shift right: `LSR <Xd>, <Xn>, #<shift>`
- ROR, Rotate right: `ROR <Xd>, <Xs>, #<shift>`

`UBFM <Xd>, <Xn>, #<immr>, #<imms>`, Unsigned Bitfield Move

- 将 Xn 的 2 个立即数范围的 bits 写到 Xd，在范围之外的比特位会被置为 0

`UBFX <Xd>, <Xn>, #<lsb>, #<width>`, Unsigned Bitfield Extract

- 从 lsb 比特复制 width 长度的比特位，大于范围外的比特位设置为 0

---

## ARMv8 分支指令

b 指令，Z 是指 PSTATE.Zero：

- `beq label` Z=0 跳转；`bne label` Z != 0 跳转
- 跳转指令的 `b.ne 1b` 和 `b.ge 1f` 分别表示 backward 1 和 forward 1
- `BL <label>`：跳转到相对 PC 偏移的地址，并将 x30 设置为 PC+4，跳转范围是 +/-128MB
- `BLR <Xn>`：跳转到寄存器保存的地址，并将 x30 设置为 PC+4

`CBZ <Xt>, <label>`, Compare and Branch on Zero (还有 CNBZ 是比较 nonzero)

- 比较寄存器的值是否和零相等，是则跳转 label；不会影响 condition flags

`CMP <Xn>, <Xm>{, <shift> #<amount>}`

- 将寄存器值减去另一个寄存器值（可选偏移）
- 本质是 SUBS 指令的别名

---

## 综合的例子

```asm
/* tbl: 页表的地址
 * rtbl: 下一级页表的地址 (通常是 tbl + PAGE_SIZE) */
.macro populate_entries, tbl, rtbl, index, eindex, flags, inc, tmp1
.Lpe\@:
    mov \tmp1, \rtbl                  /* tmp1 = rtbl (table entry) */
    orr \tmp1, \tmp1, \flags          /* tmp1 = tmp1 | flags */
    str \tmp1, [\tbl, \index, lsl #3] /* 将下一级页表项和 flags 写入当前页表项，并移动到下一个页表项 */
    add \rtbl, \rtbl, \inc            /* 下一级页表移动到下一个页表项 */
    add \index, \index, #1
    cmp \index, \eindex               /* index >= eindex 结束循环 */
    b.ls    .Lpe\@
.endm

/*
 *  tbl: 页表的地址
 *  rtbl: 索引为 1 页表的页表项地址 (通常是 tbl + PAGE_SIZE)
 */
/* 先通过 [vstart, vend] 算出页表的 istart 和 iend，带反斜杠都是通用寄存器 */
compute_indices \vstart, \vend, #PGDIR_SHIFT, \pgds, \istart, \iend, \count
populate_entries \tbl, \rtbl, \istart, \iend, #PMD_TYPE_TABLE, #PAGE_SIZE, \tmp
```
