/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** mls_lane_0_z0_z4_0:
**	mov	(w8|w9|w10|w11), #?0
**	umlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, z4\.b\[0\]
**	ret
*/
TEST_ZA_LANE (mls_lane_0_z0_z4_0, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (0, z0, z4, 0),
	      svmls_lane_za32_vg4x2 (0, z0, z4, 0))

/*
** mls_lane_w0_z0_z7_1:
**	mov	(w8|w9|w10|w11), w0
**	umlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, z7\.b\[1\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w0_z0_z7_1, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w0, z0, z7, 1),
	      svmls_lane_za32_vg4x2 (w0, z0, z7, 1))

/*
** mls_lane_w8_z28_z4_2:
**	umlsll	za\.s\[w8, 0:3, vgx2\], {z28\.b - z29\.b}, z4\.b\[2\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8_z28_z4_2, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8, z28, z4, 2),
	      svmls_lane_za32_vg4x2 (w8, z28, z4, 2))

/*
** mls_lane_w11p4_z0_z4_3:
**	umlsll	za\.s\[w11, 4:7, vgx2\], {z0\.b - z1\.b}, z4\.b\[3\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w11p4_z0_z4_3, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w11 + 4, z0, z4, 3),
	      svmls_lane_za32_vg4x2 (w11 + 4, z0, z4, 3))

/*
** mls_lane_w8p6_z0_z4_4:
**	add	(w8|w9|w10|w11), w8, #?6
**	umlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, z4\.b\[4\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8p6_z0_z4_4, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8 + 6, z0, z4, 4),
	      svmls_lane_za32_vg4x2 (w8 + 6, z0, z4, 4))

/*
** mls_lane_w8p7_z0_z4_5:
**	add	(w8|w9|w10|w11), w8, #?7
**	umlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, z4\.b\[5\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8p7_z0_z4_5, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8 + 7, z0, z4, 5),
	      svmls_lane_za32_vg4x2 (w8 + 7, z0, z4, 5))

/*
** mls_lane_w8p8_z0_z4_7:
**	add	(w8|w9|w10|w11), w8, #?8
**	umlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, z4\.b\[7\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8p8_z0_z4_7, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8 + 8, z0, z4, 7),
	      svmls_lane_za32_vg4x2 (w8 + 8, z0, z4, 7))

/*
** mls_lane_w0m1_z0_z4_9:
**	sub	(w8|w9|w10|w11), w0, #?1
**	umlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, z4\.b\[9\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w0m1_z0_z4_9, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w0 - 1, z0, z4, 9),
	      svmls_lane_za32_vg4x2 (w0 - 1, z0, z4, 9))

/*
** mls_lane_w8_z4_z15_10:
**	str	d15, \[sp, #?-16\]!
**	umlsll	za\.s\[w8, 0:3, vgx2\], {z4\.b - z5\.b}, z15\.b\[10\]
**	ldr	d15, \[sp\], #?16
**	ret
*/
TEST_ZA_LANE_Z15 (mls_lane_w8_z4_z15_10, svuint8x2_t, svuint8_t,
		  svmls_lane_za32_u8_vg4x2 (w8, z4, z15, 10),
		  svmls_lane_za32_vg4x2 (w8, z4, z15, 10))

/*
** mls_lane_w8_z28_z16_11:
**	mov	(z[0-7]).d, z16.d
**	umlsll	za\.s\[w8, 0:3, vgx2\], {z28\.b - z29\.b}, \1\.b\[11\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8_z28_z16_11, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8, z28, z16, 11),
	      svmls_lane_za32_vg4x2 (w8, z28, z16, 11))

/*
** mls_lane_w8_z17_z7_13:
**	mov	[^\n]+
**	mov	[^\n]+
**	umlsll	za\.s\[w8, 0:3, vgx2\], [^\n]+, z7\.b\[13\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8_z17_z7_13, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8, z17, z7, 13),
	      svmls_lane_za32_vg4x2 (w8, z17, z7, 13))

/*
** mls_lane_w8_z22_z4_15:
**	umlsll	za\.s\[w8, 0:3, vgx2\], {z22\.b - z23\.b}, z4\.b\[15\]
**	ret
*/
TEST_ZA_LANE (mls_lane_w8_z22_z4_15, svuint8x2_t, svuint8_t,
	      svmls_lane_za32_u8_vg4x2 (w8, z22, z4, 15),
	      svmls_lane_za32_vg4x2 (w8, z22, z4, 15))
