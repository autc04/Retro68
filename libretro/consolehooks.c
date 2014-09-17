#include <sys/types.h>

__attribute__((weak)) ssize_t consolewrite(int fd, const void *buf, size_t count)
{
	return -1;
}

__attribute__((weak)) ssize_t consoleread(int fd, void *buf, size_t count)
{
	return -1;
}
