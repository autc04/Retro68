/* { dg-do compile } */
/* { dg-options "-O2 -fdump-tree-optimized" } */

#include <limits.h>

_Bool and1(unsigned *x, unsigned *y)
{
  /* x <= y && x == 0 --> x == 0 */
  return x <= y && x == 0;
}

_Bool and2(unsigned *x, unsigned *y)
{
  /* x >= y && x == -1 --> x == -1 */
  return x >= y && x == (unsigned*)-1;
}


/* { dg-final { scan-tree-dump-not " <= " "optimized" } } */
/* { dg-final { scan-tree-dump-not " >= " "optimized" } } */
