/* { dg-do compile } */
/* { dg-additional-options "-march=rv32gcv_zvfh -mabi=ilp32d -mrvv-vector-bits=scalable -ffast-math -fno-vect-cost-model" } */

#include <stdint-gcc.h>

#define TEST_TYPE(TYPE)                                                        \
  __attribute__ ((noipa)) void ternop_##TYPE (TYPE *__restrict dst,            \
					      TYPE *__restrict a,              \
					      TYPE *__restrict b, int n)       \
  {                                                                            \
    for (int i = 0; i < n; i++)                                                \
      dst[i] = a[i] * b[i] - dst[i];                                           \
  }

#define TEST_ALL()                                                             \
  TEST_TYPE (_Float16)                                                         \
  TEST_TYPE (float)                                                            \
  TEST_TYPE (double)

TEST_ALL ()

/* { dg-final { scan-assembler-times {\tvfmsub\.vv} 3 } } */
/* { dg-final { scan-assembler-not {\tvmv} } } */
