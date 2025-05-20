/* { dg-options "-mlsx -w -fno-strict-aliasing" } */
#include "../simd_correctness_check.h"
#include <lsxintrin.h>

int
main ()
{
  __m128i __m128i_op0, __m128i_op1, __m128i_op2, __m128i_out, __m128i_result;
  __m128 __m128_op0, __m128_op1, __m128_op2, __m128_out, __m128_result;
  __m128d __m128d_op0, __m128d_op1, __m128d_op2, __m128d_out, __m128d_result;

  int int_op0, int_op1, int_op2, int_out, int_result, i = 1, fail;
  long int long_op0, long_op1, long_op2, lont_out, lont_result;
  long int long_int_out, long_int_result;
  unsigned int unsigned_int_out, unsigned_int_result;
  unsigned long int unsigned_long_int_out, unsigned_long_int_result;

  *((unsigned long *)&__m128i_op0[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_op0[0]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_result[0]) = 0x3ab7a3fc47a5c31a;
  __m128i_out = __lsx_vld ((unsigned long *)&__m128i_op0, 0x0);
  ASSERTEQ_64 (__LINE__, __m128i_result, __m128i_out);

  *((unsigned long *)&__m128i_op0[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_op0[0]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_result[0]) = 0x3ab7a3fc47a5c31a;
  __m128i_out = __lsx_vldx ((unsigned long *)&__m128i_op0, 0x0);
  ASSERTEQ_64 (__LINE__, __m128i_result, __m128i_out);

  *((unsigned long *)&__m128i_op0[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_op0[0]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[1]) = 0xc3c3c3c3c3c3c3c3;
  *((unsigned long *)&__m128i_result[0]) = 0xc3c3c3c3c3c3c3c3;
  __m128i_out = __lsx_vldrepl_b ((unsigned long *)&__m128i_op0, 0x1);
  ASSERTEQ_64 (__LINE__, __m128i_result, __m128i_out);

  *((unsigned long *)&__m128i_op0[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_op0[0]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[1]) = 0xc31ac31ac31ac31a;
  *((unsigned long *)&__m128i_result[0]) = 0xc31ac31ac31ac31a;
  __m128i_out = __lsx_vldrepl_h ((unsigned long *)&__m128i_op0, 0x0);
  ASSERTEQ_64 (__LINE__, __m128i_result, __m128i_out);

  *((unsigned long *)&__m128i_op0[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_op0[0]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[1]) = 0x47a5c31a47a5c31a;
  *((unsigned long *)&__m128i_result[0]) = 0x47a5c31a47a5c31a;
  __m128i_out = __lsx_vldrepl_w ((unsigned long *)&__m128i_op0, 0x0);
  ASSERTEQ_64 (__LINE__, __m128i_result, __m128i_out);

  *((unsigned long *)&__m128i_op0[1]) = 0x1dcc4255c9d85c05;
  *((unsigned long *)&__m128i_op0[0]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[1]) = 0x3ab7a3fc47a5c31a;
  *((unsigned long *)&__m128i_result[0]) = 0x3ab7a3fc47a5c31a;
  __m128i_out = __lsx_vldrepl_d ((unsigned long *)&__m128i_op0, 0x0);
  ASSERTEQ_64 (__LINE__, __m128i_result, __m128i_out);

  return 0;
}
