/* { dg-do compile } */
/* { dg-options "-O2 -fdump-tree-optimized" } */
/* PR tree-optimization/110155 */

int f1(unsigned int x, unsigned int y, unsigned int z)
{
  return ((x & 1) == 0) ? y : z + y;
}

int f2(unsigned int x, unsigned int y, unsigned int z)
{
  return ((x & 1) != 0) ? z + y : y;
}

/* { dg-final { scan-tree-dump-times " \\\*" 2 "optimized" } } */
/* { dg-final { scan-tree-dump-times " \\\+ " 2 "optimized" } } */
/* { dg-final { scan-tree-dump-times " & " 2 "optimized" } } */
/* { dg-final { scan-tree-dump-not "if " "optimized" } } */
