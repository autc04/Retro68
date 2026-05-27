#include <stdio.h>

extern void bar (void);

void foo(void)
{
  bar ();
  printf ("hello foo\n");
}
