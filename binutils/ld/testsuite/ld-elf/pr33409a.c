#include <stdio.h>

extern char *array[];

char **
foo (void)
{
  return array;
}

extern void bar (void);

int
main()
{
  char **p = foo ();
  bar ();
  printf ("%s\n", p[0]);
  return 0;
}
