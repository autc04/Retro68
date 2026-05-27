/*
 * Test program that goes with test7.so
 */

extern int hide_a(int e);
extern int show_b(int e);

int
main()
{
  return hide_a(1) + show_b(1);
  return 0;
}
