/* { dg-do run } */

typedef long int_t;

__attribute__ ((noinline)) int_t
movlfne (double w, double x, int_t y, int_t z)
{
  return w != x ? y : z;
}

int
main (void)
{
  if (movlfne (-1.0, -1.0, 12L, 23L) != 23L)
    return 1;
  if (movlfne (-1.0, 3.0, 12L, 23L) != 12L)
    return 1;
  if (movlfne (1.0, 3.0, 12L, 23L) != 12L)
    return 1;
  if (movlfne (3.0, 3.0, 12L, 23L) != 23L)
    return 1;
  if (movlfne (5.0, 3.0, 12L, 23L) != 12L)
    return 1;
  if (movlfne (3.0, -1.0, 12L, 23L) != 12L)
    return 1;
  if (movlfne (3.0, 1.0, 12L, 23L) != 12L)
    return 1;
  if (movlfne (3.0, 5.0, 12L, 23L) != 12L)
    return 1;
  return 0;
}
