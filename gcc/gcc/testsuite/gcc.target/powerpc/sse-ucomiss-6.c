/* { dg-do run } */
/* { dg-options "-O3 -mvsx" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#define NO_WARN_X86_INTRINSICS 1

#ifndef CHECK_H
#define CHECK_H "sse-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse_test_ucomiss_6
#endif

#include <xmmintrin.h>

static int 
__attribute__((noinline, unused))
test (__m128 s1, __m128 s2)
{
  return _mm_ucomineq_ss (s1, s2); 
}

static void
TEST (void)
{
  union128  s1, s2;
  int d[1];
  int e[1];

  s1.x = _mm_set_ps (24.43, 68.346, 43.35, 546.46);
  s2.x = _mm_set_ps (1.17, 2.16, 3.15, 4.14);
  d[0] = test (s1.x, s2.x); 
  e[0] = s1.a[0] != s2.a[0];

  if (checkVi (d, e, 1))
    abort ();
}
