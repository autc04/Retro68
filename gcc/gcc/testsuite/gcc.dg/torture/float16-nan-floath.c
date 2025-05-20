/* Test _Float16 NaNs in <float.h>.  */
/* { dg-do run } */
/* { dg-options "-std=c23 -fsignaling-nans" } */
/* { dg-add-options float16 } */
/* { dg-add-options ieee } */
/* { dg-require-effective-target float16_runtime } */
/* { dg-require-effective-target fenv_exceptions } */

#define WIDTH 16
#define EXT 0
#include "floatn-nan-floath.h"
