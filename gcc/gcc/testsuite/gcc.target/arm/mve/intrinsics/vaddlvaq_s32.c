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
**	vaddlva.s32	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), q[0-9]+(?:	@.*|)
**	...
*/
int64_t
foo (int64_t a, int32x4_t b)
{
  return vaddlvaq_s32 (a, b);
}


/*
**foo1:
**	...
**	vaddlva.s32	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), q[0-9]+(?:	@.*|)
**	...
*/
int64_t
foo1 (int64_t a, int32x4_t b)
{
  return vaddlvaq (a, b);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */