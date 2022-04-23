#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>
#include <stdbool.h>

atomic_bool locked = false;

void *thread_entry(void *data)
{
    int *sum = data;

    for (int i = 0; i < 100; i++) {
        while (atomic_exchange_explicit(&locked, true, memory_order_acquire)) {}
        int cur = *sum;
        *sum = cur + 1;
        atomic_store_explicit(&locked, false, memory_order_release);
    }

    return NULL;
}

int main(int argc, char *argv[])
{
    pthread_t threads[10];
    int sum = 0;

    for (int i = 0; i < 10; i++) {
        pthread_create(&threads[i], NULL, thread_entry, &sum);
    }
    for (int i = 0; i < 10; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("%d\n", sum);
    return 0;
}
