/* PR target/91400 */
/* { dg-do compile } */
/* { dg-options "-O2" } */
/* { dg-final { scan-assembler-times "notl" 1 } } */
/* { dg-final { scan-assembler-times "testb" 1 } } */
/* { dg-final { scan-assembler-times "sete" 1 } } */
/* { dg-final { scan-assembler-not "cmove" } } */

_Bool
f (void)
{
  return __builtin_cpu_supports("avx512vnni")
	 && __builtin_cpu_supports("3dnow");
}
