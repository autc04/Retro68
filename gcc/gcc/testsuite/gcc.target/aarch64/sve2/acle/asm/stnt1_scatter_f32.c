/* { dg-skip-if "" { *-*-* } { "-DSTREAMING_COMPATIBLE" } { "" } } */
/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** stnt1_scatter_f32:
**	stnt1w	z0\.s, p0, \[z1\.s\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_f32, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_f32 (p0, z1, z0),
		       svstnt1_scatter (p0, z1, z0))

/*
** stnt1_scatter_x0_f32_offset:
**	stnt1w	z0\.s, p0, \[z1\.s, x0\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_x0_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, x0, z0),
		       svstnt1_scatter_offset (p0, z1, x0, z0))

/*
** stnt1_scatter_m4_f32_offset:
**	mov	(x[0-9]+), #?-4
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_m4_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, -4, z0),
		       svstnt1_scatter_offset (p0, z1, -4, z0))

/*
** stnt1_scatter_0_f32_offset:
**	stnt1w	z0\.s, p0, \[z1\.s\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_0_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 0, z0),
		       svstnt1_scatter_offset (p0, z1, 0, z0))

/*
** stnt1_scatter_5_f32_offset:
**	mov	(x[0-9]+), #?5
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_5_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 5, z0),
		       svstnt1_scatter_offset (p0, z1, 5, z0))

/*
** stnt1_scatter_6_f32_offset:
**	mov	(x[0-9]+), #?6
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_6_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 6, z0),
		       svstnt1_scatter_offset (p0, z1, 6, z0))

/*
** stnt1_scatter_7_f32_offset:
**	mov	(x[0-9]+), #?7
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_7_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 7, z0),
		       svstnt1_scatter_offset (p0, z1, 7, z0))

/*
** stnt1_scatter_8_f32_offset:
**	mov	(x[0-9]+), #?8
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_8_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 8, z0),
		       svstnt1_scatter_offset (p0, z1, 8, z0))

/*
** stnt1_scatter_124_f32_offset:
**	mov	(x[0-9]+), #?124
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_124_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 124, z0),
		       svstnt1_scatter_offset (p0, z1, 124, z0))

/*
** stnt1_scatter_128_f32_offset:
**	mov	(x[0-9]+), #?128
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_128_f32_offset, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_offset_f32 (p0, z1, 128, z0),
		       svstnt1_scatter_offset (p0, z1, 128, z0))

/*
** stnt1_scatter_x0_f32_index:
**	lsl	(x[0-9]+), x0, #?2
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_x0_f32_index, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_index_f32 (p0, z1, x0, z0),
		       svstnt1_scatter_index (p0, z1, x0, z0))

/*
** stnt1_scatter_m1_f32_index:
**	mov	(x[0-9]+), #?-4
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_m1_f32_index, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_index_f32 (p0, z1, -1, z0),
		       svstnt1_scatter_index (p0, z1, -1, z0))

/*
** stnt1_scatter_0_f32_index:
**	stnt1w	z0\.s, p0, \[z1\.s\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_0_f32_index, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_index_f32 (p0, z1, 0, z0),
		       svstnt1_scatter_index (p0, z1, 0, z0))

/*
** stnt1_scatter_5_f32_index:
**	mov	(x[0-9]+), #?20
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_5_f32_index, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_index_f32 (p0, z1, 5, z0),
		       svstnt1_scatter_index (p0, z1, 5, z0))

/*
** stnt1_scatter_31_f32_index:
**	mov	(x[0-9]+), #?124
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_31_f32_index, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_index_f32 (p0, z1, 31, z0),
		       svstnt1_scatter_index (p0, z1, 31, z0))

/*
** stnt1_scatter_32_f32_index:
**	mov	(x[0-9]+), #?128
**	stnt1w	z0\.s, p0, \[z1\.s, \1\]
**	ret
*/
TEST_STORE_SCATTER_ZS (stnt1_scatter_32_f32_index, svfloat32_t, svuint32_t,
		       svstnt1_scatter_u32base_index_f32 (p0, z1, 32, z0),
		       svstnt1_scatter_index (p0, z1, 32, z0))

/*
** stnt1_scatter_x0_f32_u32offset:
**	stnt1w	z0\.s, p0, \[z1\.s, x0\]
**	ret
*/
TEST_STORE_SCATTER_SZ (stnt1_scatter_x0_f32_u32offset, svfloat32_t, float32_t, svuint32_t,
		       svstnt1_scatter_u32offset_f32 (p0, x0, z1, z0),
		       svstnt1_scatter_offset (p0, x0, z1, z0))

/*
** stnt1_scatter_f32_u32offset:
**	stnt1w	z0\.s, p0, \[z1\.s, x0\]
**	ret
*/
TEST_STORE_SCATTER_SZ (stnt1_scatter_f32_u32offset, svfloat32_t, float32_t, svuint32_t,
		       svstnt1_scatter_u32offset_f32 (p0, x0, z1, z0),
		       svstnt1_scatter_offset (p0, x0, z1, z0))
