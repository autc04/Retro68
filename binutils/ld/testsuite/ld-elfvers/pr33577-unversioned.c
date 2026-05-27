extern int foo (void);
extern void bar (void);

int
foo (void)
{
  bar ();
  return 0;
}
