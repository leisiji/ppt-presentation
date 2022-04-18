#include <atomic>
#include <stdio.h>
#include <thread>
#include <vector>

using namespace std;

atomic_bool locked(false);
void thread_entry(uint64_t tid, uint64_t *target)
{
    for (uint64_t i = 0; i < 1000; i++) {
        while (locked.exchange(true, memory_order_acquire)) {
            this_thread::yield();
        }
        uint64_t cur = *target;
        this_thread::yield();
        *target = cur + 1 + tid;
        locked.store(false, memory_order_release);
    }
}
int main(int argc, char *argv[])
{
    uint64_t counter = 0;
    vector<thread> v;
    for (uint64_t t = 0; t < 100; t++) {
        v.emplace_back(thread(thread_entry, t, &counter));
    }
    for (auto &t : v) {
        t.join();
    }
    printf("counter: %lu\n", counter);
    return 0;
}
