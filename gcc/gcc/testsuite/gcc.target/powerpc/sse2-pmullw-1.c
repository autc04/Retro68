/* { dg-do run } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#define NO_WARN_X86_INTRINSICS 1

#ifndef CHECK_H
#define CHECK_H "sse2-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse2_test_pmullw_1
#endif

#include <emmintrin.h>

static __m128i
__attribute__((noinline, unused))
test (__m128i s1, __m128i s2)
{
  __asm("" : "+v"(s1), "+v"(s2));
  return _mm_mullo_epi16 (s1, s2); 
}

static void
TEST (void)
{
  union128i_w u, s1, s2;
  short e[8];
  int i, tmp;
   
  s1.x = _mm_set_epi16 (10,2067,-3033,90,80,40,-1000,15);
  s2.x = _mm_set_epi16 (11, 9834, 7444, -10222, 34, -7833, 39, 14);
  u.x = test (s1.x, s2.x); 
   
  for (i = 0; i < 8; i++)
    {
      tmp = s1.a[i] * s2.a[i];
    
      e[i] = tmp;
    }

  if (check_union128i_w (u, e))
    abort ();
}
