/* { dg-require-effective-target vect_simd_clones } */
/* { dg-additional-options "-fopenmp-simd" } */
/* { dg-additional-options "-mavx2" { target avx2_runtime } } */

#include "tree-vect.h"

int x[1024];

#pragma omp declare simd simdlen(4) inbranch
__attribute__((noinline)) int
foo (int a, int b)
{
  return a + b;
}

void __attribute__((noipa))
bar (void)
{
#pragma omp simd
  for (int i = 0; i < 512; i++)
    {
      if (x[2*i+0] < 10)
	x[2*i+0] = foo (x[2*i+0], x[2*i+0]);
      if (x[2*i+1] < 20)
	x[2*i+1] = foo (x[2*i+1], x[2*i+1]);
    }
}

int
main ()
{
  int i;
  check_vect ();

#pragma GCC novector
  for (i = 0; i < 1024; i++)
    x[i] = i;

  bar ();

#pragma GCC novector
  for (i = 0; i < 1024; i++)
    {
      if (((i & 1) && i < 20)
	  || (!(i & 1) && i < 10))
	{
	  if (x[i] != i + i)
	    abort ();
	}
      else if (x[i] != i)
	abort ();
    }

  return 0;
}

/* { dg-final { scan-tree-dump "vectorizing stmts using SLP" "vect" { target avx2_runtime } } } */
