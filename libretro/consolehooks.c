#include <sys/types.h>

__attribute__((weak)) ssize_t _consolewrite(int fd, const void *buf, size_t count)
{
	return -1;
}

__attribute__((weak)) ssize_t _consoleread(int fd, void *buf, size_t count)
{
	return -1;
}
