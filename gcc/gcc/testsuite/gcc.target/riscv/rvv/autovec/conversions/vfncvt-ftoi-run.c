/* { dg-do run { target { riscv_v } } } */
/* { dg-additional-options "-std=c99 -fno-vect-cost-model -mrvv-vector-bits=scalable" } */

#include "vfncvt-ftoi-template.h"

#define RUN(TYPE1, TYPE2, NUM)                                                 \
  TYPE1 src##TYPE1##TYPE2##NUM[NUM];                                           \
  TYPE2 dst##TYPE1##TYPE2##NUM[NUM];                                           \
  for (int i = 0; i < NUM; i++)                                                \
    {                                                                          \
      src##TYPE1##TYPE2##NUM[i] = i * -3.1315926 - 92.947289;                  \
    }                                                                          \
  vfncvt_##TYPE1##TYPE2 (dst##TYPE1##TYPE2##NUM, src##TYPE1##TYPE2##NUM, NUM); \
  for (int i = 0; i < NUM; i++)                                                \
    if (dst##TYPE1##TYPE2##NUM[i] != (TYPE2) src##TYPE1##TYPE2##NUM[i])        \
      __builtin_abort ();

#define RUN2(TYPE1, TYPE2, NUM)                                                \
  TYPE1 src##TYPE1##TYPE2##NUM[NUM];                                           \
  TYPE2 dst##TYPE1##TYPE2##NUM[NUM];                                           \
  for (int i = 0; i < NUM; i++)                                                \
    {                                                                          \
      src##TYPE1##TYPE2##NUM[i] = i * 3.1315926 + 92.947289;                   \
    }                                                                          \
  vfncvt_##TYPE1##TYPE2 (dst##TYPE1##TYPE2##NUM, src##TYPE1##TYPE2##NUM, NUM); \
  for (int i = 0; i < NUM; i++)                                                \
    if (dst##TYPE1##TYPE2##NUM[i] != (TYPE2) src##TYPE1##TYPE2##NUM[i])        \
      __builtin_abort ();

int
main ()
{
  RUN (float, int16_t, 3)
  RUN (float, int16_t, 4)
  RUN (float, int16_t, 7)
  RUN (float, int16_t, 99)
  RUN (float, int16_t, 119)
  RUN (float, int16_t, 128)
  RUN (float, int16_t, 256)
  RUN (float, int16_t, 279)
  RUN (float, int16_t, 555)
  RUN (float, int16_t, 1024)
  RUN (float, int16_t, 1389)
  RUN (float, int16_t, 2048)
  RUN (float, int16_t, 3989)
  RUN (float, int16_t, 4096)
  RUN (float, int16_t, 5975)

  RUN2 (float, uint16_t, 3)
  RUN2 (float, uint16_t, 4)
  RUN2 (float, uint16_t, 7)
  RUN2 (float, uint16_t, 99)
  RUN2 (float, uint16_t, 119)
  RUN2 (float, uint16_t, 128)
  RUN2 (float, uint16_t, 256)
  RUN2 (float, uint16_t, 279)
  RUN2 (float, uint16_t, 555)
  RUN2 (float, uint16_t, 1024)
  RUN2 (float, uint16_t, 1389)
  RUN2 (float, uint16_t, 2048)
  RUN2 (float, uint16_t, 3989)
  RUN2 (float, uint16_t, 4096)
  RUN2 (float, uint16_t, 5975)

  RUN (float, int8_t, 3)
  RUN (float, int8_t, 4)
  RUN (float, int8_t, 7)
  RUN (float, int8_t, 99)
  RUN (float, int8_t, 119)
  RUN (float, int8_t, 128)
  RUN (float, int8_t, 256)
  RUN (float, int8_t, 279)
  RUN (float, int8_t, 555)
  RUN (float, int8_t, 1024)
  RUN (float, int8_t, 1389)
  RUN (float, int8_t, 2048)
  RUN (float, int8_t, 3989)
  RUN (float, int8_t, 4096)
  RUN (float, int8_t, 5975)

  RUN2 (float, uint8_t, 3)
  RUN2 (float, uint8_t, 4)
  RUN2 (float, uint8_t, 7)
  RUN2 (float, uint8_t, 99)
  RUN2 (float, uint8_t, 119)
  RUN2 (float, uint8_t, 128)
  RUN2 (float, uint8_t, 256)
  RUN2 (float, uint8_t, 279)
  RUN2 (float, uint8_t, 555)
  RUN2 (float, uint8_t, 1024)
  RUN2 (float, uint8_t, 1389)
  RUN2 (float, uint8_t, 2048)
  RUN2 (float, uint8_t, 3989)
  RUN2 (float, uint8_t, 4096)
  RUN2 (float, uint8_t, 5975)

  RUN (double, int32_t, 3)
  RUN (double, int32_t, 4)
  RUN (double, int32_t, 7)
  RUN (double, int32_t, 99)
  RUN (double, int32_t, 119)
  RUN (double, int32_t, 128)
  RUN (double, int32_t, 256)
  RUN (double, int32_t, 279)
  RUN (double, int32_t, 555)
  RUN (double, int32_t, 1024)
  RUN (double, int32_t, 1389)
  RUN (double, int32_t, 2048)
  RUN (double, int32_t, 3989)
  RUN (double, int32_t, 4096)
  RUN (double, int32_t, 5975)

  RUN2 (double, uint32_t, 3)
  RUN2 (double, uint32_t, 4)
  RUN2 (double, uint32_t, 7)
  RUN2 (double, uint32_t, 99)
  RUN2 (double, uint32_t, 119)
  RUN2 (double, uint32_t, 128)
  RUN2 (double, uint32_t, 256)
  RUN2 (double, uint32_t, 279)
  RUN2 (double, uint32_t, 555)
  RUN2 (double, uint32_t, 1024)
  RUN2 (double, uint32_t, 1389)
  RUN2 (double, uint32_t, 2048)
  RUN2 (double, uint32_t, 3989)
  RUN2 (double, uint32_t, 4096)
  RUN2 (double, uint32_t, 5975)

  RUN (double, int16_t, 3)
  RUN (double, int16_t, 4)
  RUN (double, int16_t, 7)
  RUN (double, int16_t, 99)
  RUN (double, int16_t, 119)
  RUN (double, int16_t, 128)
  RUN (double, int16_t, 256)
  RUN (double, int16_t, 279)
  RUN (double, int16_t, 555)
  RUN (double, int16_t, 1024)
  RUN (double, int16_t, 1389)
  RUN (double, int16_t, 2048)
  RUN (double, int16_t, 3989)
  RUN (double, int16_t, 4096)
  RUN (double, int16_t, 5975)

  RUN2 (double, uint16_t, 3)
  RUN2 (double, uint16_t, 4)
  RUN2 (double, uint16_t, 7)
  RUN2 (double, uint16_t, 99)
  RUN2 (double, uint16_t, 119)
  RUN2 (double, uint16_t, 128)
  RUN2 (double, uint16_t, 256)
  RUN2 (double, uint16_t, 279)
  RUN2 (double, uint16_t, 555)
  RUN2 (double, uint16_t, 1024)
  RUN2 (double, uint16_t, 1389)
  RUN2 (double, uint16_t, 2048)
  RUN2 (double, uint16_t, 3989)
  RUN2 (double, uint16_t, 4096)
  RUN2 (double, uint16_t, 5975)

  RUN (double, int8_t, 3)
  RUN (double, int8_t, 4)
  RUN (double, int8_t, 7)
  RUN (double, int8_t, 99)
  RUN (double, int8_t, 119)
  RUN (double, int8_t, 128)
  RUN (double, int8_t, 256)
  RUN (double, int8_t, 279)
  RUN (double, int8_t, 555)
  RUN (double, int8_t, 1024)
  RUN (double, int8_t, 1389)
  RUN (double, int8_t, 2048)
  RUN (double, int8_t, 3989)
  RUN (double, int8_t, 4096)
  RUN (double, int8_t, 5975)

  RUN2 (double, uint8_t, 3)
  RUN2 (double, uint8_t, 4)
  RUN2 (double, uint8_t, 7)
  RUN2 (double, uint8_t, 99)
  RUN2 (double, uint8_t, 119)
  RUN2 (double, uint8_t, 128)
  RUN2 (double, uint8_t, 256)
  RUN2 (double, uint8_t, 279)
  RUN2 (double, uint8_t, 555)
  RUN2 (double, uint8_t, 1024)
  RUN2 (double, uint8_t, 1389)
  RUN2 (double, uint8_t, 2048)
  RUN2 (double, uint8_t, 3989)
  RUN2 (double, uint8_t, 4096)
  RUN2 (double, uint8_t, 5975)
}
