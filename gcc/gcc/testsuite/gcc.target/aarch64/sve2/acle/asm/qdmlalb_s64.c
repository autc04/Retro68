/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** qdmlalb_s64_tied1:
**	sqdmlalb	z0\.d, z4\.s, z5\.s
**	ret
*/
TEST_DUAL_Z (qdmlalb_s64_tied1, svint64_t, svint32_t,
	     z0 = svqdmlalb_s64 (z0, z4, z5),
	     z0 = svqdmlalb (z0, z4, z5))

/*
** qdmlalb_s64_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z4
**	sqdmlalb	z0\.d, \1\.s, z1\.s
**	ret
*/
TEST_DUAL_Z_REV (qdmlalb_s64_tied2, svint64_t, svint32_t,
		 z0_res = svqdmlalb_s64 (z4, z0, z1),
		 z0_res = svqdmlalb (z4, z0, z1))

/*
** qdmlalb_s64_tied3:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z4
**	sqdmlalb	z0\.d, z1\.s, \1\.s
**	ret
*/
TEST_DUAL_Z_REV (qdmlalb_s64_tied3, svint64_t, svint32_t,
		 z0_res = svqdmlalb_s64 (z4, z1, z0),
		 z0_res = svqdmlalb (z4, z1, z0))

/*
** qdmlalb_s64_untied:
**	movprfx	z0, z1
**	sqdmlalb	z0\.d, z4\.s, z5\.s
**	ret
*/
TEST_DUAL_Z (qdmlalb_s64_untied, svint64_t, svint32_t,
	     z0 = svqdmlalb_s64 (z1, z4, z5),
	     z0 = svqdmlalb (z1, z4, z5))

/*
** qdmlalb_w0_s64_tied1:
**	mov	(z[0-9]+\.s), w0
**	sqdmlalb	z0\.d, z4\.s, \1
**	ret
*/
TEST_DUAL_ZX (qdmlalb_w0_s64_tied1, svint64_t, svint32_t, int32_t,
	      z0 = svqdmlalb_n_s64 (z0, z4, x0),
	      z0 = svqdmlalb (z0, z4, x0))

/*
** qdmlalb_w0_s64_untied:
**	mov	(z[0-9]+\.s), w0
**	movprfx	z0, z1
**	sqdmlalb	z0\.d, z4\.s, \1
**	ret
*/
TEST_DUAL_ZX (qdmlalb_w0_s64_untied, svint64_t, svint32_t, int32_t,
	      z0 = svqdmlalb_n_s64 (z1, z4, x0),
	      z0 = svqdmlalb (z1, z4, x0))

/*
** qdmlalb_11_s64_tied1:
**	mov	(z[0-9]+\.s), #11
**	sqdmlalb	z0\.d, z4\.s, \1
**	ret
*/
TEST_DUAL_Z (qdmlalb_11_s64_tied1, svint64_t, svint32_t,
	     z0 = svqdmlalb_n_s64 (z0, z4, 11),
	     z0 = svqdmlalb (z0, z4, 11))

/*
** qdmlalb_11_s64_untied:
**	mov	(z[0-9]+\.s), #11
**	movprfx	z0, z1
**	sqdmlalb	z0\.d, z4\.s, \1
**	ret
*/
TEST_DUAL_Z (qdmlalb_11_s64_untied, svint64_t, svint32_t,
	     z0 = svqdmlalb_n_s64 (z1, z4, 11),
	     z0 = svqdmlalb (z1, z4, 11))
