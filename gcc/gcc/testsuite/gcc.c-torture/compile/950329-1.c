/* { dg-require-effective-target untyped_assembly } */
/* { dg-additional-options "-std=gnu89" } */

f ()
{
  int i;
  for (i = 1;; i = 0)
    {
      if (h ())
	{
	  if (i)
	    g ();
	  g (h ());
	  g (h ());
	}
      else
	{
	  g ();
	  break;
	}
    }
}
