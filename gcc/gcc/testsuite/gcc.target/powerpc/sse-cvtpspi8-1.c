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
#define TEST sse_test_cvtpspi8_1
#endif

#include <xmmintrin.h>

static __m64
__attribute__((noinline, unused))
test (__m128 p)
{
  return _mm_cvtps_pi8 (p);
}

static void 
TEST (void)
{
  union128 s1;
  __m64 d;
  __m64 e;

  s1.x = _mm_setr_ps (24.43, 68.546, 43.35, -46.46);
  d = test (s1.x);

  e = _mm_setr_pi8 (24, 69, 43, -46, 0, 0, 0, 0);

  if (e != d)
    abort ();
}
