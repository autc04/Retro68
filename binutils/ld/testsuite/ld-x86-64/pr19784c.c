#include <stdio.h>

extern void abort (void);
extern int foo (int) __attribute__ ((visibility("hidden")));

int bar()
{
  if (foo (5) != 5)
    abort ();
  printf("PASS\n");
}
