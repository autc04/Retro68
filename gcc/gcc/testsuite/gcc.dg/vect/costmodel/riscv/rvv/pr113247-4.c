/* { dg-do compile } */
/* { dg-options "-march=rv64gcv -mabi=lp64d -O3 -ftree-vectorize -mrvv-vector-bits=zvl" } */

#include "pr113247-1.c"

/* { dg-final { scan-assembler-not {vset} } } */
