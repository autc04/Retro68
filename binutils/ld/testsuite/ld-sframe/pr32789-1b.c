static int bar_var = 2;

int bar(void)
{
  return 20;
}

void bar2(void)
{
  bar_var++;
  bar ();
}
