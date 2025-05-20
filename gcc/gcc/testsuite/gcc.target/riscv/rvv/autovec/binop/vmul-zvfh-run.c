/* { dg-do run { target { riscv_v && riscv_zvfh } } } */
/* { dg-additional-options "-std=c99 -fno-vect-cost-model -mrvv-vector-bits=zvl -ffast-math" } */

#include "vmul-template.h"

#include <assert.h>

#define SZ 512

#define RUN(TYPE, VAL)                                                         \
  TYPE a##TYPE[SZ];                                                            \
  TYPE b##TYPE[SZ];                                                            \
  for (int i = 0; i < SZ; i++)                                                 \
    {                                                                          \
      a##TYPE[i] = 2;                                                          \
      b##TYPE[i] = VAL;                                                        \
    }                                                                          \
  vmul_##TYPE (a##TYPE, a##TYPE, b##TYPE, SZ);                                 \
  for (int i = 0; i < SZ; i++)                                                 \
    assert (a##TYPE[i] == 2 * VAL);

#define RUN2(TYPE, VAL)                                                        \
  TYPE as##TYPE[SZ];                                                           \
  for (int i = 0; i < SZ; i++)                                                 \
    as##TYPE[i] = 3;                                                           \
  vmuls_##TYPE (as##TYPE, as##TYPE, VAL, SZ);                                  \
  for (int i = 0; i < SZ; i++)                                                 \
    assert (as##TYPE[i] == 3 * VAL);

#define RUN_ALL()	\
 RUN(_Float16, 4)	\
 RUN2(_Float16, 10)	\

int main ()
{
  RUN_ALL()
}
