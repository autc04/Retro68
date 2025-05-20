/* { dg-do run } */
/* { dg-options "-O3 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#ifndef CHECK_H
#define CHECK_H "ssse3-check.h"
#endif

#ifndef TEST
#define TEST ssse3_test
#endif

#include CHECK_H

#include "ssse3-vals.h"

#include <tmmintrin.h>

#ifndef __AVX__
/* Test the 64-bit form */
static void
ssse3_test_pabsd (__m64 *i1, __m64 *r)
{
  *r = _mm_abs_pi32 (*i1);
  _mm_empty ();
}
#endif

/* Test the 128-bit form */
static void
ssse3_test_pabsd128 (__m128i *i1, __m128i *r)
{
  /* Assumes incoming pointers are 16-byte aligned */
  *r = _mm_abs_epi32 (*i1);
}

/* Routine to manually compute the results */
static void
compute_correct_result (int *i1, int *r)
{
  int i;

  for (i = 0; i < 4; i++)
    if (i1[i] < 0)
      r[i] = -i1[i];
    else
      r[i] = i1[i];
}

static void
TEST (void)
{
  int i;
  union data r __attribute__ ((aligned(16)));
  union data ck;
  int fail = 0;

  for (i = 0; i < ARRAY_SIZE (vals); i++)
    {
      /* Manually compute the result */
      compute_correct_result(&vals[i].w[0], &ck.w[0]);

#ifndef __AVX__
      /* Run the 64-bit tests */
      ssse3_test_pabsd (&vals[i].ll[0], &r.ll[0]);
      ssse3_test_pabsd (&vals[i].ll[1], &r.ll[1]);
      fail += chk_128 (ck.m[0], r.m[0]);
#endif

      /* Run the 128-bit tests */
      ssse3_test_pabsd128 (&vals[i].m[0], &r.m[0]);
      fail += chk_128(ck.m[0], r.m[0]);
    }

  if (fail != 0)
    abort ();
}
