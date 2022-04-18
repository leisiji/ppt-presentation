#include <assert.h>
#include <atomic>
#include <chrono>
#include <cstdio>
#include <string>
#include <thread>
#include <unistd.h>
#include <vector>

using namespace std;
using namespace chrono;
#define LOOP 1000

void test(memory_order order1, memory_order order2)
{
    vector<thread> v;
    atomic_bool finished(false);
    atomic_uint64_t a(0);
    int b = 0;

    // producer
    v.emplace_back(thread([&] () {
        for (int i = 0; i < LOOP; i++) {
            for (int i = 0; i < LOOP; i++) {
                usleep(1000);
            }
            for (int j = 0; j < LOOP; j++) {
                a.fetch_add(1, order1);
            }
        }
        finished.store(true, memory_order_release);
    }));

    // consumer
    v.emplace_back(thread([&] () {
        while (!finished.load(memory_order_acquire)) {
            while ((a.load(order2) % 10) != 0) {
                b++;
            }
            for (int i = 0; i < LOOP; i++) {
                usleep(1000);
            }
        }
    }));

    for (auto & i : v) {
        i.join();
    }
}

int main()
{
    auto t1 = thread([=] () {
        high_resolution_clock::time_point start = high_resolution_clock::now();
        test(memory_order_release, memory_order_consume);
        high_resolution_clock::time_point end = high_resolution_clock::now();
        printf("release-cosume: %lu\n",
               duration_cast<milliseconds>(end - start).count());
    });

    auto t2 = thread([=] () {
        high_resolution_clock::time_point start = high_resolution_clock::now();
        test(memory_order_release, memory_order_acquire);
        high_resolution_clock::time_point end = high_resolution_clock::now();
        printf("aquire-release: %lu\n",
               duration_cast<milliseconds>(end - start).count());
    });

    t1.join();
    t2.join();
}
