/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** uzp_z0_z0:
**	uzp	{z0\.s - z1\.s}, z0\.s, z1\.s
**	ret
*/
TEST_XN (uzp_z0_z0, svint32x2_t, z0,
	 svuzp_s32_x2 (z0),
	 svuzp (z0))

/*
** uzp_z0_z4:
**	uzp	{z0\.s - z1\.s}, z4\.s, z5\.s
**	ret
*/
TEST_XN (uzp_z0_z4, svint32x2_t, z0,
	 svuzp_s32_x2 (z4),
	 svuzp (z4))

/*
** uzp_z4_z18:
**	uzp	{z4\.s - z5\.s}, z18\.s, z19\.s
**	ret
*/
TEST_XN (uzp_z4_z18, svint32x2_t, z4,
	 svuzp_s32_x2 (z18),
	 svuzp (z18))

/*
** uzp_z18_z23:
**	uzp	{z18\.s - z19\.s}, z23\.s, z24\.s
**	ret
*/
TEST_XN (uzp_z18_z23, svint32x2_t, z18,
	 svuzp_s32_x2 (z23),
	 svuzp (z23))

/*
** uzp_z23_z28:
**	uzp	[^\n]+, z28\.s, z29\.s
**	mov	[^\n]+
**	mov	[^\n]+
**	ret
*/
TEST_XN (uzp_z23_z28, svint32x2_t, z23,
	 svuzp_s32_x2 (z28),
	 svuzp (z28))

/*
** uzp_z28_z0:
**	uzp	{z28\.s - z29\.s}, z0\.s, z1\.s
**	ret
*/
TEST_XN (uzp_z28_z0, svint32x2_t, z28,
	 svuzp_s32_x2 (z0),
	 svuzp (z0))

/*
** uzp_z28_z0_z23:	{ xfail aarch64_big_endian }
**	uzp	{z28\.s - z29\.s}, z0\.s, z23\.s
**	ret
*/
TEST_XN (uzp_z28_z0_z23, svint32x2_t, z28,
	 svuzp_s32_x2 (svcreate2 (svget2 (z0, 0), svget2 (z23, 0))),
	 svuzp (svcreate2 (svget2 (z0, 0), svget2 (z23, 0))))

/*
** uzp_z28_z5_z19:
**	uzp	{z28\.s - z29\.s}, z5\.s, z19\.s
**	ret
*/
TEST_XN (uzp_z28_z5_z19, svint32x2_t, z28,
	 svuzp_s32_x2 (svcreate2 (svget2 (z4, 1), svget2 (z18, 1))),
	 svuzp (svcreate2 (svget2 (z4, 1), svget2 (z18, 1))))
