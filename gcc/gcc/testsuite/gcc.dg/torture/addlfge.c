/* { dg-do run } */

typedef long int_t;

__attribute__ ((noinline)) int_t
addlfge (double w, double x, int_t y, int_t z)
{
  return w >= x ? y + z : y;
}

int
main (void)
{
  if (addlfge (-1.0, -1.0, 12L, 23L) != 35L)
    return 1;
  if (addlfge (-1.0, 3.0, 12L, 23L) != 12L)
    return 1;
  if (addlfge (1.0, 3.0, 12L, 23L) != 12L)
    return 1;
  if (addlfge (3.0, 3.0, 12L, 23L) != 35L)
    return 1;
  if (addlfge (5.0, 3.0, 12L, 23L) != 35L)
    return 1;
  if (addlfge (3.0, -1.0, 12L, 23L) != 35L)
    return 1;
  if (addlfge (3.0, 1.0, 12L, 23L) != 35L)
    return 1;
  if (addlfge (3.0, 5.0, 12L, 23L) != 12L)
    return 1;
  return 0;
}
