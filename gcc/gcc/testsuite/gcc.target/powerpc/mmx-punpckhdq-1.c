/* { dg-do run } */
/* { dg-options "-O3 -mvsx" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#define NO_WARN_X86_INTRINSICS 1
#ifndef CHECK_H
#define CHECK_H "mmx-check.h"
#endif

#ifndef TEST
#define TEST mmx_test
#endif

#include CHECK_H

#include <mmintrin.h>

static __m64
__attribute__((noinline, unused))
test (__m64 s1, __m64 s2)
{
  return _mm_unpackhi_pi32 (s1, s2);
}

static void
TEST (void)
{
  __m64_union u, s1, s2, e;
   
  s1.as_m64 = 0x0706050403020100UL;
  s2.as_m64 = 0x1716151413121110UL;
  u.as_m64 = test (s1.as_m64, s2.as_m64);

  e.as_int[0] = s1.as_int[1];
  e.as_int[1] = s2.as_int[1];

  if (u.as_m64 != e.as_m64)
    abort ();
}
