/* { dg-skip-if "" { *-*-* } { "-DSTREAMING_COMPATIBLE" } { "" } } */
/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** ldnt1uw_gather_s64_tied1:
**	ldnt1w	z0\.d, p0/z, \[z0\.d\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_s64_tied1, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_s64 (p0, z0),
		     z0_res = svldnt1uw_gather_s64 (p0, z0))

/*
** ldnt1uw_gather_s64_untied:
**	ldnt1w	z0\.d, p0/z, \[z1\.d\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_s64_untied, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_s64 (p0, z1),
		     z0_res = svldnt1uw_gather_s64 (p0, z1))

/*
** ldnt1uw_gather_x0_s64_offset:
**	ldnt1w	z0\.d, p0/z, \[z0\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_x0_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, x0),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, x0))

/*
** ldnt1uw_gather_m4_s64_offset:
**	mov	(x[0-9]+), #?-4
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_m4_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, -4),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, -4))

/*
** ldnt1uw_gather_0_s64_offset:
**	ldnt1w	z0\.d, p0/z, \[z0\.d\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_0_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 0),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 0))

/*
** ldnt1uw_gather_5_s64_offset:
**	mov	(x[0-9]+), #?5
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_5_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 5),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 5))

/*
** ldnt1uw_gather_6_s64_offset:
**	mov	(x[0-9]+), #?6
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_6_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 6),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 6))

/*
** ldnt1uw_gather_7_s64_offset:
**	mov	(x[0-9]+), #?7
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_7_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 7),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 7))

/*
** ldnt1uw_gather_8_s64_offset:
**	mov	(x[0-9]+), #?8
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_8_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 8),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 8))

/*
** ldnt1uw_gather_124_s64_offset:
**	mov	(x[0-9]+), #?124
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_124_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 124),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 124))

/*
** ldnt1uw_gather_128_s64_offset:
**	mov	(x[0-9]+), #?128
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_128_s64_offset, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_offset_s64 (p0, z0, 128),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, z0, 128))

/*
** ldnt1uw_gather_x0_s64_index:
**	lsl	(x[0-9]+), x0, #?2
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_x0_s64_index, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_index_s64 (p0, z0, x0),
		     z0_res = svldnt1uw_gather_index_s64 (p0, z0, x0))

/*
** ldnt1uw_gather_m1_s64_index:
**	mov	(x[0-9]+), #?-4
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_m1_s64_index, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_index_s64 (p0, z0, -1),
		     z0_res = svldnt1uw_gather_index_s64 (p0, z0, -1))

/*
** ldnt1uw_gather_0_s64_index:
**	ldnt1w	z0\.d, p0/z, \[z0\.d\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_0_s64_index, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_index_s64 (p0, z0, 0),
		     z0_res = svldnt1uw_gather_index_s64 (p0, z0, 0))

/*
** ldnt1uw_gather_5_s64_index:
**	mov	(x[0-9]+), #?20
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_5_s64_index, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_index_s64 (p0, z0, 5),
		     z0_res = svldnt1uw_gather_index_s64 (p0, z0, 5))

/*
** ldnt1uw_gather_31_s64_index:
**	mov	(x[0-9]+), #?124
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_31_s64_index, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_index_s64 (p0, z0, 31),
		     z0_res = svldnt1uw_gather_index_s64 (p0, z0, 31))

/*
** ldnt1uw_gather_32_s64_index:
**	mov	(x[0-9]+), #?128
**	ldnt1w	z0\.d, p0/z, \[z0\.d, \1\]
**	ret
*/
TEST_LOAD_GATHER_ZS (ldnt1uw_gather_32_s64_index, svint64_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64base_index_s64 (p0, z0, 32),
		     z0_res = svldnt1uw_gather_index_s64 (p0, z0, 32))

/*
** ldnt1uw_gather_x0_s64_s64offset:
**	ldnt1w	z0\.d, p0/z, \[z0\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_x0_s64_s64offset, svint64_t, uint32_t, svint64_t,
		     z0_res = svldnt1uw_gather_s64offset_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_tied1_s64_s64offset:
**	ldnt1w	z0\.d, p0/z, \[z0\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_tied1_s64_s64offset, svint64_t, uint32_t, svint64_t,
		     z0_res = svldnt1uw_gather_s64offset_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_untied_s64_s64offset:
**	ldnt1w	z0\.d, p0/z, \[z1\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_untied_s64_s64offset, svint64_t, uint32_t, svint64_t,
		     z0_res = svldnt1uw_gather_s64offset_s64 (p0, x0, z1),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, x0, z1))

/*
** ldnt1uw_gather_x0_s64_u64offset:
**	ldnt1w	z0\.d, p0/z, \[z0\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_x0_s64_u64offset, svint64_t, uint32_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64offset_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_tied1_s64_u64offset:
**	ldnt1w	z0\.d, p0/z, \[z0\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_tied1_s64_u64offset, svint64_t, uint32_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64offset_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_untied_s64_u64offset:
**	ldnt1w	z0\.d, p0/z, \[z1\.d, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_untied_s64_u64offset, svint64_t, uint32_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64offset_s64 (p0, x0, z1),
		     z0_res = svldnt1uw_gather_offset_s64 (p0, x0, z1))

/*
** ldnt1uw_gather_x0_s64_s64index:
**	lsl	(z[0-9]+\.d), z0\.d, #2
**	ldnt1w	z0\.d, p0/z, \[\1, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_x0_s64_s64index, svint64_t, uint32_t, svint64_t,
		     z0_res = svldnt1uw_gather_s64index_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_index_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_tied1_s64_s64index:
**	lsl	(z[0-9]+\.d), z0\.d, #2
**	ldnt1w	z0\.d, p0/z, \[\1, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_tied1_s64_s64index, svint64_t, uint32_t, svint64_t,
		     z0_res = svldnt1uw_gather_s64index_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_index_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_untied_s64_s64index:
**	lsl	(z[0-9]+\.d), z1\.d, #2
**	ldnt1w	z0\.d, p0/z, \[\1, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_untied_s64_s64index, svint64_t, uint32_t, svint64_t,
		     z0_res = svldnt1uw_gather_s64index_s64 (p0, x0, z1),
		     z0_res = svldnt1uw_gather_index_s64 (p0, x0, z1))

/*
** ldnt1uw_gather_x0_s64_u64index:
**	lsl	(z[0-9]+\.d), z0\.d, #2
**	ldnt1w	z0\.d, p0/z, \[\1, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_x0_s64_u64index, svint64_t, uint32_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64index_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_index_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_tied1_s64_u64index:
**	lsl	(z[0-9]+\.d), z0\.d, #2
**	ldnt1w	z0\.d, p0/z, \[\1, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_tied1_s64_u64index, svint64_t, uint32_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64index_s64 (p0, x0, z0),
		     z0_res = svldnt1uw_gather_index_s64 (p0, x0, z0))

/*
** ldnt1uw_gather_untied_s64_u64index:
**	lsl	(z[0-9]+\.d), z1\.d, #2
**	ldnt1w	z0\.d, p0/z, \[\1, x0\]
**	ret
*/
TEST_LOAD_GATHER_SZ (ldnt1uw_gather_untied_s64_u64index, svint64_t, uint32_t, svuint64_t,
		     z0_res = svldnt1uw_gather_u64index_s64 (p0, x0, z1),
		     z0_res = svldnt1uw_gather_index_s64 (p0, x0, z1))
