/* { dg-additional-options "-fpermissive" } */
int a[251];
__attribute__ ((noinline))
t(int i)
{
  if (i==0)
    exit(0);
  if (i>255)
    abort ();
}
main()
{
  unsigned int i;
  for (i=0;;i++)
    {
      a[i]=t((unsigned char)(i+5));
    }
}
