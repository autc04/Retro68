/* { dg-additional-options "-std=gnu89" } */

foo (a, b)
{
  return a % (1 << b);
}
