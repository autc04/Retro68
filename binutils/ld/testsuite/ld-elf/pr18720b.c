#include <stdio.h>

void
foo (void)
{
  printf ("MAIN\n");
}

asm (".symver foo,foo@FOO");
asm (".set foo_alias,foo");
asm (".global foo_alias");
#if defined __powerpc64__ && defined _CALL_AIXDESC && !defined _CALL_LINUX
asm (".symver .foo,.foo@FOO");
asm (".set .foo_alias,.foo");
asm (".global .foo_alias");
#endif
