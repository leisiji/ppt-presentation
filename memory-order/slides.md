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

# C++ 内存模型

---

内容：

- C 的 volatile 关键字
- Memory Order 内存顺序 (所有架构都适用的模型)
  - Relaxed
  - Aquire-Release
  - Release-Consume
  - Consistent
- 使用 Memory-Order 的例子：AOSP 的智能指针

参考

- https://www.codedump.info/post/20191214-cxx11-memory-model-1
- https://www.codedump.info/post/20191214-cxx11-memory-model-2
- https://www.bilibili.com/video/BV14L4y1x7Hn

---

## C 的 volatile 关键字

<div class="grid grid-cols-2 gap-x-4">

<div>

volatile 的作用只有一个：告诉编译器不要进行优化

```c
// 不加 volatile，gcc -O2 会发现 thread2 永远无法退出
// clang -O2 不会出现下面的情况
static volatile int thread_var = 1;
void *thread1(void *arg) {
    sleep(1);
    thread_var = 1000;
    return NULL;
}
void *thread2(void *arg) {
    while (thread_var != 1000) {}
    thread_var = 2000;
    return NULL;
}
int main(int argc, char *argv[]) {
    pthread_t tid1, tid2;
    pthread_create(&tid1, NULL, thread1, NULL);
    pthread_create(&tid2, NULL, thread2, NULL);
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    return 0;
}
```

</div>

<div>

还常用于内联汇编：

```c
// rdtsc (x86) 读取时间戳，若没有 volatile，在 -O3 下
// 编译器会认为第二个 asm 返回同样的值而把其去掉
int main(int argc, char *argv[])
{
    uint64_t msr;
    asm volatile("rdtsc\n\t"
                 "shl $32, %%rdx\n\t"
                 "or %%rdx, %0"
                 : "=a"(msr)
                 :
                 : "rdx");
    printf("msr: %llx\n", msr);
    asm volatile("rdtsc\n\t"
                 "shl $32, %%rdx\n\t"
                 "or %%rdx, %0"
                 : "=a"(msr)
                 :
                 : "rdx");
    printf("msr: %llx\n", msr);
    return 0;
}
```

</div>

</div>

---

## C 的 volatile 关键字

以下 2 个宏告诉编译器要操作内存，不要将变量优化为寄存器操作，并且不要调整读写变量的顺序；常被用于读写寄存器：

```c
/* include/asm-generic/rwonce.h */
#define READ_ONCE(x)        (*(const volatile __unqual_scalar_typeof(x) *)&(x))
#define WRITE_ONCE(x, val)  do { *(volatile typeof(x) *)&(x) = (val); } while (0)
```

但是，要避免使用 `volatile` (linux 内核中禁止使用 volatile)，因为其作用仅限于写内联汇编和寄存器操作时用到，而这些操作都有现成的接口提供，不需要自己实现；而且 volatile 无法解决多线程的竞争问题

---

## 内存顺序（Memory Order）

- 内存顺序描述了计算机 CPU 读写内存的顺序
- 内存操作的乱序既可能发生在编译器编译期间（指令重排）或 CPU 指令执行期间（乱序执行）

CPU 的顺序模型：

- 强顺序模型（TSO，Total Store Order）：即 CPU 执行的执行和汇编代码的顺序一致；如 x86 和 SPARK
- 弱内存模型（WMO，Weak Memory Ordering）：除非代码之间有依赖，否则需要程序员主动插入内存屏障指令来强化这个“可见性”

内存序的术语：

- **Sequenced-Before**：表示单线程之间的先后顺序和操作结果的可见性；如果 A sequenced-before B，除了表示 A 在 B 之前，还表示 A 的结果对 B 可见（有 L1 Cache，别的线程不一定能读到新的变量值）
- **Happens-Before**：表示不同线程之间的操作先后顺序和操作结果的可见性；如果 A happens-before B，则 A 的结果将在 B 执行之前就可见
- **Synchronizes-With**：强调的是变量被修改之后的传播关系，即如果一个线程修改某变量的之后的结果能被其它线程可见

---

## C++11 定义的内存序

大多数编程语言定义的内存序模型都是相似的，Linux 内核也有定义内存序，称为 Memory Barrier

这里以 C++11 为例，它定义了 4 种内存序：

- Relaxed
- Aquire-Release
- Release-Consume
- Consistent

内存序以原子变量接口的形式暴露给用户

---

## Relaxed

- 仅要求一个变量的读写是原子操作；在单个线程内，该变量的所有原子操作是顺序进行的
- 不同线程之间针对该变量的访问操作先后顺序不能得到保证，即有可能乱序

<div class="grid grid-cols-2 gap-x-4">

<div>

```c
/* 没有使用 atomic Relaxed，最后输出的计数错误 */
void thread_entry(uint64_t tid, uint64_t *target)
{
    for (uint64_t i = 0; i < 1000; i++) {
        *target = *target + 1;
    }
}
int main(int argc, char *argv[])
{
    uint64_t counter(0);
    vector<thread> v;
    for (uint64_t t = 0; t < 1000; t++) {
        v.emplace_back(thread(thread_entry, t, &counter));
    }
    for (auto &t : v) { t.join(); }
    printf("%lu\n", counter);
    return 0;
}
```

</div>

<div>

```c
void thread_entry(uint64_t tid, atomic_uint64_t *target)
{
    for (uint64_t i = 0; i < 1000; i++) {
        target->fetch_add(1);
    }
}
int main(int argc, char *argv[])
{
    atomic_uint64_t counter(0);
    vector<thread> v;
    for (uint64_t t = 0; t < 1000; t++) {
        v.emplace_back(thread(thread_entry, t, &counter));
    }
    for (auto &t : v) { t.join(); }
    printf("%lu\n", counter.load(memory_order_relaxed));
    return 0;
}
```

</div>

</div>

---

## Aquire-Release

<div class="grid grid-cols-2 gap-x-4">

<div>

- 若线程 A 中的原子写是 release ，线程 B 同一变量的原子读是 acquire
- 则 A 对该变量原子写之前的所有内存写入（非原子及 relax），在线程 B 都是可见的，B 可以读取到 A 写入的值
- 形象一点，把 aquire-release 看作加锁的临界区，临界区内的代码不会跑出 lock-unlock 的边界

左边的例子使用了 Relaxed，因此导致了错误，正确的应该使用 Aquire-Release

</div>

<div>

```cpp
// arm64 (android termux): g++ -O1 -lpthread lock.cpp
static atomic_bool l(false); // spinlock
void thread_entry(uint64_t tid, uint64_t *target) {
    for (uint64_t i = 0; i < 1000; i++) {
        /* relax 无法保证中间代码不跑出临界区 */
        while (l.exchange(true, memory_order_relaxed)) {
            this_thread::yield();
        }
        uint64_t cur = *target;
        this_thread::yield(); /* 使其更容易出现错误 */
        *target = cur + 1 + tid;
        l.store(false, memory_order_relaxed);
    }
}
int main(int argc, char *argv[]) {
    uint64_t counter = 0;
    vector<thread> v;
    for (uint64_t t = 0; t < 100; t++) {
        v.emplace_back(thread(thread_entry, t, &counter));
    }
    for (auto &t : v) { t.join(); }
    printf("counter: %lu\n", counter);
    return 0;
}
/* 解决办法就是使用 Aquire-Release */
```

</div>

</div>

<style>
h2 {
  font-size: 5px;
}
</style>

---

## Release-Consume

<div class="grid grid-cols-2 gap-x-4">

<div>

弱化版的 aquire-release，顺序关系只和内存序作用的变量有关

- 若线程 A 中的原子写是 release ，线程 B 同一变量的原子读写是 consume
- 则 A 对该变量原子写之前的所有内存写入（**非原子及 relax**），对于依赖线程 B 同一变量的原子读才是可见的
- 即 B 中依赖原子读的函数或操作符才可以看到 A 写入内存的内容

</div>

<div>

```cpp
atomic<string*> ptr;
int data;
void producer() {
    string* p = new string("Hello");
    data = 42;
    ptr.store(p, memory_order_release);
}
void consumer() {
    string* p2;
    while (!(p2 = ptr.load(memory_order_consume))) ;
    // 绝无出错：*p2 依赖原子 ptr 的读取
    assert(*p2 == "Hello");
    // 可能会出错：data 不依赖原子 ptr 的读取
    assert(data == 42);
}
int main() {
    thread t1(producer);
    thread t2(consumer);
    t1.join(); t2.join();
}
```

</div>

</div>

---

## Consistent

<div class="grid grid-cols-2 gap-x-4">

<div>

<div>

- 每个处理器的执行顺序和代码中的顺序一样
- 所有处理器都只能看到**一种执行顺序**

注意，aquire/release 只对同一线程的变量有同步作用，左边的代码就是反例：

- 不同核看到的操作结果不同，在 thread c 可能看到是先 x 后 y，但在 thread d 可能是先 y 后 x
- 因为 x 和 y 是在不同线程的 release，没有顺序关系，若在同一线程可以 assert 成立

</div>

</div>

<div>

```cpp
atomic_bool x(false), y(false);
atomic_int64_t z(0);

void write_x() { x.store(true, memory_order_release); }
void write_y() { y.store(true, memory_order_release); }
void read_x_then_y() {
    while (!x.load(memory_order_acquire)) ;
    if (y.load(memory_order_acquire)) ++z;
}
void read_y_then_x() {
    while (!y.load(memory_order_acquire)) ;
    if (x.load(memory_order_acquire)) ++z;
}
int main()
{
    thread a(write_x);
    thread b(write_y);
    thread c(read_x_then_y);
    thread d(read_y_then_x);
    a.join(); b.join(); c.join(); d.join();
    assert(z.load() != 0);
}
// 最后的断言可能失败，因为 x 和 y 是在不同的线程
```

</div>

</div>

---

## AOSP 的智能指针 (强弱引用的递减都使用了 Aquire-Release)

<div class="grid grid-cols-2 gap-x-4 text-sm">

<div>

```cpp
/* 强引用 */
void RefBase::incStrong(const void* id) const
{
    weakref_impl* const refs = mRefs;
    refs->incWeak(id);

    const int32_t c =
        refs->mStrong.fetch_add(1, memory_order_relaxed);
    if (c == INITIAL_STRONG_VALUE)
        refs->mStrong.fetch_sub(INITIAL_STRONG_VALUE,
                                memory_order_relaxed);
}
void RefBase::decStrong(const void* id)
{
    weakref_impl* const refs = mRefs;

    const int32_t c =
        refs->mStrong.fetch_sub(1, memory_order_release);
    if (c == 1) {
        atomic_thread_fence(memory_order_acquire);
        delete this;
    }
    refs->decWeak(id); /* mRefs 和 this 不是在同一块内存 */
}
```

</div>

<div>

```cpp
/* 弱引用 */
void RefBase::weakref_type::incWeak(const void *id)
{
    weakref_impl *const impl =
        static_cast<weakref_impl *>(this);
    const int32_t c =
        impl->mWeak.fetch_add(1, memory_order_relaxed);
}
void RefBase::weakref_type::decWeak(const void *id)
{
    weakref_impl *const impl =
        static_cast<weakref_impl *>(this);
    const int32_t c =
        impl->mWeak.fetch_sub(1, memory_order_release);
    if (c != 1)
        return;
    atomic_thread_fence(memory_order_acquire);
    // 个人感觉可以改为 consume，因为这里有 if 的数据依赖
    if (impl->mStrong.load(memory_order_relaxed == 0)
        delete impl;
}
```

</div>

</div>
