#include <pthread.h>
#include <unistd.h>

static _Atomic int thread_var = 1;
void *thread1(void *arg) {
    sleep(1);
    thread_var = 1000;
    return NULL;
}
void *thread2(void *arg) {
    while (thread_var != 1000) {}
    return NULL;
}
int main(int argc, char *argv[]) {
    pthread_t thread1_tid, thread2_tid;
    pthread_create(&thread1_tid, NULL, thread1, NULL);
    pthread_create(&thread2_tid, NULL, thread2, NULL);
    pthread_join(thread1_tid, NULL); pthread_join(thread2_tid, NULL);
    return 0;
}
