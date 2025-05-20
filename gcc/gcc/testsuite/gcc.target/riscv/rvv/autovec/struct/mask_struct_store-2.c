/* { dg-do compile } */
/* { dg-additional-options "-std=c99 -march=rv32gcv_zvfh -mabi=ilp32d -mrvv-vector-bits=scalable -fno-vect-cost-model" } */

#include <stdint-gcc.h>

#define TEST_LOOP(NAME, OUTTYPE, INTYPE, MASKTYPE)		\
  void __attribute__ ((noinline, noclone))			\
  NAME##_3 (OUTTYPE *__restrict dest, INTYPE *__restrict src,	\
	    MASKTYPE *__restrict cond, INTYPE bias, intptr_t n)	\
  {								\
    for (intptr_t i = 0; i < n; ++i)				\
      {								\
	INTYPE value = src[i] + bias;				\
	if (cond[i])						\
	  {							\
	    dest[i * 3] = value;				\
	    dest[i * 3 + 1] = value;				\
	    dest[i * 3 + 2] = value;				\
	  }							\
      }								\
  }

#define TEST2(NAME, OUTTYPE, INTYPE) \
  TEST_LOOP (NAME##_i8, OUTTYPE, INTYPE, int8_t) \
  TEST_LOOP (NAME##_i16, OUTTYPE, INTYPE, uint16_t) \
  TEST_LOOP (NAME##_f32, OUTTYPE, INTYPE, float) \
  TEST_LOOP (NAME##_f64, OUTTYPE, INTYPE, double)

#define TEST1(NAME, OUTTYPE) \
  TEST2 (NAME##_i8, OUTTYPE, int8_t) \
  TEST2 (NAME##_i16, OUTTYPE, uint16_t) \
  TEST2 (NAME##_i32, OUTTYPE, int32_t) \
  TEST2 (NAME##_i64, OUTTYPE, uint64_t)

#define TEST(NAME) \
  TEST1 (NAME##_i8, int8_t) \
  TEST1 (NAME##_i16, uint16_t) \
  TEST1 (NAME##_i32, int32_t) \
  TEST1 (NAME##_i64, uint64_t) \
  TEST2 (NAME##_f16_f16, _Float16, _Float16) \
  TEST2 (NAME##_f32_f32, float, float) \
  TEST2 (NAME##_f64_f64, double, double)

TEST (test)

/* { dg-final { scan-assembler-times {vsseg3e8\.v\s+v[0-9]+,\s*\([a-x0-9]+\),\s*v0.t} 16 } } */
/* { dg-final { scan-assembler-times {vsseg3e16\.v\s+v[0-9]+,\s*\([a-x0-9]+\),\s*v0.t} 20 } } */
/* { dg-final { scan-assembler-times {vsseg3e32\.v\s+v[0-9]+,\s*\([a-x0-9]+\),\s*v0.t} 20 } } */
/* { dg-final { scan-assembler-times {vsseg3e64\.v\s+v[0-9]+,\s*\([a-x0-9]+\),\s*v0.t} 20 } } */
