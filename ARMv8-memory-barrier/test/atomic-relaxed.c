#include <pthread.h>
#include <stdio.h>
#include <stdatomic.h>

void *thread_entry(void *data)
{
    atomic_int *sum = data;

    for (int i = 0; i < 100; i++) {
        atomic_fetch_add_explicit(sum, 1, memory_order_relaxed);
    }

    return NULL;
}

int main(int argc, char *argv[])
{
    pthread_t threads[10];
    atomic_int sum = 0;

    for (int i = 0; i < 10; i++) {
        pthread_create(&threads[i], NULL, thread_entry, &sum);
    }
    for (int i = 0; i < 10; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("%d\n", sum);
    return 0;
}
