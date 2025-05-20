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
**	vldrwt.u32	q[0-9]+, \[(?:ip|fp|r[0-9]+), q[0-9]+, uxtw #2\](?:	@.*|)
**	...
*/
int32x4_t
foo (int32_t const *base, uint32x4_t offset, mve_pred16_t p)
{
  return vldrwq_gather_shifted_offset_z_s32 (base, offset, p);
}


/*
**foo1:
**	...
**	vmsr	p0, (?:ip|fp|r[0-9]+)(?:	@.*|)
**	...
**	vpst(?:	@.*|)
**	...
**	vldrwt.u32	q[0-9]+, \[(?:ip|fp|r[0-9]+), q[0-9]+, uxtw #2\](?:	@.*|)
**	...
*/
int32x4_t
foo1 (int32_t const *base, uint32x4_t offset, mve_pred16_t p)
{
  return vldrwq_gather_shifted_offset_z (base, offset, p);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
