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

# ARMv8 内存模型

---

内容：

- C 的 volatile 关键字
- Memory Order 内存顺序 (所有架构都适用的模型)

参考

- https://www.codedump.info/post/20191214-cxx11-memory-model-1
- https://www.codedump.info/post/20191214-cxx11-memory-model-2
- https://www.bilibili.com/video/BV14L4y1x7Hn

---

# C 的 volatile 关键字

<div class="grid grid-cols-2 gap-x-4">

<div>

```c
/* 不加 volatile，gcc 开启 -O2 会发现 thread2 永远无法退出
 * clang 开启 -O2 不会出现下面的情况 */
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

volatile 作用：

- 只在编译器层面优化，告诉编译器不要从寄存器中读取变量值
- 无法防止多线程同时写变量的问题，而且看出只能用于一个线程写另一个线程读的情况
- 使用情况非常狭窄，因此要避免使用 `volatile` (linux 内核中禁止使用 volatile 关键字)

</div>

</div>

---

## 内存顺序（Memory Order）

- 内存顺序描述了计算机 CPU 读写内存的顺序
- 内存操作的乱序既可能发生在编译器编译期间（指令重排）或 CPU 指令执行期间（乱序执行）

CPU 的顺序模型：

- 强顺序模型（TSO，Total Store Order）：即 CPU 执行的执行和汇编代码的顺序一致；如 x86 和 SPARK
- 弱内存模型（WMO，Weak Memory Ordering）：除非代码之间有依赖，否则需要程序员主动插入内存屏障指令来强化这个“可见性”

内存序的术语：

- **Sequenced-Before**：表示单线程之间的先后顺序和操作结果的可见性；如果 A sequenced-before B，除了表示 A 在 B 之前，还表示 A 的结果对 B 可见（core 有 L1 Cache，别的线程不一定能读取到最新的变量值）
- **Happens-Before**：表示不同线程之间的操作先后顺序和操作结果的可见性；如果 A happens-before B，则 A 的内存状态将在 B 执行之前就可见
- **Synchronizes-With**：强调的是变量被修改之后的传播关系（propagate），即如果一个线程修改某变量的之后的结果能被其它线程可见；显然，synchronizes-with 一定是满足 happens-before

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

- 仅要求一个变量的读写是原子操作
- 在单个线程内，该变量的所有原子操作是顺序进行的
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
        v.push_back(thread(thread_entry, t, &counter));
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
        v.push_back(thread(thread_entry, t, &counter));
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

<div class="text-sm">

- 若线程 A 中的原子写是 `memory_order_release` ，线程 B 同一变量的原子读是 `memory_order_acquire`
- A 对该变量原子写之前的所有内存写入（非原子及 relax），在线程 B 都是可见的，B 可以读取到 A 写入的值
- 形象一点，把 aquire-release 看作加锁的临界区，临界区内的代码不会跑出 lock-unlock 的边界

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
        v.push_back(thread(thread_entry, t, &counter));
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

- 若线程 A 中的原子写是 `memory_order_release` ，线程 B 同一变量的原子读写是 `memory_order_consume`
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

<div class="text-sm">

- 每个处理器的执行顺序和代码中的顺序（program order）一样
- 所有处理器都只能看到**一种执行顺序**

</div>

</div>

<div>

```cpp

```

</div>

</div>
