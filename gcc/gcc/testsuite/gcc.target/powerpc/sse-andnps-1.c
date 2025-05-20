/* { dg-do run { target le } } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#define NO_WARN_X86_INTRINSICS 1

#ifndef CHECK_H
#define CHECK_H "sse-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse_test_andnps_1
#endif

#include <xmmintrin.h>

static __m128
__attribute__((noinline, unused))
test (__m128 s1, __m128 s2)
{
  return _mm_andnot_ps (s1, s2); 
}

static void
TEST (void)
{
  union128 u, s1, s2;
  int source1[4]={34, 545, 955, 67};
  int source2[4]={67, 4, 57, 897};
  int e[4];
  float f[4];
   
  s1.x = _mm_loadu_ps ((float *)source1);
  s2.x = _mm_loadu_ps ((float *)source2);
  u.x = test (s1.x, s2.x); 
   
  e[0] = (~source1[0]) & source2[0];
  e[1] = (~source1[1]) & source2[1];
  e[2] = (~source1[2]) & source2[2];
  e[3] = (~source1[3]) & source2[3];
  __builtin_memcpy (f, e, sizeof (f));

  if (check_union128 (u, f))
    abort ();
}
