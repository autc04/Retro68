/* { dg-do run } */

typedef long int_t;

__attribute__ ((noinline)) int_t
movleq (int_t w, int_t x, int_t y, int_t z)
{
  return w == x ? y : z;
}

int
main (void)
{
  if (movleq (-1L, -1L, 12L, 23L) != 12L)
    return 1;
  if (movleq (-1L, 3L, 12L, 23L) != 23L)
    return 1;
  if (movleq (1L, 3L, 12L, 23L) != 23L)
    return 1;
  if (movleq (3L, 3L, 12L, 23L) != 12L)
    return 1;
  if (movleq (5L, 3L, 12L, 23L) != 23L)
    return 1;
  if (movleq (3L, -1L, 12L, 23L) != 23L)
    return 1;
  if (movleq (3L, 1L, 12L, 23L) != 23L)
    return 1;
  if (movleq (3L, 5L, 12L, 23L) != 23L)
    return 1;
  return 0;
}
