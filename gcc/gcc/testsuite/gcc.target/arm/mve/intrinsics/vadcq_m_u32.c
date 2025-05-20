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
**	vmrs	(?:ip|fp|r[0-9]+), FPSCR_nzcvqc(?:	@.*|)
**	...
**	bfi	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), #29, #1(?:	@.*|)
**	...
**	vmsr	FPSCR_nzcvqc, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vadct.i32	q[0-9]+, q[0-9]+, q[0-9]+(?:	@.*|)
**	...
**	vmrs	(?:ip|fp|r[0-9]+), FPSCR_nzcvqc(?:	@.*|)
**	...
**	ubfx	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), #29, #1(?:	@.*|)
**	...
*/
uint32x4_t
foo (uint32x4_t inactive, uint32x4_t a, uint32x4_t b, unsigned *carry, mve_pred16_t p)
{
  return vadcq_m_u32 (inactive, a, b, carry, p);
}


/*
**foo1:
**	...
**	vmrs	(?:ip|fp|r[0-9]+), FPSCR_nzcvqc(?:	@.*|)
**	...
**	bfi	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), #29, #1(?:	@.*|)
**	...
**	vmsr	FPSCR_nzcvqc, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vadct.i32	q[0-9]+, q[0-9]+, q[0-9]+(?:	@.*|)
**	...
**	vmrs	(?:ip|fp|r[0-9]+), FPSCR_nzcvqc(?:	@.*|)
**	...
**	ubfx	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), #29, #1(?:	@.*|)
**	...
*/
uint32x4_t
foo1 (uint32x4_t inactive, uint32x4_t a, uint32x4_t b, unsigned *carry, mve_pred16_t p)
{
  return vadcq_m (inactive, a, b, carry, p);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
