int g1;
int g2;

void
foo (void)
{
  int i = 1;
  int x;

  x = g1;
  (*(&g1 + i - 1)) = x + 1;
  x = g1;
  (*(&g1 + i - 1)) = x + 1;
  g1++;
}
