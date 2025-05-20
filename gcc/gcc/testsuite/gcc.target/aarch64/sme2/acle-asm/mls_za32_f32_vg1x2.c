/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** mls_0_z0_z0:
**	mov	(w8|w9|w10|w11), #?0
**	fmls	za\.s\[\1, 0, vgx2\], {z0\.s - z1\.s}, {z0\.s - z1\.s}
**	ret
*/
TEST_ZA_XN (mls_0_z0_z0, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (0, z0, z0),
	    svmls_za32_vg1x2 (0, z0, z0))

/*
** mls_w0_z0_z0:
**	mov	(w8|w9|w10|w11), w0
**	fmls	za\.s\[\1, 0, vgx2\], {z0\.s - z1\.s}, {z0\.s - z1\.s}
**	ret
*/
TEST_ZA_XN (mls_w0_z0_z0, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w0, z0, z0),
	    svmls_za32_vg1x2 (w0, z0, z0))

/*
** mls_w8_z0_z4:
**	fmls	za\.s\[w8, 0, vgx2\], {z0\.s - z1\.s}, {z4\.s - z5\.s}
**	ret
*/
TEST_ZA_XN (mls_w8_z0_z4, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8, z0, z4),
	    svmls_za32_vg1x2 (w8, z0, z4))

/*
** mls_w8_z4_z18:
**	fmls	za\.s\[w8, 0, vgx2\], {z4\.s - z5\.s}, {z18\.s - z19\.s}
**	ret
*/
TEST_ZA_XN (mls_w8_z4_z18, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8, z4, z18),
	    svmls_za32_vg1x2 (w8, z4, z18))

/* Leave the assembler to check for correctness for misaligned registers.  */

/*
** mls_w8_z23_z0:
**	...
**	fmls	za\.s\[w8, 0, vgx2\], [^\n]+, {z0\.s - z1\.s}
**	ret
*/
TEST_ZA_XN (mls_w8_z23_z0, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8, z23, z0),
	    svmls_za32_vg1x2 (w8, z23, z0))

/*
** mls_w8_z18_z23:
**	...
**	fmls	za\.s\[w8, 0, vgx2\], {z18\.s - z19\.s}, [^\n]+
**	ret
*/
TEST_ZA_XN (mls_w8_z18_z23, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8, z18, z23),
	    svmls_za32_vg1x2 (w8, z18, z23))

/*
** mls_w8_z4_z28:
**	fmls	za\.s\[w8, 0, vgx2\], {z4\.s - z5\.s}, {z28\.s - z29\.s}
**	ret
*/
TEST_ZA_XN (mls_w8_z4_z28, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8, z4, z28),
	    svmls_za32_vg1x2 (w8, z4, z28))

/*
** mls_w8p7_z4_z0:
**	fmls	za\.s\[w8, 7, vgx2\], {z4\.s - z5\.s}, {z0\.s - z1\.s}
**	ret
*/
TEST_ZA_XN (mls_w8p7_z4_z0, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8 + 7, z4, z0),
	    svmls_za32_vg1x2 (w8 + 7, z4, z0))

/*
** mls_w8p8_z4_z4:
**	add	(w8|w9|w10|w11), w8, #?8
**	fmls	za\.s\[\1, 0, vgx2\], {z4\.s - z5\.s}, {z4\.s - z5\.s}
**	ret
*/
TEST_ZA_XN (mls_w8p8_z4_z4, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8 + 8, z4, z4),
	    svmls_za32_vg1x2 (w8 + 8, z4, z4))

/*
** mls_w8m1_z4_z0:
**	sub	(w8|w9|w10|w11), w8, #?1
**	fmls	za\.s\[\1, 0, vgx2\], {z4\.s - z5\.s}, {z0\.s - z1\.s}
**	ret
*/
TEST_ZA_XN (mls_w8m1_z4_z0, svfloat32x2_t,
	    svmls_za32_f32_vg1x2 (w8 - 1, z4, z0),
	    svmls_za32_vg1x2 (w8 - 1, z4, z0))

/*
** mls_single_0_z1_z0:
**	mov	(w8|w9|w10|w11), #?0
**	fmls	za\.s\[\1, 0, vgx2\], {z1\.s - z2\.s}, z0\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_0_z1_z0, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (0, z1, z0),
	        svmls_za32_vg1x2 (0, z1, z0))

/*
** mls_single_w0_z1_z0:
**	mov	(w8|w9|w10|w11), w0
**	fmls	za\.s\[\1, 0, vgx2\], {z1\.s - z2\.s}, z0\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_w0_z1_z0, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (w0, z1, z0),
	        svmls_za32_vg1x2 (w0, z1, z0))

/*
** mls_single_w8_z1_z0:
**	fmls	za\.s\[w8, 0, vgx2\], {z1\.s - z2\.s}, z0\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8_z1_z0, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (w8, z1, z0),
	        svmls_za32_vg1x2 (w8, z1, z0))

/*
** mls_single_w8p7_z1_z0:
**	fmls	za\.s\[w8, 7, vgx2\], {z1\.s - z2\.s}, z0\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p7_z1_z0, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (w8 + 7, z1, z0),
	        svmls_za32_vg1x2 (w8 + 7, z1, z0))

/*
** mls_single_w8p8_z1_z0:
**	add	(w8|w9|w10|w11), w8, #?8
**	fmls	za\.s\[\1, 0, vgx2\], {z1\.s - z2\.s}, z0\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p8_z1_z0, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (w8 + 8, z1, z0),
	        svmls_za32_vg1x2 (w8 + 8, z1, z0))

/*
** mls_single_w0m1_z1_z0:
**	sub	(w8|w9|w10|w11), w0, #?1
**	fmls	za\.s\[\1, 0, vgx2\], {z1\.s - z2\.s}, z0\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_w0m1_z1_z0, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (w0 - 1, z1, z0),
	        svmls_za32_vg1x2 (w0 - 1, z1, z0))

/*
** mls_single_w8_z0_z15:
**	str	d15, \[sp, #?-16\]!
**	fmls	za\.s\[w8, 0, vgx2\], {z0\.s - z1\.s}, z15\.s
**	ldr	d15, \[sp\], #?16
**	ret
*/
TEST_ZA_SINGLE_Z15 (mls_single_w8_z0_z15, svfloat32x2_t, svfloat32_t,
		    svmls_single_za32_f32_vg1x2 (w8, z0, z15),
		    svmls_za32_vg1x2 (w8, z0, z15))

/*
** mls_single_w8_z20_z16:
**	mov	(z[0-7]).d, z16.d
**	fmls	za\.s\[w8, 0, vgx2\], {z20\.s - z21\.s}, \1\.s
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8_z20_z16, svfloat32x2_t, svfloat32_t,
	        svmls_single_za32_f32_vg1x2 (w8, z20, z16),
	        svmls_za32_vg1x2 (w8, z20, z16))
