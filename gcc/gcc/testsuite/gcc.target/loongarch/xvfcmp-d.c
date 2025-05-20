/* { dg-do compile } */
/* { dg-options "-O2 -mlasx -fno-vect-cost-model" } */
/* { dg-final { check-function-bodies "**" "" } } */

#define F double
#define I long long
#define VL 32

#include "vfcmp-f.c"

/*
** compare_quiet_equal:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.ceq.d	(\$xr[0-9]+),(\1,\2|\2,\1)
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_not_equal:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cune.d	(\$xr[0-9]+),(\1,\2|\2,\1)
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_greater:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.slt.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_greater_equal:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.sle.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_less:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.slt.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_less_equal:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.sle.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_not_greater:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.sule.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_less_unordered:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.sult.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_not_less:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.sule.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_signaling_greater_unordered:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.sult.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_less:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.clt.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_less_equal:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cle.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_greater:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.clt.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_greater_equal:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cle.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_not_less:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cule.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_greater_unordered:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cult.d	(\$xr[0-9]+),\2,\1
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_not_greater:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cule.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_less_unordered:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cult.d	(\$xr[0-9]+),\1,\2
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_unordered:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cun.d	(\$xr[0-9]+),(\1,\2|\2,\1)
**	xvst	\3,\$r6,0
**	jr	\$r1
*/

/*
** compare_quiet_ordered:
** 	xvld	(\$xr[0-9]+),\$r4,0
** 	xvld	(\$xr[0-9]+),\$r5,0
** 	xvfcmp.cor.d	(\$xr[0-9]+),(\1,\2|\2,\1)
**	xvst	\3,\$r6,0
**	jr	\$r1
*/
