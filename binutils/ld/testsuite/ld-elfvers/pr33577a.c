#include <stdio.h>

extern int foo (void);
extern void bar (void);

void
bar (void)
{
}

int
main ()
{
  if (foo () == 0)
    printf ("PASS\n");
  return 0;
}
