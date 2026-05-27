#if defined(__CYGWIN__)

/* Returns the currently selected precision, represented by one of the
   values of the defined precision macros. */
int
fegetprec (void)
{
  /* AArch64 doesn't have configurable precision.
     Return a fixed value indicating double precision (most common). */
  return -1;
}

#else

#include "../../fenv/fenv_stub.c"

#endif
