/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sme2_acle.h"

/*
** add_0_z0:
**	mov	(w8|w9|w10|w11), #?0
**	fadd	za\.s\[\1, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_0_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (0, z0),
	    svadd_za32_vg1x4 (0, z0))

/*
** add_w0_z0:
**	mov	(w8|w9|w10|w11), w0
**	fadd	za\.s\[\1, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w0_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w0, z0),
	    svadd_za32_vg1x4 (w0, z0))

/*
** add_w7_z0:
**	mov	(w8|w9|w10|w11), w7
**	fadd	za\.s\[\1, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w7_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w7, z0),
	    svadd_za32_vg1x4 (w7, z0))

/*
** add_w8_z0:
**	fadd	za\.s\[w8, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w8_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8, z0),
	    svadd_za32_vg1x4 (w8, z0))

/*
** add_w11_z0:
**	fadd	za\.s\[w11, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w11_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w11, z0),
	    svadd_za32_vg1x4 (w11, z0))


/*
** add_w12_z0:
**	mov	(w8|w9|w10|w11), w12
**	fadd	za\.s\[\1, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w12_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w12, z0),
	    svadd_za32_vg1x4 (w12, z0))

/*
** add_w8p7_z0:
**	fadd	za\.s\[w8, 7, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w8p7_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8 + 7, z0),
	    svadd_za32_vg1x4 (w8 + 7, z0))

/*
** add_w8p8_z0:
**	add	(w8|w9|w10|w11), w8, #?8
**	fadd	za\.s\[\1, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w8p8_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8 + 8, z0),
	    svadd_za32_vg1x4 (w8 + 8, z0))

/*
** add_w8m1_z0:
**	sub	(w8|w9|w10|w11), w8, #?1
**	fadd	za\.s\[\1, 0, vgx4\], {z0\.s - z3\.s}
**	ret
*/
TEST_ZA_XN (add_w8m1_z0, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8 - 1, z0),
	    svadd_za32_vg1x4 (w8 - 1, z0))

/*
** add_w8_z4:
**	fadd	za\.s\[w8, 0, vgx4\], {z4\.s - z7\.s}
**	ret
*/
TEST_ZA_XN (add_w8_z4, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8, z4),
	    svadd_za32_vg1x4 (w8, z4))

/* Leave the assembler to check for correctness for misaligned registers.  */

/*
** add_w8_z18:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fadd	za\.s\[w8, 0, vgx4\], [^\n]+
**	ret
*/
TEST_ZA_XN (add_w8_z18, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8, z18),
	    svadd_za32_vg1x4 (w8, z18))

/*
** add_w8_z23:
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	mov	[^\n]+
**	fadd	za\.s\[w8, 0, vgx4\], [^\n]+
**	ret
*/
TEST_ZA_XN (add_w8_z23, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8, z23),
	    svadd_za32_vg1x4 (w8, z23))

/*
** add_w8_z28:
**	fadd	za\.s\[w8, 0, vgx4\], {z28\.s - z31\.s}
**	ret
*/
TEST_ZA_XN (add_w8_z28, svfloat32x4_t,
	    svadd_za32_f32_vg1x4 (w8, z28),
	    svadd_za32_vg1x4 (w8, z28))
