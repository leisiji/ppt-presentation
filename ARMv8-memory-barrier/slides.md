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

# ARMv8 Atomic and Memory Barrier

---

# 内容

- ARMv8 原子指令: LL/SC, LSE
- C 程序对应的 ARMv8 指令
- 内存屏障指令：Shareability domain

---

### Load-Link (LL), Store-Conditional (SC)

ARMv7 使用 LDREX 和 STREX 实现原子操作，ARMv8 改名为 LDXR 和 STXR

- LDXR，将内存加载寄存器，并标记对内存区域的独占访问，可以重复设置独占标记
- STXR (Store Exclusive Register)，将寄存器写到内存，清空独占标记，若发现独占标记清空，则不会更新内存，将寄存器设为 1

重点在 STXR，若更新内存失败，则不断重试 LDXR/STXR，这样就实现了原子写

指令格式：

- `LDXR <Xt>, [<Xn|SP>{,#0}]`，和普通 load 没有区别，只是会设置独占标记
- `STXR <Ws>, <Xt>, [<Xn|SP>{,#0}]`，若成功则执行 exclusive access，且 Ws 写 0，否则写 1

LL/SC 本质就是一个 CAS，MIPS 和 RISCV 也使用类似的机制去实现原子操作

---

### LSE (Large System Extensions)

ARMv8.1 引入了 LSE，用以改善原子操作性能，改善多核下的性能

<div class="grid grid-cols-2 gap-x-4">

<div>

Atomic Load/Release

| 指令               | 语义                  |
| ---                | ---                   |
| LDAR, LDARH, LDARB | Load-Acquire Register |
| STLR, STLRH, STLRB | Store-Release         |

</div>

<div>

原子加法有专门的指令：LDADD 和 STADD，后者不会返回相加前的值

- LDADDA/LDADDAL 的读具有 Aquire 语义
- LDADDL/LDADDAL 的写有 release 语义
- LDADD 没有 aquire 和 release 语义

CAS (SWP 系列指令) ：

- SWPA/SWPAL 的读具有 Aquire 语义
- SWPL/SWPAL 的写有 release 语义
- SWP 没有 aquire 和 release 语义

</div>

</div>

LSE 总结：总共有 store，load, load-add, swap 这几类原子指令

- 指令后带有 A 的是 Aquire，L 则是 Release，AL 则是 Aquire-Release，没有则是 Relax
- 只有 store-release (L) 和 load-aquire (A)，但是 ldadd 和 swp 有 AL

---

<div class="grid grid-cols-2 gap-x-4">

<div>

### Add Relax

```c
atomic_int sum = 0;
atomic_fetch_add_explicit(&sum, 1,
                          memory_order_relaxed);
```

```asm
<__aarch64_ldadd4_relax>:
9f0:  bti c
9f4:  adrp  x16, 11000 <__libc_start_main@GLIBC_2.34>
9f8:  ldrb  w16, [x16, #81]
9fc:  cbz   w16, a08 <__aarch64_ldadd4_relax+0x18>

a00:  ldadd w0, w0, [x1]
a04:  ret

a08:  mov   w16, w0
a0c:  ldxr  w0, [x1]
a10:  add   w17, w0, w16
a14:  stxr  w15, w17, [x1]
a18:  cbnz  w15, a0c <__aarch64_ldadd4_relax+0x1c>
a1c:  ret
```

</div>

<div>

### Store-Relax

```c
atomic_bool locked;
atomic_store_explicit(&locked, false,
                      memory_order_relaxed);
```

```asm
0000000000000a50 <__aarch64_swp1_relax>:
a50: bti c
a54: adrp    x16, 11000 <__libc_start_main@GLIBC_2.34>
a58: ldrb    w16, [x16, #82]
a5c: cbz w16, a68 <__aarch64_swp1_relax+0x18>

a60: swpb    w0, w0, [x1]
a64: ret

a68: mov w16, w0
a6c: ldxrb   w0, [x1]
a70: stxrb   w17, w16, [x1]
a74: cbnz    w17, a6c <__aarch64_swp1_relax+0x1c>
a78: ret
```


</div>

</div>

----

<div class="grid grid-cols-2 gap-x-4">

<div>

### Exchg-Relax

```c
atomic_bool locked;
while (atomic_exchange_explicit(&locked,
       true, memory_order_relaxed)) { }
```

```asm
0000000000000a50 <__aarch64_swp1_relax>:
a50: bti c
a54: adrp    x16, 11000 <__libc_start_main@GLIBC_2.34>
a58: ldrb    w16, [x16, #82]
a5c: cbz w16, a68 <__aarch64_swp1_relax+0x18>

a60: swpb    w0, w0, [x1]
a64: ret

a68: mov w16, w0
a6c: ldxrb   w0, [x1]
a70: stxrb   w17, w16, [x1]
a74: cbnz    w17, a6c <__aarch64_swp1_relax+0x1c>
a78: ret
```

</div>

<div>

### Exchg-Aquire

```c
atomic_exchange_explicit(&locked, true,
        memory_order_acquire);
```

```asm
0000000000000a50 <__aarch64_swp1_acq>:
a50: bti c
a54: adrp    x16, 11000 <__libc_start_main@GLIBC_2.34>
a58: ldrb    w16, [x16, #82]
a5c: cbz     w16, a68 <__aarch64_swp1_acq+0x18>

a60: swpab   w0, w0, [x1]
a64: ret

a68: mov     w16, w0
a6c: ldaxrb  w0, [x1]
a70: stxrb   w17, w16, [x1]
a74: cbnz    w17, a6c <__aarch64_swp1_acq+0x1c>
a78: ret
```

</div>

</div>

---

<div class="grid grid-cols-2 gap-x-4">

<div>

### Store-Release

```c
atomic_store_explicit(&locked, false,
        memory_order_release);
```

```asm
/* [sp, #37] 写 0，再将 0 加载到 w0
 * 再将 w0 值写入 w1，再将 locked 地址加载到 x0；
 * 此时 w1 = 0, x0 = &locked */
95c:   strb    wzr, [sp, #37]
960:   ldrb    w0, [sp, #37]
964:   mov     w1, w0
968:   ldr     x0, [sp, #40]
96c:   stlrb   w1, [x0] /* Store-Release */
```

</div>

<div>

### seq-cst

ARMv8 并没有实现 release-consume 和 seq-cst，因此对应的 load/store 会被翻译为 load-aquire 以及 store-release

ldar 对应了 load consume (seq-cst)，stlr 对应了 store release (seq-cst)

</div>

</div>

---

## 内存屏障指令

ARMv8 的常用 mb 包括 ISB, DMB, DSB，还有其它的 MB 如 Speculation Barrier (SB)，但是 linux 没用到

- Instruction Synchronization Barrier (**ISB**)
  - 清空 PE 的流水线，ISB 后的所有指令再从 cache 或 memroy 中取出
  - 保证 ISB 前的上下文切换代码
- Data Memory Barrier (**DMB**)：保证了其前后内存访问的相对顺序
- Data Synchronization Barrier (**DSB**)
  - 保证 DSB 前面的内存访问在 DSB 指令前完成，是比 DMB 更强的 barrier
  - DMB 只能保证内存访问指令的顺序，DSB 可以保证内存访问指令相对于任意指令的顺序

DMB/DSB 需要 2 个参数：操作类型 (ST 或 LD) 和 shareability domain (ISH, OSH, NSH)

| mb 前后 | Full system | Outer Shareable | Inner Shareable | Non-shareable |
| ---     | ---         | ---             | ---             | ---           |
| WR-WR   | SY          | OSH             | ISH             | NSH           |
| W-W     | ST          | OSHST           | ISHST           | NSHST         |
| R-WR    | LD          | OSHLD           | ISHLD           | NSHLD         |

操作类型显然就是要限制 mb 前后指令的顺序：mb 之前的指令需要在 mb 之前完成；mb 之后的指令需要在 mb 之后才开始执行

没有指定 domain 则为 Full System

---

## Shareability domain

<div class="grid grid-cols-5 gap-x-4">

<div class="col-span-2">

<img src="/29070709268700.png" class="h-100" />

> 最简单的理解：CPU 的内部认为是 ISH，外部器件（DMA）认为是 OSH；这一点通过 linux 宏 `mb*(), smp_*mb(), dma_*mb()` 可以看出来

</div>

<div class="col-span-3">

- Non-shareable (NSH)：只包含 local agent 的域，通常不会被用于 SMP 系统
- Inner shareable (ISH)：
  - 被多个 agents 共享的，但不是被所有的 agents 所共享
  - 通常是指集成在 CPU 内部的器件，如 L1/L2 cache
- Outer shareable (OSH)：也是被多个 agents 共享的，并影响其内部的 ISH domain，比如 Mali GPU
- Full system (SY)：被所有 agents 所共享的，比如串口等

mb 和带 mb 的原子指令的区别：

- Load-Acquire 是单向的，保证之后的指令不能在 Load-Acquire 之前执行
- Store-Release 是单向的，保证之前的指令不能在 Store-Release 之后执行
- Memory-Barrier 是双向的，保证前和后指令的相对顺序，但也无法保证前面指令组内部的顺序
- 当然原子指令也有双向版本的，具有 aquire-release 双语义，如 swpal 和 ldaddal

</div>

</div>

---

## mb 指令的应用

```c
// Mandatory
#define mb()            dsb(sy)
#define rmb()           dsb(ld)
#define wmb()           dsb(st)
// SMP
#define __smp_mb()      dmb(ish)
#define __smp_rmb()     dmb(ishld)
#define __smp_wmb()     dmb(ishst)
// DMA
#define dma_rmb()       dmb(oshld)
#define dma_wmb()       dmb(oshst)
// dmb, dsb
#define dsb(opt)        asm volatile("dsb " #opt : : : "memory")
#define dmb(opt)        asm volatile("dmb " #opt : : : "memory")
```

C11 fence 对应的 mb 指令：

- `atomic_thread_fence(memory_order_seq_cst)` 对应 `dmb ish`
- `atomic_thread_fence(memory_order_release)` 对应 `dmb ish`
- `atomic_thread_fence(memory_order_aquire)` 对应 `dmb ishld`
