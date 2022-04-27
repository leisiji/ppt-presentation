#include <string.h>
#include <stdatomic.h>
#include <assert.h>
#include <pthread.h>

#define STRING "hello world"
int data = 0;
atomic_uintptr_t ptr;

static void *producer(void *d)
{
	const char *p = strdup(STRING);
	data = 42;
	atomic_store_explicit(&ptr, (long unsigned int)p, memory_order_seq_cst);
	return NULL;
}

static void *consumer(void *d)
{
	const char *p2 = NULL;
	while (!(p2 = (const char *)atomic_load_explicit(&ptr, memory_order_seq_cst))) { }
	assert(!strcmp(p2, STRING)); // never fail
	assert(data == 42); // may fail
	return NULL;
}

int main (int argc, char *argv[])
{
	pthread_t t1;
	pthread_t t2;
	pthread_create(&t1, NULL, producer, NULL);
	pthread_create(&t2, NULL, consumer, NULL);
	return 0;
}
