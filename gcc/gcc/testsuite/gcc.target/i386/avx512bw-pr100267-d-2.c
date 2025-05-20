/* { dg-do run } */
/* { dg-options "-O2 -mavx512vbmi2" } */
/* { dg-require-effective-target avx512vbmi2 } */

#define AVX512F

#define AVX512VBMI2
#include "avx512f-helper.h"

#define SIZE (AVX512F_LEN / 32)
#include "avx512f-mask-type.h"

static void
CALC (int *s, int *r, MASK_TYPE mask)
{
  int i, k;

  for (i = 0, k = 0; i < SIZE; i++)
    {
      if (mask & ((long long)1 << i))
	r[i] = s[k++];
    }
}

void
TEST (void)
{
  UNION_TYPE (AVX512F_LEN, i_d) s1, res1, res2, res3, res4, res5, res6, res7, res8;
  MASK_TYPE mask = (1 << SIZE - 1) - 1;
  int s2[SIZE];
  int res_ref1[SIZE];
  int res_ref2[SIZE];
  int i, sign = 1;

  for (i = 0; i < SIZE; i++)
    {
      s1.a[i] = 12345 * (i + 200) * sign;
      s2[i] = 67890 * (i + 300) * sign;
      res1.a[i] = DEFAULT_VALUE;
      res5.a[i] = DEFAULT_VALUE;
      sign = -sign;
    }

  res2.x = INTRINSIC (_mask_expand_epi32) (res1.x, MASK_ALL_ONES, s1.x);
  res3.x = INTRINSIC (_mask_expand_epi32) (res1.x, 0, s1.x);
  res4.x = INTRINSIC (_mask_expand_epi32) (res1.x, mask, s1.x);
  res6.x = INTRINSIC (_mask_expandloadu_epi32) (res5.x, MASK_ALL_ONES, s2);
  res7.x = INTRINSIC (_mask_expandloadu_epi32) (res5.x, 0, s2);
  res8.x = INTRINSIC (_mask_expandloadu_epi32) (res5.x, mask, s2);

  CALC (s1.a, res_ref1, mask);
  CALC (s2, res_ref2, mask);

  if (UNION_CHECK (AVX512F_LEN, i_d) (res2, s1.a))
    abort ();

  if (UNION_CHECK (AVX512F_LEN, i_d) (res3, res1.a))
    abort ();

  MASK_MERGE (i_d) (res_ref1, mask, SIZE);
  if (UNION_CHECK (AVX512F_LEN, i_d) (res4, res_ref1))
    abort ();

  if (UNION_CHECK (AVX512F_LEN, i_d) (res6, s2))
    abort ();

  if (UNION_CHECK (AVX512F_LEN, i_d) (res7, res5.a))
    abort ();

  MASK_MERGE (i_d) (res_ref2, mask, SIZE);
  if (UNION_CHECK (AVX512F_LEN, i_d) (res8, res_ref2))
    abort ();
}
