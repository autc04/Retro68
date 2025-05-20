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
**	vldrh.s32	q[0-9]+, \[(?:ip|fp|r[0-9]+), q[0-9]+\](?:	@.*|)
**	...
*/
int32x4_t
foo (int16_t const *base, uint32x4_t offset)
{
  return vldrhq_gather_offset_s32 (base, offset);
}


/*
**foo1:
**	...
**	vldrh.s32	q[0-9]+, \[(?:ip|fp|r[0-9]+), q[0-9]+\](?:	@.*|)
**	...
*/
int32x4_t
foo1 (int16_t const *base, uint32x4_t offset)
{
  return vldrhq_gather_offset (base, offset);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */