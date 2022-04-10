#include <atomic>
#include <cstdio>
#include <thread>
#include <assert.h>
#include <vector>

using namespace std;

int main() {
    vector<thread> v;
    for (int j = 0; j < 100; j++) {
        v.push_back(thread([] () {
            atomic_bool x(false), y(false);
            atomic_int64_t z(0);
            for (int j = 0; j < 1000; j++) {
                x.store(false);
                y.store(false);
                z.store(0);
                thread a([&] () { x.store(true, memory_order_release); });
                thread b([&] () { y.store(true, memory_order_release); });
                thread c([&] () {
                    while (!x.load(memory_order_acquire)) ;
                    if (y.load(memory_order_acquire)) ++z;
                } );
                thread d([&] () {
                    while (!y.load(memory_order_acquire)) ;
                    if (x.load(memory_order_acquire)) ++z;
                });
                a.join(); b.join(); c.join(); d.join();
                assert(z.load() != 0);
            }
        }));
    }
    for (auto& t : v) {
        t.join();
    }
}
// 最后的断言可能失败，因为 x 和 y 是在不同的线程被赋值，2 个核看到结果可能不一致
