/* { dg-do run { target { riscv_v && riscv_zvfh } } } */
/* { dg-additional-options "-std=c99 -fno-vect-cost-model -mrvv-vector-bits=scalable" } */

#include "vfwcvt-template.h"

#include <assert.h>

#define SZ 512
#define EPS 1e-4

#define RUN(TYPE1, TYPE2)                                                      \
  TYPE1 src##TYPE1##TYPE2[SZ];                                                 \
  TYPE2 dst##TYPE1##TYPE2[SZ];                                                 \
  for (int i = 0; i < SZ; i++)                                                 \
    {                                                                          \
      src##TYPE1##TYPE2[i] = (i & 1) ? -i : i;                                 \
      src##TYPE1##TYPE2[i] *= 0.0003141592;                                    \
      dst##TYPE1##TYPE2[i] = -1;                                               \
    }                                                                          \
  vfwcvt_##TYPE1##TYPE2 (dst##TYPE1##TYPE2, src##TYPE1##TYPE2, SZ);            \
  for (int i = 0; i < SZ; i++)                                                 \
    assert (__builtin_fabsf16 (dst##TYPE1##TYPE2[i]                            \
			       - ((i & 1) ? -i : i) * 0.0003141592)            \
	    < EPS);

#define RUN_ALL()                                                              \
  RUN (_Float16, float)                                                        \
  RUN (_Float16, double)
int main ()
{
  RUN_ALL()
}
