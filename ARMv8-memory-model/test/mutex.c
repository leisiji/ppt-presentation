#include <pthread.h>
#include <unistd.h>

static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

static int thread_var = 1;
void *thread1(void *arg) {
    sleep(1);
    pthread_mutex_lock(&mutex);
    thread_var = 1000;
    pthread_mutex_unlock(&mutex);
    return NULL;
}
void *thread2(void *arg) {
    int a = thread_var;
    while (a != 1000) {
        pthread_mutex_lock(&mutex);
        a = thread_var;
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}
int main(int argc, char *argv[]) {
    pthread_t thread1_tid, thread2_tid;
    pthread_create(&thread1_tid, NULL, thread1, NULL);
    pthread_create(&thread2_tid, NULL, thread2, NULL);
    pthread_join(thread1_tid, NULL); pthread_join(thread2_tid, NULL);
    return 0;
}
