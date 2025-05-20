void abort (void);
void exit (int);

struct foo
{
  unsigned half:16;
  unsigned long whole:32 __attribute__ ((packed));
};

void
f (struct foo *q)
{
  if (q->half != 0x1234)
    abort ();
  if (q->whole != 0x56789abcL)
    abort ();
}

int
main (void)
{
  struct foo bar;

  bar.half = 0x1234;
  bar.whole = 0x56789abcL;
  f (&bar);
  exit (0);
}
