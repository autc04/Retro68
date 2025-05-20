/* { dg-do compile } */
/* { dg-additional-options "-march=rv32gcv_zvfh -mabi=ilp32d -mrvv-vector-bits=scalable -ffast-math" } */

#include <stdint-gcc.h>

#define TEST_TYPE(TYPE1, TYPE2)                                                \
  __attribute__ ((noipa)) void vwadd_##TYPE1_##TYPE2 (                         \
    TYPE1 *__restrict dst, TYPE1 *__restrict dst2, TYPE1 *__restrict dst3,     \
    TYPE1 *__restrict dst4, TYPE2 *__restrict a, TYPE2 *__restrict b,          \
    TYPE2 *__restrict a2, TYPE2 *__restrict b2, int *__restrict pred, int n)   \
  {                                                                            \
    for (int i = 0; i < n; i++)                                                \
      {                                                                        \
	dst[i] = pred[i] ? -((TYPE1) a[i] * (TYPE1) b[i]) - dst[i] : dst[i];   \
	dst2[i]                                                                \
	  = pred[i] ? -((TYPE1) a2[i] * (TYPE1) b[i]) - dst2[i] : dst2[i];     \
	dst3[i]                                                                \
	  = pred[i] ? -((TYPE1) a2[i] * (TYPE1) a[i]) - dst3[i] : dst3[i];     \
	dst4[i]                                                                \
	  = pred[i] ? -((TYPE1) a[i] * (TYPE1) b2[i]) - dst4[i] : dst4[i];     \
      }                                                                        \
  }

#define TEST_ALL()                                                             \
  TEST_TYPE (float, _Float16)                                                  \
  TEST_TYPE (double, float)

TEST_ALL ()

/* Other optimization removed some mask operand of vfwnmacc.vv, so expected 6
 * instead of 8.  */
/* { dg-final { scan-assembler-times {\tvfwnmacc\.vv\t} 6 } } */
/* { dg-final { scan-assembler-not {\tvmerge\.vvm\t} } } */
