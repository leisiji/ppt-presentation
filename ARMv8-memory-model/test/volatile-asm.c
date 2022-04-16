#include <stdint.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    uint64_t msr;
    asm ("rdtsc\n\t"
                 "shl $32, %%rdx\n\t"
                 "or %%rdx, %0"
                 : "=a"(msr)
                 :
                 : "rdx");
    printf("msr: %lx\n", msr);

    asm ("rdtsc\n\t"
                 "shl $32, %%rdx\n\t"
                 "or %%rdx, %0"
                 : "=a"(msr)
                 :
                 : "rdx");
    printf("msr: %lx\n", msr);
    return 0;
}
