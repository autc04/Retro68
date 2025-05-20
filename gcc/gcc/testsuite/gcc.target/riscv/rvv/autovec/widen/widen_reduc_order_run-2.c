/* { dg-do run { target { riscv_v } } } */
/* { dg-additional-options "-mrvv-vector-bits=scalable -fno-vect-cost-model" } */

#include "widen_reduc_order-2.c"

#define RUN(TYPE1, TYPE2, N)                                                   \
  {                                                                            \
    TYPE2 a[N];                                                                \
    TYPE1 r = 0;                                                               \
    for (int i = 0; i < N; i++) {                                              \
      a[i] = (i * 0.1) * (i & 1 ? 1 : -1);                                     \
      r += a[i];                                                               \
      asm volatile("" ::: "memory");                                           \
    }                                                                          \
    if (r != reduc_##TYPE1##_##TYPE2(a))                                       \
      __builtin_abort();                                                       \
  }

int __attribute__((optimize(1))) main() {
  TEST_ALL(RUN)
  return 0;
}
