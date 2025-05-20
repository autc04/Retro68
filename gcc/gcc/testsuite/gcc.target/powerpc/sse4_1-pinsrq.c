/* { dg-do run } */
/* { dg-options "-O2 -mvsx -Wno-psabi" } */
/* { dg-additional-options "-mdejagnu-cpu=power8" { target { ! has_arch_pwr8 } } } */
/* { dg-require-effective-target p8vector_hw } */

#ifndef CHECK_H
#define CHECK_H "sse4_1-check.h"
#endif

#ifndef TEST
#define TEST sse4_1_test
#endif

#include CHECK_H

#include <smmintrin.h>
#include <string.h>

#define msk0 0x00
#define msk1 0x01

static void
__attribute__((noinline))
TEST (void)
{
  union
    {
      __m128i x;
      unsigned long long ll[2];
    } res [4], val, tmp;
  int masks[4];
  static unsigned long long ins[2] =
    { 0xAABBAABBAABBAABBLL, 0xCCDDCCDDCCDDCCDDLL };
  int i;

  val.ll[0] = 0x0807060504030201LL;
  val.ll[1] = 0x100F0E0D0C0B0A09LL;

  /* Check pinsrq imm8, r64, xmm.  */
  res[0].x = _mm_insert_epi64 (val.x, ins[0], msk0);
  res[1].x = _mm_insert_epi64 (val.x, ins[0], msk1);

  masks[0] = msk0;
  masks[1] = msk1;

  for (i = 0; i < 2; i++)
    {
      tmp.x = val.x;
      tmp.ll[masks[i]] = ins[0];
      if (memcmp (&tmp, &res[i], sizeof (tmp)))
	abort ();
    }
    
  /* Check pinsrq imm8, m64, xmm.  */
  for (i = 0; i < 2; i++)
    {
      res[i].x = _mm_insert_epi64 (val.x, ins[i], msk0);
      masks[i] = msk0;
    }

  for (i = 0; i < 2; i++)
    {
      tmp.x = val.x;
      tmp.ll[masks[i]] = ins[i];
      if (memcmp (&tmp, &res[i], sizeof (tmp)))
	abort ();
    }
}
