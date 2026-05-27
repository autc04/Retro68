extern int foo (void);
extern int foo_base (void);
extern void bar (void);

int
foo (void)
{
  return 1;
}

int
foo_base (void)
{
  bar ();
  return 0;
}

asm (".symver foo_base, foo@");
