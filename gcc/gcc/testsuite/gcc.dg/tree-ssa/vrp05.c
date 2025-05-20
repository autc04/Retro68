/* { dg-do compile } */
/* { dg-options "-O2 -fdump-tree-vrp1 -fno-early-inlining -fno-thread-jumps -fno-ipa-vrp" } */


inline int ten()
{
  return 10;
}
inline int zero()
{
  return 0;
}

int
foo (int k, int j)
{
  if (k >= ten())
    {
      if (j > k)
	{
	  /* We should fold this to if (1).  */
	  if (j > zero())
	    return j;
	}
    }

  return j+1;
}

/* { dg-final { scan-tree-dump-times "Folding predicate j_.*to 1" 1 "vrp1" } } */
