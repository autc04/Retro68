/* Test AAPCS64 layout and __builtin_va_arg.

   Pass by reference.  */

/* { dg-do run { target aarch64*-*-* } } */

#ifndef IN_FRAMEWORK
#define AAPCS64_TEST_STDARG
#define TESTFILE "va_arg_dfp-12.c"

struct z
{
  char c;
  short s;
  int ia[4];
};

struct z a, b, c;

#define HAS_DATA_INIT_FUNC
void init_data ()
{
  a.c = 0x11;
  a.s = 0x2222;
  a.ia[0] = 0x33333333;
  a.ia[1] = 0x44444444;
  a.ia[2] = 0x55555555;
  a.ia[3] = 0x66666666;

  b.c = 0x77;
  b.s = 0x8888;
  b.ia[0] = 0x99999999;
  b.ia[1] = 0xaaaaaaaa;
  b.ia[2] = 0xbbbbbbbb;
  b.ia[3] = 0xcccccccc;

  c.c = 0xdd;
  c.s = 0xeeee;
  c.ia[0] = 0xffffffff;
  c.ia[1] = 0x12121212;
  c.ia[2] = 0x23232323;
  c.ia[3] = 0x34343434;
}

#include "abitest.h"
#else
  PTR(struct z, a, X0, 0)
  ARG(int, 0xdeadbeef, W1, 1)
  ARG(int, 0xcafebabe, W2, 2)
  ARG(int, 0xdeadbabe, W3, 3)
  ARG(int, 0xcafebeef, W4, 4)
  ARG(int, 0xbeefdead, W5, 5)
  ARG(int, 0xbabecafe, W6, LAST_NAMED_ARG_ID)
  DOTS
  PTR_ANON(struct z, b, X7, 7)
  PTR_ANON(struct z, c, STACK, 8)
#ifndef __AAPCS64_BIG_ENDIAN__
  ANON(int, 0xbabedead, STACK+8, 9)
#else
  ANON(int, 0xbabedead, STACK+12, 9)
#endif
  LAST_ANON(_Decimal64, 123.45dd, D0, 10)

#endif
