/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** max_z0_z0_z4:
**	umax	{z0\.s - z3\.s}, {z0\.s - z3\.s}, {z4\.s - z7\.s}
**	ret
*/
TEST_XN (max_z0_z0_z4, svuint32x4_t, z0,
	 svmax_u32_x4 (z0, z4),
	 svmax (z0, z4))

/*
** max_z0_z4_z0:
**	umax	{z0\.s - z3\.s}, {z0\.s - z3\.s}, {z4\.s - z7\.s}
**	ret
*/
TEST_XN (max_z0_z4_z0, svuint32x4_t, z0,
	 svmax_u32_x4 (z4, z0),
	 svmax (z4, z0))

/*
** max_z0_z4_z28:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	[^\n]+, {z28\.s - z31\.s}
** |
**	umax	[^\n]+, {z28\.s - z31\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (max_z0_z4_z28, svuint32x4_t, z0,
	 svmax_u32_x4 (z4, z28),
	 svmax (z4, z28))

/*
** max_z18_z18_z4:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	[^\n]+, {z4\.s - z7\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (max_z18_z18_z4, svuint32x4_t, z18,
	 svmax_u32_x4 (z18, z4),
	 svmax (z18, z4))

/*
** max_z23_z23_z28:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	[^\n]+, {z28\.s - z31\.s}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (max_z23_z23_z28, svuint32x4_t, z23,
	 svmax_u32_x4 (z23, z28),
	 svmax (z23, z28))

/*
** max_z28_z28_z0:
**	umax	{z28\.s - z31\.s}, {z28\.s - z31\.s}, {z0\.s - z3\.s}
**	ret
*/
TEST_XN (max_z28_z28_z0, svuint32x4_t, z28,
	 svmax_u32_x4 (z28, z0),
	 svmax (z28, z0))

/*
** max_z0_z0_z18:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	{z0\.s - z3\.s}, {z0\.s - z3\.s}, [^\n]+
** |
**	umax	{z0\.s - z3\.s}, {z0\.s - z3\.s}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (max_z0_z0_z18, svuint32x4_t, z0,
	 svmax_u32_x4 (z0, z18),
	 svmax (z0, z18))

/*
** max_z4_z4_z23:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	{z4\.s - z7\.s}, {z4\.s - z7\.s}, [^\n]+
** |
**	umax	{z4\.s - z7\.s}, {z4\.s - z7\.s}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (max_z4_z4_z23, svuint32x4_t, z4,
	 svmax_u32_x4 (z4, z23),
	 svmax (z4, z23))

/*
** max_single_z24_z24_z0:
**	umax	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
**	ret
*/
TEST_XN_SINGLE (max_single_z24_z24_z0, svuint32x4_t, svuint32_t, z24,
		svmax_single_u32_x4 (z24, z0),
		svmax (z24, z0))

/*
** max_single_z24_z28_z0:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
** |
**	umax	{z28\.s - z31\.s}, {z28\.s - z31\.s}, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN_SINGLE (max_single_z24_z28_z0, svuint32x4_t, svuint32_t, z24,
		svmax_single_u32_x4 (z28, z0),
		svmax (z28, z0))

/*
** max_single_z24_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
**	ret
*/
TEST_XN_SINGLE (max_single_z24_z1_z0, svuint32x4_t, svuint32_t, z24,
		svmax_single_u32_x4 (z1, z0),
		svmax (z1, z0))

/*
** max_single_z1_z24_z0:
**	umax	{z24\.s - z27\.s}, {z24\.s - z27\.s}, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (max_single_z1_z24_z0, svuint32x4_t, svuint32_t, z1,
		svmax_single_u32_x4 (z24, z0),
		svmax (z24, z0))

/*
** max_single_z1_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	({z[0-9]+\.s - z[0-9]+\.s}), \1, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (max_single_z1_z1_z0, svuint32x4_t, svuint32_t, z1,
		svmax_single_u32_x4 (z1, z0),
		svmax (z1, z0))

/*
** max_single_z18_z18_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	umax	[^\n]+, z0\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (max_single_z18_z18_z0, svuint32x4_t, svuint32_t, z18,
		svmax_single_u32_x4 (z18, z0),
		svmax (z18, z0))

/*
** max_single_awkward:
**	...
**	umax	({z[0-9]+\.s - z[0-9]+\.s}), \1, z[0-9]+\.s
**	...
**	ret
*/
TEST_XN_SINGLE_AWKWARD (max_single_awkward, svuint32x4_t, svuint32_t,
			z0_res = svmax_single_u32_x4 (z1, z0),
			z0_res = svmax (z1, z0))

/*
** max_single_z0_z0_z15:
**	...
**	umax	{z0\.s - z3\.s}, {z0\.s - z3\.s}, z15\.s
**	...
**	ret
*/
TEST_XN_SINGLE_Z15 (max_single_z0_z0_z15, svuint32x4_t, svuint32_t,
		    z0 = svmax_single_u32_x4 (z0, z15),
		    z0 = svmax (z0, z15))

/*
** max_single_z24_z24_z16:
**	mov	(z[0-7])\.d, z16\.d
**	umax	{z24\.s - z27\.s}, {z24\.s - z27\.s}, \1\.s
**	ret
*/
TEST_XN_SINGLE (max_single_z24_z24_z16, svuint32x4_t, svuint32_t, z24,
		svmax_single_u32_x4 (z24, z16),
		svmax (z24, z16))
