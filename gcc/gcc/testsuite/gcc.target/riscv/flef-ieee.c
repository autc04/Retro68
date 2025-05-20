/* { dg-do compile } */
/* { dg-require-effective-target hard_float } */
/* { dg-options "-march=rv64gc -mabi=lp64d  -fno-finite-math-only -ftrapping-math -fno-signaling-nans" { target { rv64 } } } */
/* { dg-options "-march=rv32gc -mabi=ilp32f -fno-finite-math-only -ftrapping-math -fno-signaling-nans" { target { rv32 } } } */

long
flef (float x, float y)
{
  return __builtin_islessequal (x, y);
}

/* { dg-final { scan-assembler "\tfrflags\t(\[^\n\]*)\n\tfle\\.s\t\[^\n\]*\n\tfsflags\t\\1\n" } } */
/* { dg-final { scan-assembler-not {\msnez} } } */
