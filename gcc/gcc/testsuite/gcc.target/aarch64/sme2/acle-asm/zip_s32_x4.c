/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** zip_z0_z0:
**	zip	{z0\.s - z3\.s}, {z0\.s - z3\.s}
**	ret
*/
TEST_XN (zip_z0_z0, svint32x4_t, z0,
	 svzip_s32_x4 (z0),
	 svzip (z0))

/*
** zip_z0_z4:
**	zip	{z0\.s - z3\.s}, {z4\.s - z7\.s}
**	ret
*/
TEST_XN (zip_z0_z4, svint32x4_t, z0,
	 svzip_s32_x4 (z4),
	 svzip (z4))

/*
** zip_z4_z18:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	zip	{z4\.s - z7\.s}, [^\n]+
**	ret
*/
TEST_XN (zip_z4_z18, svint32x4_t, z4,
	 svzip_s32_x4 (z18),
	 svzip (z18))

/*
** zip_z18_z23:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	zip	{z[^\n]+}, {z[^\n]+}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (zip_z18_z23, svint32x4_t, z18,
	 svzip_s32_x4 (z23),
	 svzip (z23))

/*
** zip_z23_z28:
**	zip	[^\n]+, {z28\.s - z31\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (zip_z23_z28, svint32x4_t, z23,
	 svzip_s32_x4 (z28),
	 svzip (z28))

/*
** zip_z28_z0:
**	zip	{z28\.s - z31\.s}, {z0\.s - z3\.s}
**	ret
*/
TEST_XN (zip_z28_z0, svint32x4_t, z28,
	 svzip_s32_x4 (z0),
	 svzip (z0))
