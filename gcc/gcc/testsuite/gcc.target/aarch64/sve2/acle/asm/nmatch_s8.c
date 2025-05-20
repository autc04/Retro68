/* { dg-skip-if "" { *-*-* } { "-DSTREAMING_COMPATIBLE" } { "" } } */
/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** nmatch_s8_tied:
**	nmatch	p0\.b, p0/z, z0\.b, z1\.b
**	ret
*/
TEST_COMPARE_Z (nmatch_s8_tied, svint8_t,
		p0 = svnmatch_s8 (p0, z0, z1),
		p0 = svnmatch (p0, z0, z1))

/*
** nmatch_s8_untied:
**	nmatch	p0\.b, p1/z, z0\.b, z1\.b
**	ret
*/
TEST_COMPARE_Z (nmatch_s8_untied, svint8_t,
		p0 = svnmatch_s8 (p1, z0, z1),
		p0 = svnmatch (p1, z0, z1))
