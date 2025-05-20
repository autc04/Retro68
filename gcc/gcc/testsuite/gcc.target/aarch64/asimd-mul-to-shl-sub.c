/* { dg-do compile } */
/* { dg-require-effective-target vect_int } */
/* { dg-options "-Ofast" } */

/*
**foo:
**	shl	(v[0-9]+.4s), v0.4s, 16
**	sub	v0.4s, \1, v0.4s
**	ret
*/
#include <arm_neon.h>
uint32x4_t foo (uint32x4_t a)
{
  return a * 65535;
}

/* { dg-final { check-function-bodies "**" "" "" } } */
