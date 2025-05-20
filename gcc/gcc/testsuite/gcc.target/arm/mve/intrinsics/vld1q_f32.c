/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */
/* { dg-final { check-function-bodies "**" "" } } */

#include "arm_mve.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
**foo:
**	...
**	vldrw.32	q[0-9]+, \[(?:ip|fp|r[0-9]+)\](?:	@.*|)
**	...
*/
float32x4_t
foo (float32_t const *base)
{
  return vld1q_f32 (base);
}


/*
**foo1:
**	...
**	vldrw.32	q[0-9]+, \[(?:ip|fp|r[0-9]+)\](?:	@.*|)
**	...
*/
float32x4_t
foo1 (float32_t const *base)
{
  return vld1q (base);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */