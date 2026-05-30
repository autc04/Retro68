#include <machine/syscall.h>
#include <sys/types.h>
#include <utime.h>

/* Stub.  */
int
_utime(const char *path, const struct utimbuf *times)
{
  return -1;
}
