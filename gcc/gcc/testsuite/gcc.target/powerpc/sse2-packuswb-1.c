/* { dg-do run } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#ifndef CHECK_H
#define CHECK_H "sse2-check.h"
#endif

#include CHECK_H

#ifndef TEST
#define TEST sse2_test_packuswb_1
#endif

#include <emmintrin.h>

static __m128i
__attribute__((noinline, unused))
test (__m128i s1, __m128i s2)
{
  __asm("" : "+v"(s1), "+v"(s2));
  return _mm_packus_epi16 (s1, s2); 
}

static void
TEST (void)
{
  union128i_w s1, s2;
  union128i_ub u;
  unsigned char e[16];
  int i, tmp;
   
  s1.x = _mm_set_epi16 (1, 2, 3, 4, -5, -6, -7, -8);
  s2.x = _mm_set_epi16 (-9, -10, -11, -12, 13, 14, 15, 16);
  u.x = test (s1.x, s2.x); 

  for (i=0; i<8; i++)
    {
      tmp = s1.a[i]<0 ? 0 : s1.a[i];
      tmp = tmp>255 ? 255 : tmp;
      e[i] = tmp;

      tmp = s2.a[i]<0 ? 0 : s2.a[i];
      tmp = tmp>255 ? 255 : tmp;
      e[i+8] = tmp;
    }

  if (check_union128i_ub (u, e))
    {
#if DEBUG
      printf ("sse2_test_packuswb_1; check_union128i_w failed\n");
      printf ("\t ([%x,%x,%x,%x, %x,%x,%x,%x], [%x,%x,%x,%x, %x,%x,%x,%x])\n",
	      s1.a[0], s1.a[1], s1.a[2], s1.a[3], s1.a[4], s1.a[5], s1.a[6],
	      s1.a[7], s2.a[0], s2.a[1], s2.a[2], s2.a[3], s2.a[4], s2.a[5],
	      s2.a[6], s2.a[7]);
      printf ("\t\t -> [%x,%x,%x,%x, %x,%x,%x,%x, %x,%x,%x,%x, %x,%x,%x,%x]\n",
	      u.a[0], u.a[1], u.a[2], u.a[3], u.a[4], u.a[5], u.a[6], u.a[7],
	      u.a[8], u.a[9], u.a[10], u.a[11], u.a[12], u.a[13], u.a[14],
	      u.a[15]);
      printf ("\t expect [%x,%x,%x,%x, %x,%x,%x,%x,"
	      " %x,%x,%x,%x, %x,%x,%x,%x]\n",
	      e[0], e[1], e[2], e[3], e[4], e[5], e[6], e[7], e[8], e[9],
	      e[10], e[11], e[12], e[13], e[14], e[15]);
#endif
      abort ();
    }
}
