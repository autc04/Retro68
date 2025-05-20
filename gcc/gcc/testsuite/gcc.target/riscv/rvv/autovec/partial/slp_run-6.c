/* { dg-do run { target { riscv_v } } } */
/* { dg-additional-options "-mrvv-vector-bits=scalable" } */

#include "slp-6.c"

#define LIMIT 128

void __attribute__ ((optimize (0)))
f_golden (int8_t *restrict a, int8_t *restrict b, int n)
{
  for (int i = 0; i < n; ++i)
    {
      a[i * 8 + 0] = b[i * 8 + 1] + 1;
      a[i * 8 + 1] = b[i * 8 + 2] + 2;
      a[i * 8 + 2] = b[i * 8 + 6] + 8;
      a[i * 8 + 3] = b[i * 8 + 7] + 4;
      a[i * 8 + 4] = b[i * 8 + 3] + 5;
      a[i * 8 + 5] = b[i * 8 + 4] + 6;
      a[i * 8 + 6] = b[i * 8 + 5] + 7;
      a[i * 8 + 7] = b[i * 8 + 0] + 3;
    }
}

int
main (void)
{
#define RUN(NUM)                                                               \
  int8_t a_##NUM[NUM * 8 + 8] = {0};                                           \
  int8_t a_golden_##NUM[NUM * 8 + 8] = {0};                                    \
  int8_t b_##NUM[NUM * 8 + 9] = {0};                                           \
  for (int i = 0; i < NUM * 8 + 9; i++)                                        \
    {                                                                          \
      if (i % NUM == 0)                                                        \
	b_##NUM[i] = (i + NUM) % LIMIT;                                        \
      else                                                                     \
	b_##NUM[i] = (i - NUM) % (-LIMIT);                                     \
    }                                                                          \
  f (a_##NUM, b_##NUM, NUM);                                                   \
  f_golden (a_golden_##NUM, b_##NUM, NUM);                                     \
  for (int i = 0; i < NUM * 8 + 8; i++)                                        \
    {                                                                          \
      if (a_##NUM[i] != a_golden_##NUM[i])                                     \
	__builtin_abort ();                                                    \
    }

  RUN (3);
  RUN (5);
  RUN (15);
  RUN (16);
  RUN (17);
  RUN (31);
  RUN (32);
  RUN (33);
  RUN (63);
  RUN (64);
  RUN (65);
  RUN (127);
  RUN (128);
  RUN (129);
  RUN (239);
  RUN (359);
  RUN (498);
  RUN (799);
  RUN (977);
  RUN (5789);
  return 0;
}
