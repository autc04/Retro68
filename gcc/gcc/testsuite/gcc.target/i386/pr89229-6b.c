/* { dg-do compile { target { ! ia32 } } } */
/* { dg-options "-O2 -march=skylake-avx512 -mno-avx512vl" } */

#include "pr89229-6a.c"

/* { dg-final { scan-assembler-times "vmovss\[^\n\r]*xmm1\[67]\[^\n\r]*xmm1\[67]\[^\n\r]*xmm1\[67]" 1 } } */
