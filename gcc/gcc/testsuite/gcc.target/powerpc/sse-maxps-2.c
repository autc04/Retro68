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
#define TEST sse_test_maxps_2
#endif

#include <xmmintrin.h>

static __m128
__attribute__((noinline, unused))
test (__m128 s1, __m128 s2)
{
  return _mm_max_ps (s1, s2);
}

static void
TEST (void)
{
  union128 u, s1, s2;
  float e[4];
  int i;

  s1.x = _mm_set_ps (24.43, __builtin_nanf("1"), __builtin_nanf("2"), 546.46);
  s2.x = _mm_set_ps (__builtin_nanf("3"), __builtin_nanf("4"), 3.15, 4.14);
  u.x = test (s1.x, s2.x);

  for (i = 0; i < 4; i++)
    e[i] = s1.a[i] > s2.a[i] ? s1.a[i] : s2.a[i];

  if (__builtin_memcmp (&u, e, 16))
    abort ();
}
