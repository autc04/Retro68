/* { dg-do compile } */
/* { dg-options "-O0 -mavx -mtune=generic -mvzeroupper -dp" } */

#include <immintrin.h>

extern __m256 x, y;

void
foo ()
{
  x = y;
}

/* { dg-final { scan-assembler-times "avx_vzeroupper" 1 } } */
