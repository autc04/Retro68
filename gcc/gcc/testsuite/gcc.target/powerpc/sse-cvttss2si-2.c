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
#define TEST sse_test_cvttss2si_2
#endif

#include <xmmintrin.h>

static long long
__attribute__((noinline, unused))
test (__m128 p)
{
  __asm("" : "+v"(p));
  return _mm_cvttss_si64 (p); 
}

static void
TEST (void)
{
  union128 s1;
  long long d;
  long long e;
   
  s1.x = _mm_set_ps (24.43, 68.346, 43.35, 429496729501.4);
  d = test (s1.x); 
  e = (long long)s1.a[0];  

  if (e != d)
    abort ();
}
