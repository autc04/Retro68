/* { dg-do run } */
/* { dg-options "-O2 -mvsx" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#ifndef CHECK_H
#define CHECK_H "sse4_1-check.h"
#endif

#ifndef TEST
#define TEST sse4_1_test
#endif

#include CHECK_H

#include <smmintrin.h>

#define NUM 64

static void
TEST (void)
{
  union
    {
      __m128i x[NUM / 2];
      long long ll[NUM];
    } dst, src1, src2;
  int i, sign=1;
  long long is_eq;

  for (i = 0; i < NUM; i++)
    {
      src1.ll[i] = i * i * sign;
      src2.ll[i] = (i + 20) * sign;
      sign = -sign;
    }

  for (i = 0; i < NUM; i += 2)
    dst.x [i / 2] = _mm_cmpeq_epi64(src1.x [i / 2], src2.x [i / 2]);

  for (i = 0; i < NUM; i++)
    {
      is_eq = src1.ll[i] == src2.ll[i] ? 0xffffffffffffffffLL : 0LL;
      if (is_eq != dst.ll[i])
	abort ();
    }
}
