/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** mls_0_z0_z0:
**	mov	(w8|w9|w10|w11), #?0
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_0_z0_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (0, z0, z0),
	    svmls_za32_vg4x2 (0, z0, z0))

/*
** mls_w0_z0_z0:
**	mov	(w8|w9|w10|w11), w0
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z0\.b - z1\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w0_z0_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w0, z0, z0),
	    svmls_za32_vg4x2 (w0, z0, z0))

/*
** mls_w8_z0_z4:
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z0\.b - z1\.b}, {z4\.b - z5\.b}
**	ret
*/
TEST_ZA_XN (mls_w8_z0_z4, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8, z0, z4),
	    svmls_za32_vg4x2 (w8, z0, z4))

/*
** mls_w8_z4_z18:
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z4\.b - z5\.b}, {z18\.b - z19\.b}
**	ret
*/
TEST_ZA_XN (mls_w8_z4_z18, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8, z4, z18),
	    svmls_za32_vg4x2 (w8, z4, z18))

/* Leave the assembler to check for correctness for misaligned registers.  */

/*
** mls_w8_z0_z23:
**	...
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z0\.b - z1\.b}, [^\n]+
**	ret
*/
TEST_ZA_XN (mls_w8_z0_z23, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8, z0, z23),
	    svmls_za32_vg4x2 (w8, z0, z23))

/*
** mls_w8_z23_z0:
**	...
**	smlsll	za\.s\[w8, 0:3, vgx2\], [^\n]+, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w8_z23_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8, z23, z0),
	    svmls_za32_vg4x2 (w8, z23, z0))

/*
** mls_w8_z18_z28:
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z18\.b - z19\.b}, {z28\.b - z29\.b}
**	ret
*/
TEST_ZA_XN (mls_w8_z18_z28, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8, z18, z28),
	    svmls_za32_vg4x2 (w8, z18, z28))

/*
** mls_w8_z28_z4:
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z28\.b - z29\.b}, {z4\.b - z5\.b}
**	ret
*/
TEST_ZA_XN (mls_w8_z28_z4, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8, z28, z4),
	    svmls_za32_vg4x2 (w8, z28, z4))

/*
** mls_w8p1_z4_z0:
**	add	(w8|w9|w10|w11), w8, #?1
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z4\.b - z5\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w8p1_z4_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8 + 1, z4, z0),
	    svmls_za32_vg4x2 (w8 + 1, z4, z0))

/*
** mls_w8p2_z4_z0:
**	add	(w8|w9|w10|w11), w8, #?2
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z4\.b - z5\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w8p2_z4_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8 + 2, z4, z0),
	    svmls_za32_vg4x2 (w8 + 2, z4, z0))

/*
** mls_w11p4_z4_z0:
**	smlsll	za\.s\[w11, 4:7, vgx2\], {z4\.b - z5\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w11p4_z4_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w11 + 4, z4, z0),
	    svmls_za32_vg4x2 (w11 + 4, z4, z0))

/*
** mls_w8p7_z4_z0:
**	add	(w8|w9|w10|w11), w8, #?7
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z4\.b - z5\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w8p7_z4_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8 + 7, z4, z0),
	    svmls_za32_vg4x2 (w8 + 7, z4, z0))

/*
** mls_w8p8_z4_z4:
**	add	(w8|w9|w10|w11), w8, #?8
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z4\.b - z5\.b}, {z4\.b - z5\.b}
**	ret
*/
TEST_ZA_XN (mls_w8p8_z4_z4, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8 + 8, z4, z4),
	    svmls_za32_vg4x2 (w8 + 8, z4, z4))

/*
** mls_w8m1_z4_z0:
**	sub	(w8|w9|w10|w11), w8, #?1
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z4\.b - z5\.b}, {z0\.b - z1\.b}
**	ret
*/
TEST_ZA_XN (mls_w8m1_z4_z0, svint8x2_t,
	    svmls_za32_s8_vg4x2 (w8 - 1, z4, z0),
	    svmls_za32_vg4x2 (w8 - 1, z4, z0))

/*
** mls_single_0_z1_z0:
**	mov	(w8|w9|w10|w11), #?0
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_0_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (0, z1, z0),
	        svmls_za32_vg4x2 (0, z1, z0))

/*
** mls_single_w0_z1_z0:
**	mov	(w8|w9|w10|w11), w0
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w0_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w0, z1, z0),
	        svmls_za32_vg4x2 (w0, z1, z0))

/*
** mls_single_w8_z1_z0:
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w8, z1, z0),
	        svmls_za32_vg4x2 (w8, z1, z0))

/*
** mls_single_w8p1_z1_z0:
**	add	(w8|w9|w10|w11), w8, #?1
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p1_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w8 + 1, z1, z0),
	        svmls_za32_vg4x2 (w8 + 1, z1, z0))

/*
** mls_single_w8p2_z20_z0:
**	add	(w8|w9|w10|w11), w8, #?2
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z20\.b - z21\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p2_z20_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w8 + 2, z20, z0),
	        svmls_za32_vg4x2 (w8 + 2, z20, z0))

/*
** mls_single_w11p4_z27_z0:
**	smlsll	za\.s\[w11, 4:7, vgx2\], {z27\.b - z28\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w11p4_z27_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w11 + 4, z27, z0),
	        svmls_za32_vg4x2 (w11 + 4, z27, z0))

/*
** mls_single_w8p7_z1_z0:
**	add	(w8|w9|w10|w11), w8, #?7
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p7_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w8 + 7, z1, z0),
	        svmls_za32_vg4x2 (w8 + 7, z1, z0))

/*
** mls_single_w8p8_z1_z0:
**	add	(w8|w9|w10|w11), w8, #?8
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p8_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w8 + 8, z1, z0),
	        svmls_za32_vg4x2 (w8 + 8, z1, z0))

/*
** mls_single_w0m1_z1_z0:
**	sub	(w8|w9|w10|w11), w0, #?1
**	smlsll	za\.s\[\1, 0:3, vgx2\], {z1\.b - z2\.b}, z0\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w0m1_z1_z0, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w0 - 1, z1, z0),
	        svmls_za32_vg4x2 (w0 - 1, z1, z0))

/*
** mls_single_w8_z0_z15:
**	str	d15, \[sp, #?-16\]!
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z0\.b - z1\.b}, z15\.b
**	ldr	d15, \[sp\], #?16
**	ret
*/
TEST_ZA_SINGLE_Z15 (mls_single_w8_z0_z15, svint8x2_t, svint8_t,
		    svmls_single_za32_s8_vg4x2 (w8, z0, z15),
		    svmls_za32_vg4x2 (w8, z0, z15))

/*
** mls_single_w8_z20_z16:
**	mov	(z[0-7]).d, z16.d
**	smlsll	za\.s\[w8, 0:3, vgx2\], {z20\.b - z21\.b}, \1\.b
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8_z20_z16, svint8x2_t, svint8_t,
	        svmls_single_za32_s8_vg4x2 (w8, z20, z16),
	        svmls_za32_vg4x2 (w8, z20, z16))
