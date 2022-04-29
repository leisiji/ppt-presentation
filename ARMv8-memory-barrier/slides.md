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

# ARMv8 Memory Barrier

---

# 内容

- ARMv8 原子指令: LL/SC, LSE

---

## LL/SC

---

## LSE

---

## Relax

```c
void *thread_entry(void *data)
{
    atomic_int *sum = data;
    for (int i = 0; i < 100; i++) {
        atomic_fetch_add_explicit(sum, 1, memory_order_relaxed);
    }
    return NULL;
}
```

```asm
<__aarch64_ldadd4_relax>:
 9f0:   bti c
 9f4:   adrp    x16, 11000 <__libc_start_main@GLIBC_2.34>
 9f8:   ldrb    w16, [x16, #81]
 9fc:   cbz     w16, a08 <__aarch64_ldadd4_relax+0x18>

 a00:   ldadd   w0, w0, [x1]
 a04:   ret

 a08:   mov     w16, w0
 a0c:   ldxr    w0, [x1]
 a10:   add     w17, w0, w16
 a14:   stxr    w15, w17, [x1]
 a18:   cbnz    w15, a0c <__aarch64_ldadd4_relax+0x1c>
 a1c:   ret
```
