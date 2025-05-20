/* Test AAPCS64 layout.

   Larger than machine-supported vector size.  The behavior is unspecified by
   the AAPCS64 document; the implementation opts for pass by reference.  */

/* { dg-do run { target aarch64*-*-* } } */

#ifndef IN_FRAMEWORK
#define TESTFILE "test_dfp_23.c"

typedef char A __attribute__ ((vector_size (64)));

struct y
{
  _Decimal64 df[8];
};

union u
{
  struct y x;
  A a;
} u;

#define HAS_DATA_INIT_FUNC
void init_data ()
{
  u.x.df[0] = 1.0dd;
  u.x.df[1] = 2.0dd;
  u.x.df[2] = 3.0dd;
  u.x.df[3] = 4.0dd;
  u.x.df[4] = 5.0dd;
  u.x.df[5] = 6.0dd;
  u.x.df[6] = 7.0dd;
  u.x.df[7] = 8.0dd;
}

#include "abitest.h"
#else
ARG (_Decimal32, 123.0df, S0)
PTR (A, u.a, X0)
LAST_ARG_NONFLAT (int, 0xdeadbeef, X1, i32in64)
#endif
