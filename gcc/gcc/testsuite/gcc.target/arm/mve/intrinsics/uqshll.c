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
**	uqshll	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), #1(?:	@.*|)
**	...
*/
uint64_t
foo (uint64_t value)
{
  return uqshll (value, 1);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
