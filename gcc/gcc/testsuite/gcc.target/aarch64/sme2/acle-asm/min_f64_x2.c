/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** min_z0_z0_z4:
**	fmin	{z0\.d - z1\.d}, {z0\.d - z1\.d}, {z4\.d - z5\.d}
**	ret
*/
TEST_XN (min_z0_z0_z4, svfloat64x2_t, z0,
	 svmin_f64_x2 (z0, z4),
	 svmin (z0, z4))

/*
** min_z0_z4_z0:
**	fmin	{z0\.d - z1\.d}, {z0\.d - z1\.d}, {z4\.d - z5\.d}
**	ret
*/
TEST_XN (min_z0_z4_z0, svfloat64x2_t, z0,
	 svmin_f64_x2 (z4, z0),
	 svmin (z4, z0))

/*
** min_z0_z4_z28:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	[^\n]+, {z28\.d - z29\.d}
** |
**	fmin	[^\n]+, {z28\.d - z29\.d}
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (min_z0_z4_z28, svfloat64x2_t, z0,
	 svmin_f64_x2 (z4, z28),
	 svmin (z4, z28))

/*
** min_z18_z18_z4:
**	fmin	{z18\.d - z19\.d}, {z18\.d - z19\.d}, {z4\.d - z5\.d}
**	ret
*/
TEST_XN (min_z18_z18_z4, svfloat64x2_t, z18,
	 svmin_f64_x2 (z18, z4),
	 svmin (z18, z4))

/*
** min_z23_z23_z18:
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	[^\n]+, {z18\.d - z19\.d}
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (min_z23_z23_z18, svfloat64x2_t, z23,
	 svmin_f64_x2 (z23, z18),
	 svmin (z23, z18))

/*
** min_z28_z28_z0:
**	fmin	{z28\.d - z29\.d}, {z28\.d - z29\.d}, {z0\.d - z1\.d}
**	ret
*/
TEST_XN (min_z28_z28_z0, svfloat64x2_t, z28,
	 svmin_f64_x2 (z28, z0),
	 svmin (z28, z0))

/*
** min_z0_z0_z18:
**	fmin	{z0\.d - z1\.d}, {z0\.d - z1\.d}, {z18\.d - z19\.d}
**	ret
*/
TEST_XN (min_z0_z0_z18, svfloat64x2_t, z0,
	 svmin_f64_x2 (z0, z18),
	 svmin (z0, z18))

/*
** min_z4_z4_z23:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	{z4\.d - z5\.d}, {z4\.d - z5\.d}, [^\n]+
** |
**	fmin	{z4\.d - z5\.d}, {z4\.d - z5\.d}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (min_z4_z4_z23, svfloat64x2_t, z4,
	 svmin_f64_x2 (z4, z23),
	 svmin (z4, z23))

/*
** min_single_z24_z24_z0:
**	fmin	{z24\.d - z25\.d}, {z24\.d - z25\.d}, z0\.d
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z24_z0, svfloat64x2_t, svfloat64_t, z24,
		svmin_single_f64_x2 (z24, z0),
		svmin (z24, z0))

/*
** min_single_z24_z28_z0:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	{z24\.d - z25\.d}, {z24\.d - z25\.d}, z0\.d
** |
**	fmin	{z28\.d - z29\.d}, {z28\.d - z29\.d}, z0\.d
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z28_z0, svfloat64x2_t, svfloat64_t, z24,
		svmin_single_f64_x2 (z28, z0),
		svmin (z28, z0))

/*
** min_single_z24_z1_z0:
** (
**	mov	z24\.d, z1\.d
**	mov	z25\.d, z2\.d
** |
**	mov	z25\.d, z2\.d
**	mov	z24\.d, z1\.d
** )
**	fmin	{z24\.d - z25\.d}, {z24\.d - z25\.d}, z0\.d
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z1_z0, svfloat64x2_t, svfloat64_t, z24,
		svmin_single_f64_x2 (z1, z0),
		svmin (z1, z0))

/*
** min_single_z1_z24_z0:
**	fmin	{z24\.d - z25\.d}, {z24\.d - z25\.d}, z0\.d
** (
**	mov	z1\.d, z24\.d
**	mov	z2\.d, z25\.d
** |
**	mov	z2\.d, z25\.d
**	mov	z1\.d, z24\.d
** )
**	ret
*/
TEST_XN_SINGLE (min_single_z1_z24_z0, svfloat64x2_t, svfloat64_t, z1,
		svmin_single_f64_x2 (z24, z0),
		svmin (z24, z0))

/*
** min_single_z1_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	fmin	({z[0-9]+\.d - z[0-9]+\.d}), \1, z0\.d
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (min_single_z1_z1_z0, svfloat64x2_t, svfloat64_t, z1,
		svmin_single_f64_x2 (z1, z0),
		svmin (z1, z0))

/*
** min_single_z18_z18_z0:
**	fmin	{z18\.d - z19\.d}, {z18\.d - z19\.d}, z0\.d
**	ret
*/
TEST_XN_SINGLE (min_single_z18_z18_z0, svfloat64x2_t, svfloat64_t, z18,
		svmin_single_f64_x2 (z18, z0),
		svmin (z18, z0))

/*
** min_single_awkward:
**	...
**	fmin	({z[0-9]+\.d - z[0-9]+\.d}), \1, z[0-9]+\.d
**	...
**	ret
*/
TEST_XN_SINGLE_AWKWARD (min_single_awkward, svfloat64x2_t, svfloat64_t,
			z0_res = svmin_single_f64_x2 (z1, z0),
			z0_res = svmin (z1, z0))

/*
** min_single_z0_z0_z15:
**	...
**	fmin	{z0\.d - z1\.d}, {z0\.d - z1\.d}, z15\.d
**	...
**	ret
*/
TEST_XN_SINGLE_Z15 (min_single_z0_z0_z15, svfloat64x2_t, svfloat64_t,
		    z0 = svmin_single_f64_x2 (z0, z15),
		    z0 = svmin (z0, z15))

/*
** min_single_z24_z24_z16:
**	mov	(z[0-7])\.d, z16\.d
**	fmin	{z24\.d - z25\.d}, {z24\.d - z25\.d}, \1\.d
**	ret
*/
TEST_XN_SINGLE (min_single_z24_z24_z16, svfloat64x2_t, svfloat64_t, z24,
		svmin_single_f64_x2 (z24, z16),
		svmin (z24, z16))
