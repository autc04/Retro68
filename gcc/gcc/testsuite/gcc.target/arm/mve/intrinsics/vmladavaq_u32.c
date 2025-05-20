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
**	vmladava.u32	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
uint32_t
foo (uint32_t add, uint32x4_t m1, uint32x4_t m2)
{
  return vmladavaq_u32 (add, m1, m2);
}


/*
**foo1:
**	...
**	vmladava.u32	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
uint32_t
foo1 (uint32_t add, uint32x4_t m1, uint32x4_t m2)
{
  return vmladavaq (add, m1, m2);
}

/*
**foo2:
**	...
**	vmladava.u32	(?:ip|fp|r[0-9]+), q[0-9]+, q[0-9]+(?:	@.*|)
**	...
*/
uint32_t
foo2 (uint32x4_t m1, uint32x4_t m2)
{
  return vmladavaq (1, m1, m2);
}

#ifdef __cplusplus
}
#endif

/* { dg-final { scan-assembler-not "__ARM_undef" } } */