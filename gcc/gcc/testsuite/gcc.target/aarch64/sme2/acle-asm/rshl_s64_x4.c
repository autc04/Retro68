/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** rshl_z0_z0_z4:
**	srshl	{z0\.d - z3\.d}, {z0\.d - z3\.d}, {z4\.d - z7\.d}
**	ret
*/
TEST_XN (rshl_z0_z0_z4, svint64x4_t, z0,
	 svrshl_s64_x4 (z0, z4),
	 svrshl (z0, z4))

/*
** rshl_z0_z4_z0:
**	srshl	{z0\.d - z3\.d}, {z0\.d - z3\.d}, {z4\.d - z7\.d}
**	ret
*/
TEST_XN (rshl_z0_z4_z0, svint64x4_t, z0,
	 svrshl_s64_x4 (z4, z0),
	 svrshl (z4, z0))

/*
** rshl_z0_z4_z28:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	[^\n]+, {z28\.d - z31\.d}
** |
**	srshl	[^\n]+, {z28\.d - z31\.d}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (rshl_z0_z4_z28, svint64x4_t, z0,
	 svrshl_s64_x4 (z4, z28),
	 svrshl (z4, z28))

/*
** rshl_z18_z18_z4:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	[^\n]+, {z4\.d - z7\.d}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (rshl_z18_z18_z4, svint64x4_t, z18,
	 svrshl_s64_x4 (z18, z4),
	 svrshl (z18, z4))

/*
** rshl_z23_z23_z28:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	[^\n]+, {z28\.d - z31\.d}
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (rshl_z23_z23_z28, svint64x4_t, z23,
	 svrshl_s64_x4 (z23, z28),
	 svrshl (z23, z28))

/*
** rshl_z28_z28_z0:
**	srshl	{z28\.d - z31\.d}, {z28\.d - z31\.d}, {z0\.d - z3\.d}
**	ret
*/
TEST_XN (rshl_z28_z28_z0, svint64x4_t, z28,
	 svrshl_s64_x4 (z28, z0),
	 svrshl (z28, z0))

/*
** rshl_z0_z0_z18:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	{z0\.d - z3\.d}, {z0\.d - z3\.d}, [^\n]+
** |
**	srshl	{z0\.d - z3\.d}, {z0\.d - z3\.d}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (rshl_z0_z0_z18, svint64x4_t, z0,
	 svrshl_s64_x4 (z0, z18),
	 svrshl (z0, z18))

/*
** rshl_z4_z4_z23:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	{z4\.d - z7\.d}, {z4\.d - z7\.d}, [^\n]+
** |
**	srshl	{z4\.d - z7\.d}, {z4\.d - z7\.d}, [^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN (rshl_z4_z4_z23, svint64x4_t, z4,
	 svrshl_s64_x4 (z4, z23),
	 svrshl (z4, z23))

/*
** rshl_single_z24_z24_z0:
**	srshl	{z24\.d - z27\.d}, {z24\.d - z27\.d}, z0\.d
**	ret
*/
TEST_XN_SINGLE (rshl_single_z24_z24_z0, svint64x4_t, svint64_t, z24,
		svrshl_single_s64_x4 (z24, z0),
		svrshl (z24, z0))

/*
** rshl_single_z24_z28_z0:
** (
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	{z24\.d - z27\.d}, {z24\.d - z27\.d}, z0\.d
** |
**	srshl	{z28\.d - z31\.d}, {z28\.d - z31\.d}, z0\.d
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
** )
**	ret
*/
TEST_XN_SINGLE (rshl_single_z24_z28_z0, svint64x4_t, svint64_t, z24,
		svrshl_single_s64_x4 (z28, z0),
		svrshl (z28, z0))

/*
** rshl_single_z24_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	{z24\.d - z27\.d}, {z24\.d - z27\.d}, z0\.d
**	ret
*/
TEST_XN_SINGLE (rshl_single_z24_z1_z0, svint64x4_t, svint64_t, z24,
		svrshl_single_s64_x4 (z1, z0),
		svrshl (z1, z0))

/*
** rshl_single_z1_z24_z0:
**	srshl	{z24\.d - z27\.d}, {z24\.d - z27\.d}, z0\.d
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (rshl_single_z1_z24_z0, svint64x4_t, svint64_t, z1,
		svrshl_single_s64_x4 (z24, z0),
		svrshl (z24, z0))

/*
** rshl_single_z1_z1_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	({z[0-9]+\.d - z[0-9]+\.d}), \1, z0\.d
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (rshl_single_z1_z1_z0, svint64x4_t, svint64_t, z1,
		svrshl_single_s64_x4 (z1, z0),
		svrshl (z1, z0))

/*
** rshl_single_z18_z18_z0:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	srshl	[^\n]+, z0\.d
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN_SINGLE (rshl_single_z18_z18_z0, svint64x4_t, svint64_t, z18,
		svrshl_single_s64_x4 (z18, z0),
		svrshl (z18, z0))

/*
** rshl_single_awkward:
**	...
**	srshl	({z[0-9]+\.d - z[0-9]+\.d}), \1, z[0-9]+\.d
**	...
**	ret
*/
TEST_XN_SINGLE_AWKWARD (rshl_single_awkward, svint64x4_t, svint64_t,
			z0_res = svrshl_single_s64_x4 (z1, z0),
			z0_res = svrshl (z1, z0))

/*
** rshl_single_z0_z0_z15:
**	...
**	srshl	{z0\.d - z3\.d}, {z0\.d - z3\.d}, z15\.d
**	...
**	ret
*/
TEST_XN_SINGLE_Z15 (rshl_single_z0_z0_z15, svint64x4_t, svint64_t,
		    z0 = svrshl_single_s64_x4 (z0, z15),
		    z0 = svrshl (z0, z15))

/*
** rshl_single_z24_z24_z16:
**	mov	(z[0-7])\.d, z16\.d
**	srshl	{z24\.d - z27\.d}, {z24\.d - z27\.d}, \1\.d
**	ret
*/
TEST_XN_SINGLE (rshl_single_z24_z24_z16, svint64x4_t, svint64_t, z24,
		svrshl_single_s64_x4 (z24, z16),
		svrshl (z24, z16))
