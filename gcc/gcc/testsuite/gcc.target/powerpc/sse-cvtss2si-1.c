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
#define TEST sse_test_cvtss2si_1
#endif

#include <xmmintrin.h>
#include <smmintrin.h>

static int
__attribute__((noinline, unused))
test (__m128 p)
{
  return _mm_cvtss_si32 (p); 
}

//static
void
TEST (void)
{
  union128 s1;
  int d;
  union {
	float f;
	int i;
  } e;
   
  s1.x = _mm_set_ps (24.43, 68.346, 43.35, 546.46);
  d = test (s1.x); 

  e.i = _mm_extract_ps (s1.x, 0);
  e.i = e.f;

  if (e.i != d)
    abort ();
}
