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
**	vrmlsldavhax.s32	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
int64_t
foo (int64_t a, int32x4_t b, int32x4_t c)
{
  return vrmlsldavhaxq_s32 (a, b, c);
}


/*
**foo1:
**	...
**	vrmlsldavhax.s32	(?:ip|fp|r[0-9]+), (?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
int64_t
foo1 (int64_t a, int32x4_t b, int32x4_t c)
{
  return vrmlsldavhaxq (a, b, c);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
