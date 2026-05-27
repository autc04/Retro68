#include <_ansi.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <mips/hal.h>

extern char _end[];

/* FIXME: This is not ideal, since we do a get_ram_range() call for
   every sbrk() call. */
char *
sbrk (int nbytes)
{
  static char *heap_ptr = NULL;
  static char *heap_start = NULL;
  static unsigned long heap_size = 0;
  char        *base;
  ptrdiff_t avail = 0;
  void *ram_base;
  void *ram_extent;

  if (heap_start == NULL)
    {
      _get_ram_range (&ram_base, &ram_extent);

      /* If the _end symbol is within the RAM then use _end.  */
      if ((void*)_end > ram_base && (void*)_end < ram_extent)
	{
	  heap_start = _end;
	  heap_ptr = _end;
	  heap_size = ram_extent - (void*)_end;
	}
      else
	{
	  heap_start = ram_base;
	  heap_ptr = ram_base;
	  heap_size = ram_extent - ram_base;
	}
    }

  if ((heap_ptr >= heap_start) &&
      (heap_ptr < (heap_start + heap_size))) {
    avail = (heap_start + heap_size) - heap_ptr;
    base = heap_ptr;
  } /* else will fail since "nbytes" will be greater than zeroed "avail" value */

  if ((nbytes > avail) || (heap_ptr + nbytes < heap_start))
   base = (char *)-1;
  else
   heap_ptr += nbytes;

  return base;
}
