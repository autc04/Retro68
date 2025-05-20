/* { dg-do run } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#ifndef CHECK_H
#define CHECK_H "sse2-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse2_test_psrlw_2
#endif

#include <emmintrin.h>

static __m128i
__attribute__((noinline, unused))
test (__m128i s1, __m128i c)
{
  return _mm_srl_epi16 (s1, c); 
}

static void
TEST (void)
{
  union128i_w u, s;
  union128i_q c;
  short e[8] = {0};
  unsigned short tmp;
  int i;
 
  s.x = _mm_set_epi16 (1, -2, 3, 4, 5, 6, -0x7000, 0x9000);
  c.x = _mm_set_epi64x (12, 13);

  __asm("" : "+v"(s.x), "+v"(c.x));
  u.x = test (s.x, c.x);

  if (c.a[0] < 16)
    for (i = 0; i < 8; i++)
      {
        tmp = s.a[i];
        e[i] = tmp >> c.a[0];
      }

  if (check_union128i_w (u, e))
    abort (); 
}
