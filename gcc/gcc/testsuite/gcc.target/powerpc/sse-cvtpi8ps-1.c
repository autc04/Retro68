/* { dg-do run } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#define NO_WARN_X86_INTRINSICS 1

#ifndef CHECK_H
#define CHECK_H "sse-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse_test_cvtpi8ps_1
#endif

#include <xmmintrin.h>

static __m128
__attribute__((noinline, unused))
test (__m64  __A)
{
  return _mm_cvtpi8_ps (__A);
}

//static
void
TEST (void)
{
  __m64_union s1;
  union128 u;
  float e[4] = {100.0, -100.0, 45.0, -1.0};

  s1.as_m64 = _mm_setr_pi8 (100, -100, 45, -1, 123, -21, 34, 56);
   
  u.x = test (s1.as_m64);

  if (check_union128 (u, e))
    abort ();
}
