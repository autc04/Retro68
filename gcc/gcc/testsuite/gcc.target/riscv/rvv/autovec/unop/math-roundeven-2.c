/* { dg-do compile } */
/* { dg-options "-march=rv64gcv -mabi=lp64d -O3 -ftree-vectorize -fno-vect-cost-model -ffast-math -fno-schedule-insns -fno-schedule-insns2" } */
/* { dg-final { check-function-bodies "**" "" } } */

#include "test-math.h"

/*
** test_double___builtin_roundeven:
**   frrm\s+[atx][0-9]+
**   ...
**   fsrmi\s+0
**   ...
**   vfabs\.v\s+v[0-9]+,\s*v[0-9]+
**   vmflt\.vf\s+v0,\s*v[0-9]+,\s*[fa]+[0-9]+
**   vfcvt\.x\.f\.v\s+v[0-9]+,\s*v[0-9]+,\s*v0\.t
**   vfcvt\.f\.x\.v\s+v[0-9]+,\s*v[0-9]+,\s*v0\.t
**   vfsgnj\.vv\s+v[0-9]+,v[0-9]+,v[0-9]+
**   ...
**   fsrm\s+[atx][0-9]+
**   ...
*/
TEST_UNARY_CALL (double, __builtin_roundeven)
