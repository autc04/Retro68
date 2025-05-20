/* { dg-do compile { target { riscv64*-*-* } } } */
/* { dg-options "-march=rv64gc -mabi=lp64" } */
/* { dg-skip-if "" { *-*-* } { "-O0" } } */
int a, b, e;
struct c *d;
struct c
{
  int bins;
  int binmap[10];
}
f(void)
{
  for (;;)
    {
      e = (unsigned) a >> 3;
      b = (long) &d[e];
      if (b)
	d->binmap[0] = e;
    }
}
/* { dg-final { scan-assembler-times {\msext\.w\M} 0 } } */
