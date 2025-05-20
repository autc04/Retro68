/* { dg-do run { target { riscv_v } } } */
/* { dg-additional-options "-mrvv-vector-bits=scalable -fno-vect-cost-model" } */

#include "struct_vect-17.c"

#undef TEST_LOOP
#define TEST_LOOP(NAME, TYPE)				\
  {							\
    TYPE out[N];					\
    TYPE in[N * 4];					\
    for (int i = 0; i < N; ++i)				\
      {							\
	out[i] = i * 7 / 2;				\
	asm volatile ("" ::: "memory");			\
      }							\
    for (int i = 0; i < N * 4; ++i)			\
      {							\
	in[i] = i * 9 / 2;				\
	asm volatile ("" ::: "memory");			\
      }							\
    NAME (out, in);					\
    for (int i = 0; i < N; ++i)				\
      {							\
	TYPE expected = i * 7 / 2 + in[i * 4];		\
	if (out[i] != expected)				\
	  __builtin_abort ();				\
	asm volatile ("" ::: "memory");			\
      }							\
  }

int __attribute__ ((optimize (1)))
main (void)
{
  TEST (test);
  return 0;
}
