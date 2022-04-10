#include <assert.h>
#include <atomic>
#include <chrono>
#include <cstdio>
#include <string>
#include <thread>
#include <vector>

using namespace std;
using namespace chrono;
#define MAX 1000

void test(memory_order order1, memory_order order2)
{
    vector<thread> v;
    for (int i = 0; i < 1000; i++) {
        atomic_uint64_t a(0);
        atomic_uint64_t b(0);
        atomic_uint64_t c(0);
        v.push_back(thread ([&] () {
            for (int i = 0; i < MAX; i++) {
                a.fetch_add(1, order1);
            }
        }));
        v.push_back(thread([&] () {
            while (a.load(order2) <= MAX) {
                c.fetch_add(1, memory_order_relaxed);
                b.fetch_add(1, order2);
            }
        }));
    }
    for(auto &t : v) {
        t.join();
    }
}

int main()
{
    high_resolution_clock::time_point start = high_resolution_clock::now();
    test(memory_order_release, memory_order_consume);
    high_resolution_clock::time_point end = high_resolution_clock::now();
    printf("release-cosume: %lu\n",
           duration_cast<milliseconds>(end - start).count());

    start = high_resolution_clock::now();
    test(memory_order_release, memory_order_acquire);
    end = high_resolution_clock::now();
    printf("aquire-release: %lu\n",
           duration_cast<milliseconds>(end - start).count());
}
