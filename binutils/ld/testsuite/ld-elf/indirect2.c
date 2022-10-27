extern void foo (void);

asm (".symver foo,foo@@@FOO");
#if defined __powerpc64__ && defined _CALL_AIXDESC && !defined _CALL_LINUX
asm (".symver .foo,.foo@@@FOO");
#endif

void
bar (void)
{
  foo ();
}
