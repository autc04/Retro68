/* { dg-do run } */
/* { dg-options "-O1 -fdump-tree-dce" } */

#include <stdint.h>

__attribute__((noinline, noipa))
void fun1(uint32_t *x, int n)
{
    for (int i = 0; i < (n & -16); i++)
      x[i] = (x[i]&(~255)) != 0;
}

__attribute__((noinline, noipa, optimize("O0")))
void fun2(uint32_t *x, int n)
{
    for (int i = 0; i < (n & -16); i++)
      x[i] = (x[i]&(~255)) != 0;
}

#include "bic-bitmask.h"

/* { dg-final { scan-tree-dump {>\s* 255} dce7 { target vect_int } } } */
/* { dg-final { scan-tree-dump-not {&\s* 4294967290} dce7 { target vect_int } } } */

