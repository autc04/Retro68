#include <stdio.h>

int x;

__attribute__((weak))
void foobar (void) { x++; }

int main (void)
{
  foobar ();
  if (x == -1)
    printf ("OK\n");
  return 0;
}
