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
**	vshlltt.s8	q[0-9]+, q[0-9]+, #[0-9]+(?:	@.*|)
**	...
*/
int16x8_t
foo (int8x16_t a, mve_pred16_t p)
{
  return vshlltq_x_n_s8 (a, 1, p);
}


/*
**foo1:
**	...
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vshlltt.s8	q[0-9]+, q[0-9]+, #[0-9]+(?:	@.*|)
**	...
*/
int16x8_t
foo1 (int8x16_t a, mve_pred16_t p)
{
  return vshlltq_x (a, 1, p);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
