#include <stdio.h>
#include <thread>
#include <vector>

using namespace std;

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
