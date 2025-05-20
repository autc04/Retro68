/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** min_z0_z0_z4:
**	fmin	{z0\.s - z3\.s}, {z0\.s - z3\.s}, {z4\.s - z7\.s}
**	ret
*/
TEST_XN (min_z0_z0_z4, svfloat32x4_t, z0,
	 svmin_f32_x4 (z0, z4),
	 svmin (z0, z4))

/*
** min_z0_z4_z0:
**	fmin	{z0\.s - z3\.s}, {z0\.s - z3\.s}, {z4\.s - z7\.s}
**	ret
*/
TEST_XN (min_z0_z4_z0, svfloat32x4_t, z0,
	 svmin_f32_x4 (z4, z0),
	 svmin (z4, z0))

/*
** min_z0_z4_z28:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	[^\n]+, {z28\.s - z31\.s}
** |
**	fmin	[^\n]+, {z28\.s - z31\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (min_z0_z4_z28, svfloat32x4_t, z0,
	 svmin_f32_x4 (z4, z28),
	 svmin (z4, z28))

/*
** min_z18_z18_z4:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	[^\n]+, {z4\.s - z7\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (min_z18_z18_z4, svfloat32x4_t, z18,
	 svmin_f32_x4 (z18, z4),
	 svmin (z18, z4))

/*
** min_z23_z23_z28:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	[^\n]+, {z28\.s - z31\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (min_z23_z23_z28, svfloat32x4_t, z23,
	 svmin_f32_x4 (z23, z28),
	 svmin (z23, z28))

/*
** min_z28_z28_z0:
**	fmin	{z28\.s - z31\.s}, {z28\.s - z31\.s}, {z0\.s - z3\.s}
**	ret
*/
TEST_XN (min_z28_z28_z0, svfloat32x4_t, z28,
	 svmin_f32_x4 (z28, z0),
	 svmin (z28, z0))

/*
** min_z0_z0_z18:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	{z0\.s - z3\.s}, {z0\.s - z3\.s}, [^\n]+
** |
**	fmin	{z0\.s - z3\.s}, {z0\.s - z3\.s}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (min_z0_z0_z18, svfloat32x4_t, z0,
	 svmin_f32_x4 (z0, z18),
	 svmin (z0, z18))

/*
** min_z4_z4_z23:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	{z4\.s - z7\.s}, {z4\.s - z7\.s}, [^\n]+
** |
**	fmin	{z4\.s - z7\.s}, {z4\.s - z7\.s}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (min_z4_z4_z23, svfloat32x4_t, z4,
	 svmin_f32_x4 (z4, z23),
	 svmin (z4, z23))

/*
** min_single_z24_z24_z0:
**	fmin	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z24_z0, svfloat32x4_t, svfloat32_t, z24,
		svmin_single_f32_x4 (z24, z0),
		svmin (z24, z0))

/*
** min_single_z24_z28_z0:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
** |
**	fmin	{z28\.s - z31\.s}, {z28\.s - z31\.s}, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z28_z0, svfloat32x4_t, svfloat32_t, z24,
		svmin_single_f32_x4 (z28, z0),
		svmin (z28, z0))

/*
** min_single_z24_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z1_z0, svfloat32x4_t, svfloat32_t, z24,
		svmin_single_f32_x4 (z1, z0),
		svmin (z1, z0))

/*
** min_single_z1_z24_z0:
**	fmin	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (min_single_z1_z24_z0, svfloat32x4_t, svfloat32_t, z1,
		svmin_single_f32_x4 (z24, z0),
		svmin (z24, z0))

/*
** min_single_z1_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	({z[0-9]+\.s - z[0-9]+\.s}), \1, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (min_single_z1_z1_z0, svfloat32x4_t, svfloat32_t, z1,
		svmin_single_f32_x4 (z1, z0),
		svmin (z1, z0))

/*
** min_single_z18_z18_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	[^\n]+, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (min_single_z18_z18_z0, svfloat32x4_t, svfloat32_t, z18,
		svmin_single_f32_x4 (z18, z0),
		svmin (z18, z0))

/*
** min_single_awkward:
**	...
**	fmin	({z[0-9]+\.s - z[0-9]+\.s}), \1, z[0-9]+\.s
**	...
**	ret
*/
TEST_XN_SINGLE_AWKWARD (min_single_awkward, svfloat32x4_t, svfloat32_t,
			z0_res = svmin_single_f32_x4 (z1, z0),
			z0_res = svmin (z1, z0))

/*
** min_single_z0_z0_z15:
**	...
**	fmin	{z0\.s - z3\.s}, {z0\.s - z3\.s}, z15\.s
**	...
**	ret
*/
TEST_XN_SINGLE_Z15 (min_single_z0_z0_z15, svfloat32x4_t, svfloat32_t,
		    z0 = svmin_single_f32_x4 (z0, z15),
		    z0 = svmin (z0, z15))

/*
** min_single_z24_z24_z16:
**	mov	(z[0-7])\.d, z16\.d
**	fmin	{z24\.s - z27\.s}, {z24\.s - z27\.s}, \1\.s
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z24_z16, svfloat32x4_t, svfloat32_t, z24,
		svmin_single_f32_x4 (z24, z16),
		svmin (z24, z16))
