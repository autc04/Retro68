/* { dg-do run { target { riscv_v && riscv_zvfh } } } */
/* { dg-additional-options "-std=c99 -fno-vect-cost-model -mrvv-vector-bits=scalable" } */

#include "vfcvt_rtz-template.h"

#define RUN(TYPE1, TYPE2, NUM)                                                 \
  TYPE1 src##TYPE1##TYPE2##NUM[NUM];                                           \
  TYPE2 dst##TYPE1##TYPE2##NUM[NUM];                                           \
  for (int i = 0; i < NUM; i++)                                                \
    {                                                                          \
      src##TYPE1##TYPE2##NUM[i] = i * -3.1315926 - 8932.947289;                \
    }                                                                          \
  vfcvt_##TYPE1##TYPE2 (dst##TYPE1##TYPE2##NUM, src##TYPE1##TYPE2##NUM, NUM);  \
  for (int i = 0; i < NUM; i++)                                                \
    if (dst##TYPE1##TYPE2##NUM[i] != (TYPE2) src##TYPE1##TYPE2##NUM[i])        \
      __builtin_abort ();

#define RUN2(TYPE1, TYPE2, NUM)                                                \
  TYPE1 src##TYPE1##TYPE2##NUM[NUM];                                           \
  TYPE2 dst##TYPE1##TYPE2##NUM[NUM];                                           \
  for (int i = 0; i < NUM; i++)                                                \
    {                                                                          \
      src##TYPE1##TYPE2##NUM[i] = i * 3.1315926 + 8932.947289;                 \
    }                                                                          \
  vfcvt_##TYPE1##TYPE2 (dst##TYPE1##TYPE2##NUM, src##TYPE1##TYPE2##NUM, NUM);  \
  for (int i = 0; i < NUM; i++)                                                \
    if (dst##TYPE1##TYPE2##NUM[i] != (TYPE2) src##TYPE1##TYPE2##NUM[i])        \
      __builtin_abort ();

int
main ()
{
  RUN (_Float16, int16_t, 3)
  RUN (_Float16, int16_t, 4)
  RUN (_Float16, int16_t, 7)
  RUN (_Float16, int16_t, 99)
  RUN (_Float16, int16_t, 119)
  RUN (_Float16, int16_t, 128)
  RUN (_Float16, int16_t, 256)
  RUN (_Float16, int16_t, 279)
  RUN (_Float16, int16_t, 555)
  RUN (_Float16, int16_t, 1024)
  RUN (_Float16, int16_t, 1389)
  RUN (_Float16, int16_t, 2048)
  RUN (_Float16, int16_t, 3989)
  RUN (_Float16, int16_t, 4096)
  RUN (_Float16, int16_t, 5975)

  RUN2 (_Float16, uint16_t, 3)
  RUN2 (_Float16, uint16_t, 4)
  RUN2 (_Float16, uint16_t, 7)
  RUN2 (_Float16, uint16_t, 99)
  RUN2 (_Float16, uint16_t, 119)
  RUN2 (_Float16, uint16_t, 128)
  RUN2 (_Float16, uint16_t, 256)
  RUN2 (_Float16, uint16_t, 279)
  RUN2 (_Float16, uint16_t, 555)
  RUN2 (_Float16, uint16_t, 1024)
  RUN2 (_Float16, uint16_t, 1389)
  RUN2 (_Float16, uint16_t, 2048)
  RUN2 (_Float16, uint16_t, 3989)
  RUN2 (_Float16, uint16_t, 4096)
  RUN2 (_Float16, uint16_t, 5975)
}
