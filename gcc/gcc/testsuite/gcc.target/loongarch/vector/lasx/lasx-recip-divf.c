/* { dg-do compile } */
/* { dg-options "-O2 -ffast-math -mrecip -mlasx -mfrecipe" } */
/* { dg-final { scan-assembler "xvfrecipe.s" } } */

float a[8],b[8],c[8];

void
foo ()
{
  for (int i = 0; i < 8; i++)
    c[i] = a[i] / b[i];
}
