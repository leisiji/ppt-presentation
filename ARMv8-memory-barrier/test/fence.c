#include <stdatomic.h>
#include <string.h>

atomic_uintptr_t ptr;

int main (int argc, char *argv[])
{
	const char *p = strdup("Hello world");
	// atomic_thread_fence(memory_order_acquire);
	// atomic_thread_fence(memory_order_release);
	atomic_store_explicit(&ptr, (unsigned long)p, memory_order_relaxed);
	return 0;
}
