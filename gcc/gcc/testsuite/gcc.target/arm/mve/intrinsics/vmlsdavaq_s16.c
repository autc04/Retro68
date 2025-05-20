/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */
/* { dg-final { check-function-bodies "**" "" } } */

#include "arm_mve.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
**foo:
**	...
**	vmlsdava.s16	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
int32_t
foo (int32_t a, int16x8_t b, int16x8_t c)
{
  return vmlsdavaq_s16 (a, b, c);
}


/*
**foo1:
**	...
**	vmlsdava.s16	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
int32_t
foo1 (int32_t a, int16x8_t b, int16x8_t c)
{
  return vmlsdavaq (a, b, c);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
