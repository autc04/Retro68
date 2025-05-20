/* { dg-do compile } */
/* { dg-options "-mavx512vbmi2 -O2" } */
/* { dg-final { scan-assembler-times "vpshrdvw\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\n\r]*%zmm\[0-9\]+\[^\n\r]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvw\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\\n\\r]*%zmm\[0-9\]+\[^\\n\\r\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvw\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\\n\\r]*%zmm\[0-9\]+\[^\\n\\r\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvd\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\n\r]*%zmm\[0-9\]+\[^\n\r]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvd\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\\n\\r]*%zmm\[0-9\]+\[^\\n\\r\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvd\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\\n\\r]*%zmm\[0-9\]+\[^\\n\\r\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvq\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\n\r]*%zmm\[0-9\]+\[^\n\r]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvq\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\\n\\r]*%zmm\[0-9\]+\[^\\n\\r\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpshrdvq\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\\n\\r]*%zmm\[0-9\]+\[^\\n\\r\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)" 1 } } */



#include <immintrin.h>

volatile __m512i x,y,z,z1;
volatile __mmask32 m32;
volatile __mmask16 m16;
volatile __mmask8 m8;

void extern
avx512f_test (void)
{
  x = _mm512_shrdv_epi16 (x, y, z);
  x = _mm512_mask_shrdv_epi16 (x, m32, y, z);
  x = _mm512_maskz_shrdv_epi16 (m32, x, y, z);

  x = _mm512_shrdv_epi32 (x, y, z);
  x = _mm512_mask_shrdv_epi32 (x, m16, y, z);
  x = _mm512_maskz_shrdv_epi32 (m16, x, y, z);

  x = _mm512_shrdv_epi64 (x, y, z);
  x = _mm512_mask_shrdv_epi64 (x, m8, y, z);
  x = _mm512_maskz_shrdv_epi64 (m8, x, y, z);
}
