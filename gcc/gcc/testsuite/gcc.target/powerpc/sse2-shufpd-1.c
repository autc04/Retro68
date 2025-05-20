/* { dg-do run } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#ifndef CHECK_H
#define CHECK_H "sse2-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse2_test_shufpd_1
#endif

#define N 0xab

#include <emmintrin.h>

static __m128d
__attribute__((noinline, unused))
test (__m128d s1, __m128d s2)
{
  return _mm_shuffle_pd (s1, s2, N); 
}

static void
TEST (void)
{
  union128d u, s1, s2;
  double e[2] = {0.0};
   
  s1.x = _mm_set_pd (2134.3343,1234.635654);
  s2.x = _mm_set_pd (453.345635,54646.464356);
  u.x = test (s1.x, s2.x);

  e[0] = (N & (1 << 0)) ? s1.a[1] : s1.a[0];
  e[1] = (N & (1 << 1)) ? s2.a[1] : s2.a[0];

  if (check_union128d(u, e))
    abort ();
}
