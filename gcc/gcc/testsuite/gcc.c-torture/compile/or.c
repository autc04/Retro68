/* { dg-additional-options "-std=gnu89" } */

foo (a)
{
  return a | 0xffff0101;
}
