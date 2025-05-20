/* { dg-do run } */

typedef int int_t;

__attribute__ ((noinline)) int_t
addieq (int_t w, int_t x, int_t y, int_t z)
{
  return w == x ? y + z : y;
}

int
main (void)
{
  if (addieq (-1, -1, 12, 23) != 35)
    return 1;
  if (addieq (-1, 3, 12, 23) != 12)
    return 1;
  if (addieq (1, 3, 12, 23) != 12)
    return 1;
  if (addieq (3, 3, 12, 23) != 35)
    return 1;
  if (addieq (5, 3, 12, 23) != 12)
    return 1;
  if (addieq (3, -1, 12, 23) != 12)
    return 1;
  if (addieq (3, 1, 12, 23) != 12)
    return 1;
  if (addieq (3, 5, 12, 23) != 12)
    return 1;
  return 0;
}
