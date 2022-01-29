#include <algorithm>
#include <chrono>
#include <stdint.h>
#include <stdio.h>
#include <typeinfo>
#include <vector>

struct A {
    int num = 1;
    A(int n) : num(n) {}
    virtual int foo() { return num; }
};
struct B : A {
    using A::A;
    int foo() override { return num + 1; }
};
void test(std::vector<A *> &v)
{
    int64_t sum = 0;
    using namespace std::chrono;

    high_resolution_clock::time_point start = high_resolution_clock::now();
    for (auto i : v) {
        sum += i->foo();
    }
    high_resolution_clock::time_point end = high_resolution_clock::now();

    printf("sum: %lu, time: %lu\n", sum,
           duration_cast<milliseconds>(end - start).count());
}

int main(int argc, char *argv[])
{
    std::vector<A *> v;
    srand(time(nullptr));

    for (int i = 0; i < 4000000; i++) {
        if (rand() & 1) {
            v.push_back(new A(i));
        } else {
            v.push_back(new B(i));
        }
    }
    std::random_shuffle(v.begin(), v.end());

    test(v); // 排序前调用虚函数

    // 根据类型进行排序
    std::sort(v.begin(), v.end(), [](const A *a, const A *b) {
        return typeid(*a).before(typeid(*b));
    });
    test(v); // 排序后调用虚函数

    for (auto i : v) {
        delete i;
    }

    return 0;
}
/* 结果：
sum: 7999999999838, time: 214
sum: 7999999999838, time: 197
*/
