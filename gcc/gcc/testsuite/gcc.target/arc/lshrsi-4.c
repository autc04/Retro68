/* { dg-do compile } */
/* { dg-options "-O2 -mcpu=em" } */

unsigned int foo(unsigned int x) { return x >> 2; }

/* { dg-final { scan-assembler-times "lsr_s\\s+r0,r0" 2 } } */
/* { dg-final { scan-assembler "j_s\.d" } } */
