/* { dg-do run } */

typedef unsigned long int_t;

__attribute__ ((noinline)) int_t
addlgeu (int_t w, int_t x, int_t y, int_t z)
{
  return w >= x ? y + z : y;
}

int
main (void)
{
  if (addlgeu (-1L, -1L, 12L, 23L) != 35L)
    return 1;
  if (addlgeu (-1L, 3L, 12L, 23L) != 35L)
    return 1;
  if (addlgeu (1L, 3L, 12L, 23L) != 12L)
    return 1;
  if (addlgeu (3L, 3L, 12L, 23L) != 35L)
    return 1;
  if (addlgeu (5L, 3L, 12L, 23L) != 35L)
    return 1;
  if (addlgeu (3L, -1L, 12L, 23L) != 12L)
    return 1;
  if (addlgeu (3L, 1L, 12L, 23L) != 35L)
    return 1;
  if (addlgeu (3L, 5L, 12L, 23L) != 12L)
    return 1;
  return 0;
}
