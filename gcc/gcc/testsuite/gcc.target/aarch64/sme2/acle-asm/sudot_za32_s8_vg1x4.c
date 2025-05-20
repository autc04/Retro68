/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** dot_0_z0_z4:
**	mov	(w8|w9|w10|w11), #?0
**	usdot	za\.s\[\1, 0, vgx4\], {z4\.b - z7\.b}, {z0\.b - z3\.b}
**	ret
*/
TEST_ZA_XN (dot_0_z0_z4, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (0, z0, svreinterpret_u8 (z4)),
	    svsudot_za32_vg1x4 (0, z0, svreinterpret_u8 (z4)))

/*
** dot_w0_z0_z4:
**	mov	(w8|w9|w10|w11), w0
**	usdot	za\.s\[\1, 0, vgx4\], {z4\.b - z7\.b}, {z0\.b - z3\.b}
**	ret
*/
TEST_ZA_XN (dot_w0_z0_z4, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w0, z0, svreinterpret_u8 (z4)),
	    svsudot_za32_vg1x4 (w0, z0, svreinterpret_u8 (z4)))

/*
** dot_w8_z4_z0:
**	usdot	za\.s\[w8, 0, vgx4\], {z0\.b - z3\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w8_z4_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z4, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8, z4, svreinterpret_u8 (z0)))

/* Leave the assembler to check for correctness for misaligned registers.  */

/*
** dot_w8_z0_z18:
**	...
**	usdot	za\.s\[w8, 0, vgx4\], [^\n]+, {z0\.b - z3\.b}
**	ret
*/
TEST_ZA_XN (dot_w8_z0_z18, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z0, svreinterpret_u8 (z18)),
	    svsudot_za32_vg1x4 (w8, z0, svreinterpret_u8 (z18)))

/*
** dot_w8_z18_z0:
**	...
**	usdot	za\.s\[w8, 0, vgx4\], {z0\.b - z3\.b}, [^\n]+
**	ret
*/
TEST_ZA_XN (dot_w8_z18_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z18, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8, z18, svreinterpret_u8 (z0)))

/*
** dot_w8_z0_z23:
**	...
**	usdot	za\.s\[w8, 0, vgx4\], [^\n]+, {z0\.b - z3\.b}
**	ret
*/
TEST_ZA_XN (dot_w8_z0_z23, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z0, svreinterpret_u8 (z23)),
	    svsudot_za32_vg1x4 (w8, z0, svreinterpret_u8 (z23)))

/*
** dot_w8_z23_z0:
**	...
**	usdot	za\.s\[w8, 0, vgx4\], {z0\.b - z3\.b}, [^\n]+
**	ret
*/
TEST_ZA_XN (dot_w8_z23_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z23, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8, z23, svreinterpret_u8 (z0)))

/*
** dot_w8_z4_z28:
**	usdot	za\.s\[w8, 0, vgx4\], {z28\.b - z31\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w8_z4_z28, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z4, svreinterpret_u8 (z28)),
	    svsudot_za32_vg1x4 (w8, z4, svreinterpret_u8 (z28)))

/*
** dot_w8_z28_z0:
**	usdot	za\.s\[w8, 0, vgx4\], {z0\.b - z3\.b}, {z28\.b - z31\.b}
**	ret
*/
TEST_ZA_XN (dot_w8_z28_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8, z28, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8, z28, svreinterpret_u8 (z0)))

/*
** dot_w8p1_z4_z0:
**	usdot	za\.s\[w8, 1, vgx4\], {z0\.b - z3\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w8p1_z4_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8 + 1, z4, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8 + 1, z4, svreinterpret_u8 (z0)))

/*
** dot_w8p2_z4_z0:
**	usdot	za\.s\[w8, 2, vgx4\], {z0\.b - z3\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w8p2_z4_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8 + 2, z4, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8 + 2, z4, svreinterpret_u8 (z0)))

/*
** dot_w11p4_z4_z0:
**	usdot	za\.s\[w11, 4, vgx4\], {z0\.b - z3\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w11p4_z4_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w11 + 4, z4, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w11 + 4, z4, svreinterpret_u8 (z0)))

/*
** dot_w8p7_z4_z0:
**	usdot	za\.s\[w8, 7, vgx4\], {z0\.b - z3\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w8p7_z4_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8 + 7, z4, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8 + 7, z4, svreinterpret_u8 (z0)))

/*
** dot_w8p8_z0_z4:
**	add	(w8|w9|w10|w11), w8, #?8
**	usdot	za\.s\[\1, 0, vgx4\], {z4\.b - z7\.b}, {z0\.b - z3\.b}
**	ret
*/
TEST_ZA_XN (dot_w8p8_z0_z4, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8 + 8, z0, svreinterpret_u8 (z4)),
	    svsudot_za32_vg1x4 (w8 + 8, z0, svreinterpret_u8 (z4)))

/*
** dot_w8m1_z4_z0:
**	sub	(w8|w9|w10|w11), w8, #?1
**	usdot	za\.s\[\1, 0, vgx4\], {z0\.b - z3\.b}, {z4\.b - z7\.b}
**	ret
*/
TEST_ZA_XN (dot_w8m1_z4_z0, svint8x4_t,
	    svsudot_za32_s8_vg1x4 (w8 - 1, z4, svreinterpret_u8 (z0)),
	    svsudot_za32_vg1x4 (w8 - 1, z4, svreinterpret_u8 (z0)))

/*
** dot_single_0_z1_z0:
**	mov	(w8|w9|w10|w11), #?0
**	sudot	za\.s\[\1, 0, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_0_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (0, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (0, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w0_z1_z0:
**	mov	(w8|w9|w10|w11), w0
**	sudot	za\.s\[\1, 0, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w0_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w0, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w0, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w8_z1_z0:
**	sudot	za\.s\[w8, 0, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w8, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w8p1_z1_z0:
**	sudot	za\.s\[w8, 1, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8p1_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8 + 1, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w8 + 1, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w8p4_z20_z0:
**	sudot	za\.s\[w8, 4, vgx4\], {z20\.b - z23\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8p4_z20_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8 + 4, z20, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w8 + 4, z20, svreinterpret_u8 (z0)))

/*
** dot_single_w8p6_z27_z0:
**	sudot	za\.s\[w8, 6, vgx4\], {z27\.b - z30\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8p6_z27_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8 + 6, z27, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w8 + 6, z27, svreinterpret_u8 (z0)))

/*
** dot_single_w8p7_z1_z0:
**	sudot	za\.s\[w8, 7, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8p7_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8 + 7, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w8 + 7, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w8p8_z1_z0:
**	add	(w8|w9|w10|w11), w8, #?8
**	sudot	za\.s\[\1, 0, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8p8_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8 + 8, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w8 + 8, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w0m1_z1_z0:
**	sub	(w8|w9|w10|w11), w0, #?1
**	sudot	za\.s\[\1, 0, vgx4\], {z1\.b - z4\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w0m1_z1_z0, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w0 - 1, z1, svreinterpret_u8 (z0)),
	        svsudot_za32_vg1x4 (w0 - 1, z1, svreinterpret_u8 (z0)))

/*
** dot_single_w8_z0_z15:
**	str	d15, \[sp, #?-16\]!
**	sudot	za\.s\[w8, 0, vgx4\], {z0\.b - z3\.b}, z15\.b
**	ldr	d15, \[sp\], #?16
**	ret
*/
TEST_ZA_SINGLE_Z15 (dot_single_w8_z0_z15, svint8x4_t, svint8_t,
		    svsudot_single_za32_s8_vg1x4 (w8, z0, svreinterpret_u8 (z15)),
		    svsudot_za32_vg1x4 (w8, z0, svreinterpret_u8 (z15)))

/*
** dot_single_w8_z20_z16:
**	mov	(z[0-7]).d, z16.d
**	sudot	za\.s\[w8, 0, vgx4\], {z20\.b - z23\.b}, \1\.b
**	ret
*/
TEST_ZA_SINGLE (dot_single_w8_z20_z16, svint8x4_t, svint8_t,
	        svsudot_single_za32_s8_vg1x4 (w8, z20, svreinterpret_u8 (z16)),
	        svsudot_za32_vg1x4 (w8, z20, svreinterpret_u8 (z16)))
