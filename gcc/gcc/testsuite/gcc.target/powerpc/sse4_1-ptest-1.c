/* { dg-do run } */
/* { dg-require-effective-target p8vector_hw } */
/* { dg-options "-O2 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */

#ifndef CHECK_H
#define CHECK_H "sse4_1-check.h"
#endif

#ifndef TEST
#define TEST sse4_1_test
#endif

#include CHECK_H

#include <smmintrin.h>

static int
make_ptestz (__m128i m, __m128i v)
{
  union
    {
      __m128i x;
      unsigned char c[16];
    } val, mask;
  int i, z;

  mask.x = m;
  val.x = v;

  z = 1;
  for (i = 0; i < 16; i++)
    if ((mask.c[i] & val.c[i]))
      {
	z = 0;
	break;
      }
  return z;
}

static int
make_ptestc (__m128i m, __m128i v)
{
  union
    {
      __m128i x;
      unsigned char c[16];
    } val, mask;
  int i, c;

  mask.x = m;
  val.x = v;

  c = 1;
  for (i = 0; i < 16; i++)
    if ((val.c[i] & ~mask.c[i]))
      {
	c = 0;
	break;
      }
  return c;
}

static void
TEST (void)
{
  union
    {
      __m128i x;
      unsigned int i[4];
    } val[4];
  int i, j, l;
  int res[32];

  val[0].i[0] = 0x11111111;
  val[0].i[1] = 0x00000000;
  val[0].i[2] = 0x00000000;
  val[0].i[3] = 0x11111111;
    
  val[1].i[0] = 0x00000000;
  val[1].i[1] = 0x11111111;
  val[1].i[2] = 0x11111111;
  val[1].i[3] = 0x00000000;

  val[2].i[0] = 0;
  val[2].i[1] = 0;
  val[2].i[2] = 0;
  val[2].i[3] = 0;

  val[3].i[0] = 0xffffffff;
  val[3].i[1] = 0xffffffff;
  val[3].i[2] = 0xffffffff;
  val[3].i[3] = 0xffffffff;

  l = 0;
  for(i = 0; i < 4; i++)
    for(j = 0; j < 4; j++)
      {
	res[l++] = _mm_testz_si128 (val[j].x, val[i].x);
	res[l++] = _mm_testc_si128 (val[j].x, val[i].x);
      }

  l = 0;
  for(i = 0; i < 4; i++)
    for(j = 0; j < 4; j++)
      {
	if (res[l++] != make_ptestz (val[j].x, val[i].x))
	  abort ();
	if (res[l++] != make_ptestc (val[j].x, val[i].x))
	  abort ();
      }

  if (res[2] != _mm_testz_si128 (val[1].x, val[0].x))
    abort ();

  if (res[3] != _mm_testc_si128 (val[1].x, val[0].x))
    abort ();
}
