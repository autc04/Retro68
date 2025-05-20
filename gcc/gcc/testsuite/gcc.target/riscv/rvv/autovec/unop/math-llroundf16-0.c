/* { dg-do compile } */
/* { dg-options "-march=rv64gcv_zvfh_zfh -mabi=lp64d -O3 -ftree-vectorize -fno-vect-cost-model -ffast-math -fno-schedule-insns -fno-schedule-insns2" } */
/* { dg-final { check-function-bodies "**" "" } } */

#include <stdint-gcc.h>
#include "test-math.h"

/*
** test__Float16_int64_t___builtin_llroundf16:
**   frrm\s+[atx][0-9]+
**   ...
**   fsrmi\s+4
**   ...
**   vfwcvt\.f\.f\.v\s+v[0-9]+,\s*v[0-9]+
**   ...
**   vfwcvt\.x\.f\.v\s+v[0-9]+,\s*v[0-9]+
**   ...
**   fsrm\s+[atx][0-9]+
**   ret
*/
TEST_UNARY_CALL_CVT (_Float16, int64_t, __builtin_llroundf16)
