#include <pthread.h>
#include <stdatomic.h>

int a = 0;

void *thread(void *arg)
{
	for (int i = 0; i < 100000; i++) {
		a++;
	}
}

int main (int argc, char *argv[])
{
	pthread_t t1, t2, t3;
	pthread_create(&t1, NULL, thread, NULL);
	pthread_create(&t2, NULL, thread, NULL);
	pthread_create(&t3, NULL, thread, NULL);
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	pthread_join(t3, NULL);
	printf("%d\n", a);
	return 0;
}
