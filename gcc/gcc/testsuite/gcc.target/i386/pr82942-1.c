/* { dg-do compile } */
/* { dg-options "-mavx512f -O2" } */

#include "pr82941-1.c"

/* { dg-final { scan-assembler-times "vzeroupper" 1 } } */
