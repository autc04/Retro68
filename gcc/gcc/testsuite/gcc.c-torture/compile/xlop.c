/* { dg-additional-options "-std=gnu89" } */

foo (a)
{
  int b;
  do
    {
      b = bar ();
      a = b - 10;
    }
  while (a > 10);
  return a;
}
