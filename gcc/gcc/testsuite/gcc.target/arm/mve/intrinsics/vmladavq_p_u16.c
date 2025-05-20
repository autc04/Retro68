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
**	vmladavt.u16	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
uint32_t
foo (uint16x8_t m1, uint16x8_t m2, mve_pred16_t p)
{
  return vmladavq_p_u16 (m1, m2, p);
}


/*
**foo1:
**	...
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vmladavt.u16	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
uint32_t
foo1 (uint16x8_t m1, uint16x8_t m2, mve_pred16_t p)
{
  return vmladavq_p (m1, m2, p);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
