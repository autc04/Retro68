static int a = 0;

extern int bar(void);

__attribute__((section((".text.init"))))
int foo_init(void)
{
  return 10;
}

void foo (void)
{
  foo_init ();
  a++;
  bar ();
}

__attribute__((section((".text.exit"))))
void foo_exit(void)
{
  foo ();
}
