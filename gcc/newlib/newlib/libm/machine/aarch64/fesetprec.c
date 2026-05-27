#if defined(__CYGWIN__)

/* http://www.open-std.org/jtc1/sc22//WG14/www/docs/n752.htm:

   The fesetprec function establishes the precision represented by its
   argument prec.  If the argument does not match a precision macro, the
   precision is not changed.

   The fesetprec function returns a nonzero value if and only if the
   argument matches a precision macro (that is, if and only if the requested
   precision can be established). */
int
fesetprec (int prec)
{
  /* Aarch64 doesn't support changing precision at runtime. */
  return 0; // return failure
}
#else

#include "../../fenv/fenv_stub.c"

#endif
