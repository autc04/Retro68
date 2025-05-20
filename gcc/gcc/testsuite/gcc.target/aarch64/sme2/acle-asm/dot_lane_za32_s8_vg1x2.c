/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** dot_lane_0_z0_z4_0:
**	mov	(w8|w9|w10|w11), #?0
**	sdot	za\.s\[\1, 0, vgx2\], {z0\.b - z1\.b}, z4\.b\[0\]
**	ret
*/
TEST_ZA_LANE (dot_lane_0_z0_z4_0, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (0, z0, z4, 0),
	      svdot_lane_za32_vg1x2 (0, z0, z4, 0))

/*
** dot_lane_w0_z0_z7_1:
**	mov	(w8|w9|w10|w11), w0
**	sdot	za\.s\[\1, 0, vgx2\], {z0\.b - z1\.b}, z7\.b\[1\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w0_z0_z7_1, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w0, z0, z7, 1),
	      svdot_lane_za32_vg1x2 (w0, z0, z7, 1))

/*
** dot_lane_w8_z28_z4_2:
**	sdot	za\.s\[w8, 0, vgx2\], {z28\.b - z29\.b}, z4\.b\[2\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w8_z28_z4_2, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w8, z28, z4, 2),
	      svdot_lane_za32_vg1x2 (w8, z28, z4, 2))

/*
** dot_lane_w8p7_z0_z4_3:
**	sdot	za\.s\[w8, 7, vgx2\], {z0\.b - z1\.b}, z4\.b\[3\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w8p7_z0_z4_3, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w8 + 7, z0, z4, 3),
	      svdot_lane_za32_vg1x2 (w8 + 7, z0, z4, 3))

/*
** dot_lane_w8p8_z0_z4_0:
**	add	(w8|w9|w10|w11), w8, #?8
**	sdot	za\.s\[\1, 0, vgx2\], {z0\.b - z1\.b}, z4\.b\[0\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w8p8_z0_z4_0, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w8 + 8, z0, z4, 0),
	      svdot_lane_za32_vg1x2 (w8 + 8, z0, z4, 0))

/*
** dot_lane_w0m1_z0_z4_1:
**	sub	(w8|w9|w10|w11), w0, #?1
**	sdot	za\.s\[\1, 0, vgx2\], {z0\.b - z1\.b}, z4\.b\[1\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w0m1_z0_z4_1, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w0 - 1, z0, z4, 1),
	      svdot_lane_za32_vg1x2 (w0 - 1, z0, z4, 1))

/*
** dot_lane_w8_z4_z15_2:
**	str	d15, \[sp, #?-16\]!
**	sdot	za\.s\[w8, 0, vgx2\], {z4\.b - z5\.b}, z15\.b\[2\]
**	ldr	d15, \[sp\], #?16
**	ret
*/
TEST_ZA_LANE_Z15 (dot_lane_w8_z4_z15_2, svint8x2_t, svint8_t,
		  svdot_lane_za32_s8_vg1x2 (w8, z4, z15, 2),
		  svdot_lane_za32_vg1x2 (w8, z4, z15, 2))

/*
** dot_lane_w8_z28_z16_3:
**	mov	(z[0-7]).d, z16.d
**	sdot	za\.s\[w8, 0, vgx2\], {z28\.b - z29\.b}, \1\.b\[3\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w8_z28_z16_3, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w8, z28, z16, 3),
	      svdot_lane_za32_vg1x2 (w8, z28, z16, 3))

/*
** dot_lane_w8_z17_z7_0:
**	mov	[^\n]+
**	mov	[^\n]+
**	sdot	za\.s\[w8, 0, vgx2\], [^\n]+, z7\.b\[0\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w8_z17_z7_0, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w8, z17, z7, 0),
	      svdot_lane_za32_vg1x2 (w8, z17, z7, 0))

/*
** dot_lane_w8_z22_z4_1:
**	sdot	za\.s\[w8, 0, vgx2\], {z22\.b - z23\.b}, z4\.b\[1\]
**	ret
*/
TEST_ZA_LANE (dot_lane_w8_z22_z4_1, svint8x2_t, svint8_t,
	      svdot_lane_za32_s8_vg1x2 (w8, z22, z4, 1),
	      svdot_lane_za32_vg1x2 (w8, z22, z4, 1))
