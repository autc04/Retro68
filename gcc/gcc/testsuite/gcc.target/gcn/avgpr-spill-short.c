/* { dg-do compile } */
/* { dg-additional-options "-march=gfx908 -O1" } */
/* { dg-final { scan-assembler "accvgpr" } } */

#define TYPE short

#include "avgpr-spill-int.c"
