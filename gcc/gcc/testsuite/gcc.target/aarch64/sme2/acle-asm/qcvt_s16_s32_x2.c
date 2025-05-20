/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** qcvt_z0_z0:
**	sqcvt	z0\.h, {z0\.s - z1\.s}
**	ret
*/
TEST_X2_NARROW (qcvt_z0_z0, svint32x2_t, svint16_t,
		z0_res = svqcvt_s16_s32_x2 (z0),
		z0_res = svqcvt_s16 (z0))

/*
** qcvt_z0_z6:
**	sqcvt	z0\.h, {z6\.s - z7\.s}
**	ret
*/
TEST_X2_NARROW (qcvt_z0_z6, svint32x2_t, svint16_t,
		z0_res = svqcvt_s16_s32_x2 (z6),
		z0_res = svqcvt_s16 (z6))

/*
** qcvt_z0_z29:
**	mov	[^\n]+
**	mov	[^\n]+
**	sqcvt	z0\.h, [^\n]+
**	ret
*/
TEST_X2_NARROW (qcvt_z0_z29, svint32x2_t, svint16_t,
		z0_res = svqcvt_s16_s32_x2 (z29),
		z0_res = svqcvt_s16 (z29))

/*
** qcvt_z5_z0:
**	sqcvt	z5\.h, {z0\.s - z1\.s}
**	ret
*/
TEST_X2_NARROW (qcvt_z5_z0, svint32x2_t, svint16_t,
		z5 = svqcvt_s16_s32_x2 (z0),
		z5 = svqcvt_s16 (z0))

/*
** qcvt_z22_z16:
**	sqcvt	z22\.h, {z16\.s - z17\.s}
**	ret
*/
TEST_X2_NARROW (qcvt_z22_z16, svint32x2_t, svint16_t,
		z22 = svqcvt_s16_s32_x2 (z16),
		z22 = svqcvt_s16 (z16))
