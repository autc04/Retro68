/* Ensure that explicit zero-entend instructions are present when compiling
   for targets that may not have sram-ecc enabled (in which sub-dword loads do
   not zero the high bits of the target register).  */

/* { dg-do compile } */
/* { dg-options "-O2 -ftree-vectorize -dp -msram-ecc=any" } */

typedef unsigned int v64si __attribute__ ((vector_size (64*4)));
typedef unsigned char v64qi __attribute__ ((vector_size (64*1)));

extern v64si a;
extern v64qi b;

void
f ()
{
  for (int n = 0; n < 64; n++)
    a[n] = b[n];
}

/* { dg-final { scan-assembler "(\\\*zero_extendv64qiv64si_sdwa|\\\*zero_extendv64qiv64si_shift)" } } */
