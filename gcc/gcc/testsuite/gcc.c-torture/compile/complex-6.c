/* PR tree-opt/35737 */
/* { dg-require-effective-target indirect_jumps } */

long buf[10];
void bar (void);

int foo()
{
  __complex__ int i = 0;

  if (__builtin_setjmp(buf))
  {
    i = 1;
    bar();
  }

  return i == 0;
}

