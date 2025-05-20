/* { dg-do compile } */
/* { dg-options "-mavx512fp16 -mavx512vl -mtune=generic -mtune-ctrl=dest_false_dep_for_glc -O2" } */

#include <immintrin.h>

extern __m512h h1;
extern __m256h h2;
extern __m128h h3;

__mmask32 m32;
__mmask16 m16;
__mmask8 m8;

__m512h
foo1 (__m512h h2, __m512h h1)
{
  return _mm512_fmul_pch (h1, h1);
}

__m512h
foo2 (__m512h h2, __m512h h1)
{
  return _mm512_fmul_round_pch (h1, h1, 8);
}

__m512h
foo3 (__m512h h2, __m512h h1)
{
  return _mm512_mask_fmul_pch (h1, m32, h1, h1);
}

__m512h
foo4 (__m512h h2, __m512h h1)
{
  return _mm512_mask_fmul_round_pch (h1, m32, h1, h1, 8);
}

__m512h
foo5 (__m512h h2, __m512h h1)
{
  return _mm512_maskz_fmul_pch (m32, h1, h1);
}

__m512h
foo6 (__m512h h2, __m512h h1)
{
  return _mm512_maskz_fmul_round_pch (m32, h1, h1, 11);
}

__m128h
bar1 (__m128h h2, __m128h h1)
{
  return _mm_fmul_sch (h1, h1);
}

__m128h
bar2 (__m128h h2, __m128h h1)
{
  return _mm_fmul_round_sch (h1, h1, 8);
}

__m128h
bar3 (__m128h h2, __m128h h1)
{
  return _mm_mask_fmul_sch (h1, m8, h1, h1);
}

__m128h
bar4 (__m128h h2, __m128h h1)
{
  return _mm_mask_fmul_round_sch (h1, m8, h1, h1, 8);
}

__m128h
bar5 (__m128h h2, __m128h h1)
{
  return _mm_maskz_fmul_sch (m8, h1, h1);
}

__m128h
bar6 (__m128h h2, __m128h h1)
{
  return _mm_maskz_fmul_round_sch (m8, h1, h1, 11);
}

__m128h
zoo1 (__m128h h1, __m128h h3)
{
  return _mm_getmant_sh (h3, h3, _MM_MANT_NORM_p75_1p5,
			 _MM_MANT_SIGN_src);
}

__m128h
zoo2 (__m128h h1, __m128h h3)
{
  return _mm_mask_getmant_sh (h3, m8, h3, h3, _MM_MANT_NORM_p75_1p5,
			      _MM_MANT_SIGN_src);
}

__m128h
zoo3 (__m128h h1, __m128h h3)
{
  return _mm_maskz_getmant_sh (m8, h3, h3, _MM_MANT_NORM_p75_1p5,
			       _MM_MANT_SIGN_src);
}

/* { dg-final { scan-assembler-times "vxorps" 10 } } */
/* { dg-final { scan-assembler-times "vfmulcph" 6 } } */
/* { dg-final { scan-assembler-times "vfmulcsh" 6 } } */
/* { dg-final { scan-assembler-times "vgetmantsh" 3 } } */

