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
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vaddlvt.s32	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), q[0-9]+(?:	@.*|)
**	...
*/
int64_t
foo (int32x4_t a, mve_pred16_t p)
{
  return vaddlvq_p_s32 (a, p);
}


/*
**foo1:
**	...
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vaddlvt.s32	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), q[0-9]+(?:	@.*|)
**	...
*/
int64_t
foo1 (int32x4_t a, mve_pred16_t p)
{
  return vaddlvq_p (a, p);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */