/* PR tree-optimization/88464 */
/* { dg-do compile } */
/* { dg-options "-O3 -mavx512f -mprefer-vector-width=512 -mtune=skylake-avx512 -fdump-tree-vect-details -mgather" } */
/* { dg-final { scan-tree-dump-times "loop vectorized using 64 byte vectors" 4 "vect" } } */
/* { dg-final { scan-tree-dump-times "vectorized 1 loops in function" 4 "vect" } } */

__attribute__((noipa)) void
f1 (long long * __restrict__ a, const long long * __restrict__ b, const int * __restrict__ c, int n)
{
  int i;
#pragma GCC ivdep
  for (i = 0; i < n; ++i)
    if (b[i] > -2)
      a[c[i]] = b[i];
}

__attribute__((noipa)) void
f2 (long long * __restrict__ a, const long long * __restrict__ b, const long * __restrict__ c, int n)
{
  int i;
#pragma GCC ivdep
  for (i = 0; i < n; ++i)
    if (b[i] > -2)
      a[c[i]] = b[i];
}

__attribute__((noipa)) void
f3 (int * __restrict__ a, const int * __restrict__ b, const int * __restrict__ c, int n)
{
  int i;
#pragma GCC ivdep
  for (i = 0; i < n; ++i)
    if (b[i] > -2)
      a[c[i]] = b[i];
}

__attribute__((noipa)) void
f4 (int * __restrict__ a, const int * __restrict__ b, const long * __restrict__ c, int n)
{
  int i;
#pragma GCC ivdep
  for (i = 0; i < n; ++i)
    if (b[i] > -2)
      a[c[i]] = b[i];
}
