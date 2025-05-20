/* { dg-do run } */
/* { dg-options "-O2 -mavx512vbmi2" } */
/* { dg-require-effective-target avx512vbmi2 } */

#define AVX512F
#include <stdio.h>
#define AVX512VBMI2
#include "avx512f-helper.h"

#define SIZE (AVX512F_LEN / 8)
#include "avx512f-mask-type.h"
#include <x86intrin.h>

static void
CALC (char *s, char *r, MASK_TYPE mask)
{
  int i, k;

  for (i = 0, k = 0; i < SIZE; i++)
    {
      if (mask & ((long long)1 << i))
	r[k++] = s[i];
    }
}

void
TEST (void)
{
  UNION_TYPE (AVX512F_LEN, i_b) s, res1, res2;
  char res3[SIZE];
  MASK_TYPE compressed_mask, mask = MASK_VALUE;
  char res_ref[SIZE];
  long long i, mask_bit_count, sign = 1;

  for (i = 0; i < SIZE; i++)
    {
      s.a[i] = 12345 * (i + 200) * sign;
      res1.a[i] = DEFAULT_VALUE;
      res3[i] = DEFAULT_VALUE;
      sign = -sign;
    }

  res1.x = INTRINSIC (_mask_compress_epi8) (res1.x, mask, s.x);
  res2.x = INTRINSIC (_maskz_compress_epi8) (mask, s.x);
  INTRINSIC (_mask_compressstoreu_epi8) (res3, mask, s.x);

  // Swt
  if (AVX512F_LEN == 512)
    mask_bit_count = _popcnt32((int)(mask & (((long long)1 << 32) - 1)))
		     + _popcnt32((int)((long long)mask >> 32));
  else
    mask_bit_count = __popcntd(mask);
  compressed_mask = ((long long)1 << mask_bit_count) - 1;
  CALC (s.a, res_ref, mask);

  MASK_MERGE (i_b) (res_ref, compressed_mask, SIZE);
  if (UNION_CHECK (AVX512F_LEN, i_b) (res1, res_ref))
    abort ();

  MASK_ZERO (i_b) (res_ref, compressed_mask, SIZE);
  if (UNION_CHECK (AVX512F_LEN, i_b) (res2, res_ref))
    abort ();

  MASK_MERGE (i_b) (res_ref, compressed_mask, SIZE);
  if (checkVc (res3, res_ref, SIZE))
    abort ();
}
