/* { dg-do compile { target i?86-*-* x86_64-*-* } } */

extern void foo (void);
extern void bad (void);
extern int bar (int);

void
__attribute__ ((no_callee_saved_registers))
bar0 (int i0, int i1, int i2, int i3, int i4, int i5, int i6,
      int i7, int i8)
{
  if (i0 != 0)
     bad ();

  if (i1 != 1)
     bad ();

  if (i2 != 2)
     bad ();

  if (i3 != 3)
     bad ();

  if (i4 != 4)
     bad ();

  if (i5 != 5)
     bad ();

  if (i6 != 6)
     bad ();

  if (i7 != 7)
     bad ();

  if (i8 != 8)
     bad ();

  int a,b,c,d,e,f,i;
  a = bar (5);
  b = bar (a);
  c = bar (b);
  d = bar (c);
  e = bar (d);
  f = bar (e);
  for (i = 1; i < 10; i++)
  {
    a += bar (a + i) + bar (b + i) +
	 bar (c + i) + bar (d + i) +
	 bar (e + i) + bar (f + i);
  }
}

int
main ()
{
  foo ();
  return 0;
}
