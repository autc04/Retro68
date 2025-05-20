/* { dg-do run { target { riscv_v } } } */
/* { dg-additional-options "-mrvv-vector-bits=zvl -fno-vect-cost-model" } */

#include "extract_last-11.c"

int __attribute__ ((optimize (1)))
main (void)
{
  float a[N] = {
    11.5, 12.2, 13.22, 14.1, 15.2, 16.3, 17, 18.7, 19, 20,
    1, 2, 3.3, 4.3333, 5.5, 6.23, 7, 8.63, 9, 10.6,
    21, 22.12, 23.55, 24.76, 25, 26, 27.34, 28.765, 29, 30,
    31.111, 32.322
  };

  float ret = condition_reduction (a, 16.7);

  if (ret != (float) 10.6)
    __builtin_abort ();

  return 0;
}
