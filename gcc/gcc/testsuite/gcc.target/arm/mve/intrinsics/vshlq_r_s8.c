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
**	vshl.s8	q[0-9]+, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
*/
int8x16_t
foo (int8x16_t a, int32_t b)
{
  return vshlq_r_s8 (a, b);
}


/*
**foo1:
**	...
**	vshl.s8	q[0-9]+, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
*/
int8x16_t
foo1 (int8x16_t a, int32_t b)
{
  return vshlq_r (a, b);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
