/* { dg-skip-if "" { *-*-* } { "-DSTREAMING_COMPATIBLE" } { "" } } */
/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */
/* { dg-additional-options "-march=armv8.6-a+f64mm" } */
/* { dg-require-effective-target aarch64_asm_f64mm_ok }  */

#include "test_sve_acle.h"

/*
** ld1ro_u16_base:
**	ld1roh	z0\.h, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1ro_u16_base, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0),
	   z0 = svld1ro (p0, x0))

/*
** ld1ro_u16_index:
**	ld1roh	z0\.h, p0/z, \[x0, x1, lsl 1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_index, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 + x1),
	   z0 = svld1ro (p0, x0 + x1))

/*
** ld1ro_u16_1:
**	add	(x[0-9]+), x0, #?2
**	ld1roh	z0\.h, p0/z, \[\1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_1, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 + 1),
	   z0 = svld1ro (p0, x0 + 1))

/*
** ld1ro_u16_8:
**	add	(x[0-9]+), x0, #?16
**	ld1roh	z0\.h, p0/z, \[\1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_8, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 + 8),
	   z0 = svld1ro (p0, x0 + 8))

/*
** ld1ro_u16_128:
**	add	(x[0-9]+), x0, #?256
**	ld1roh	z0\.h, p0/z, \[\1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_128, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 + 128),
	   z0 = svld1ro (p0, x0 + 128))

/*
** ld1ro_u16_m1:
**	sub	(x[0-9]+), x0, #?2
**	ld1roh	z0\.h, p0/z, \[\1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_m1, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 - 1),
	   z0 = svld1ro (p0, x0 - 1))

/*
** ld1ro_u16_m8:
**	sub	(x[0-9]+), x0, #?16
**	ld1roh	z0\.h, p0/z, \[\1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_m8, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 - 8),
	   z0 = svld1ro (p0, x0 - 8))

/*
** ld1ro_u16_m144:
**	sub	(x[0-9]+), x0, #?288
**	ld1roh	z0\.h, p0/z, \[\1\]
**	ret
*/
TEST_LOAD (ld1ro_u16_m144, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 - 144),
	   z0 = svld1ro (p0, x0 - 144))

/*
** ld1ro_u16_16:
**	ld1roh	z0\.h, p0/z, \[x0, #?32\]
**	ret
*/
TEST_LOAD (ld1ro_u16_16, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 + 16),
	   z0 = svld1ro (p0, x0 + 16))

/*
** ld1ro_u16_112:
**	ld1roh	z0\.h, p0/z, \[x0, #?224\]
**	ret
*/
TEST_LOAD (ld1ro_u16_112, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 + 112),
	   z0 = svld1ro (p0, x0 + 112))

/*
** ld1ro_u16_m16:
**	ld1roh	z0\.h, p0/z, \[x0, #?-32\]
**	ret
*/
TEST_LOAD (ld1ro_u16_m16, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 - 16),
	   z0 = svld1ro (p0, x0 - 16))

/*
** ld1ro_u16_m128:
**	ld1roh	z0\.h, p0/z, \[x0, #?-256\]
**	ret
*/
TEST_LOAD (ld1ro_u16_m128, svuint16_t, uint16_t,
	   z0 = svld1ro_u16 (p0, x0 - 128),
	   z0 = svld1ro (p0, x0 - 128))

