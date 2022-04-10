// arm64 (android termux) 上 g++ -O1 -lpthread lock.cpp，可以得出错误的计数（不开优化可以得出正确值）
#include <atomic>
#include <stdio.h>
#include <thread>
#include <vector>

using namespace std;

atomic_bool locked(false);
void thread_entry(uint64_t tid, uint64_t *target)
{
    for (uint64_t i = 0; i < 1000; i++) {
        while (locked.exchange(true, memory_order_relaxed)) {
            this_thread::yield();
        }
        uint64_t cur = *target;
        this_thread::yield();
        *target = cur + 1 + tid;
        locked.store(false, memory_order_relaxed);
    }
}
int main(int argc, char *argv[])
{
    uint64_t counter = 0;
    vector<thread> v;
    for (uint64_t t = 0; t < 100; t++) {
        v.push_back(thread(thread_entry, t, &counter));
    }
    for (auto &t : v) {
        t.join();
    }
    printf("counter: %lu\n", counter);
    return 0;
}
