/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#pragma GCC target "+sme-f64f64"

#include "test_sme2_acle.h"

/*
** mls_0_z0_z0:
**	mov	(w8|w9|w10|w11), #?0
**	fmls	za\.d\[\1, 0, vgx4\], {z0\.d - z3\.d}, {z0\.d - z3\.d}
**	ret
*/
TEST_ZA_XN (mls_0_z0_z0, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (0, z0, z0),
	    svmls_za64_vg1x4 (0, z0, z0))

/*
** mls_w0_z0_z0:
**	mov	(w8|w9|w10|w11), w0
**	fmls	za\.d\[\1, 0, vgx4\], {z0\.d - z3\.d}, {z0\.d - z3\.d}
**	ret
*/
TEST_ZA_XN (mls_w0_z0_z0, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w0, z0, z0),
	    svmls_za64_vg1x4 (w0, z0, z0))

/*
** mls_w8_z0_z4:
**	fmls	za\.d\[w8, 0, vgx4\], {z0\.d - z3\.d}, {z4\.d - z7\.d}
**	ret
*/
TEST_ZA_XN (mls_w8_z0_z4, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8, z0, z4),
	    svmls_za64_vg1x4 (w8, z0, z4))

/* Leave the assembler to check for correctness for misaligned registers.  */

/*
** mls_w8_z0_z18:
**	...
**	fmls	za\.d\[w8, 0, vgx4\], {z0\.d - z3\.d}, [^\n]+
**	ret
*/
TEST_ZA_XN (mls_w8_z0_z18, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8, z0, z18),
	    svmls_za64_vg1x4 (w8, z0, z18))

/*
** mls_w8_z18_z28:
**	...
**	fmls	za\.d\[w8, 0, vgx4\], [^\n]+, {z28\.d - z31\.d}
**	ret
*/
TEST_ZA_XN (mls_w8_z18_z28, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8, z18, z28),
	    svmls_za64_vg1x4 (w8, z18, z28))

/*
** mls_w8_z28_z23:
**	...
**	fmls	za\.d\[w8, 0, vgx4\], {z28\.d - z31\.d}, [^\n]+
**	ret
*/
TEST_ZA_XN (mls_w8_z28_z23, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8, z28, z23),
	    svmls_za64_vg1x4 (w8, z28, z23))

/*
** mls_w8p7_z4_z0:
**	fmls	za\.d\[w8, 7, vgx4\], {z4\.d - z7\.d}, {z0\.d - z3\.d}
**	ret
*/
TEST_ZA_XN (mls_w8p7_z4_z0, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8 + 7, z4, z0),
	    svmls_za64_vg1x4 (w8 + 7, z4, z0))

/*
** mls_w8p8_z4_z4:
**	add	(w8|w9|w10|w11), w8, #?8
**	fmls	za\.d\[\1, 0, vgx4\], {z4\.d - z7\.d}, {z4\.d - z7\.d}
**	ret
*/
TEST_ZA_XN (mls_w8p8_z4_z4, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8 + 8, z4, z4),
	    svmls_za64_vg1x4 (w8 + 8, z4, z4))

/*
** mls_w8m1_z4_z0:
**	sub	(w8|w9|w10|w11), w8, #?1
**	fmls	za\.d\[\1, 0, vgx4\], {z4\.d - z7\.d}, {z0\.d - z3\.d}
**	ret
*/
TEST_ZA_XN (mls_w8m1_z4_z0, svfloat64x4_t,
	    svmls_za64_f64_vg1x4 (w8 - 1, z4, z0),
	    svmls_za64_vg1x4 (w8 - 1, z4, z0))

/*
** mls_single_0_z1_z0:
**	mov	(w8|w9|w10|w11), #?0
**	fmls	za\.d\[\1, 0, vgx4\], {z1\.d - z4\.d}, z0\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_0_z1_z0, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (0, z1, z0),
	        svmls_za64_vg1x4 (0, z1, z0))

/*
** mls_single_w0_z1_z0:
**	mov	(w8|w9|w10|w11), w0
**	fmls	za\.d\[\1, 0, vgx4\], {z1\.d - z4\.d}, z0\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_w0_z1_z0, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (w0, z1, z0),
	        svmls_za64_vg1x4 (w0, z1, z0))

/*
** mls_single_w8_z1_z0:
**	fmls	za\.d\[w8, 0, vgx4\], {z1\.d - z4\.d}, z0\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8_z1_z0, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (w8, z1, z0),
	        svmls_za64_vg1x4 (w8, z1, z0))

/*
** mls_single_w8p7_z1_z0:
**	fmls	za\.d\[w8, 7, vgx4\], {z1\.d - z4\.d}, z0\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p7_z1_z0, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (w8 + 7, z1, z0),
	        svmls_za64_vg1x4 (w8 + 7, z1, z0))

/*
** mls_single_w8p8_z1_z0:
**	add	(w8|w9|w10|w11), w8, #?8
**	fmls	za\.d\[\1, 0, vgx4\], {z1\.d - z4\.d}, z0\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8p8_z1_z0, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (w8 + 8, z1, z0),
	        svmls_za64_vg1x4 (w8 + 8, z1, z0))

/*
** mls_single_w0m1_z1_z0:
**	sub	(w8|w9|w10|w11), w0, #?1
**	fmls	za\.d\[\1, 0, vgx4\], {z1\.d - z4\.d}, z0\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_w0m1_z1_z0, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (w0 - 1, z1, z0),
	        svmls_za64_vg1x4 (w0 - 1, z1, z0))

/*
** mls_single_w8_z0_z15:
**	str	d15, \[sp, #?-16\]!
**	fmls	za\.d\[w8, 0, vgx4\], {z0\.d - z3\.d}, z15\.d
**	ldr	d15, \[sp\], #?16
**	ret
*/
TEST_ZA_SINGLE_Z15 (mls_single_w8_z0_z15, svfloat64x4_t, svfloat64_t,
		    svmls_single_za64_f64_vg1x4 (w8, z0, z15),
		    svmls_za64_vg1x4 (w8, z0, z15))

/*
** mls_single_w8_z20_z16:
**	mov	(z[0-7]).d, z16.d
**	fmls	za\.d\[w8, 0, vgx4\], {z20\.d - z23\.d}, \1\.d
**	ret
*/
TEST_ZA_SINGLE (mls_single_w8_z20_z16, svfloat64x4_t, svfloat64_t,
	        svmls_single_za64_f64_vg1x4 (w8, z20, z16),
	        svmls_za64_vg1x4 (w8, z20, z16))
