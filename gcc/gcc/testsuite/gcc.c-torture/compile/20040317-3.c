/* { dg-additional-options "-std=gnu89" } */

I_wacom ()
{
  char buffer[50], *p;
  int RequestData (char *cmd)
  {
    p = buffer;
    foo (buffer);
  }
  RequestData (0);
}

