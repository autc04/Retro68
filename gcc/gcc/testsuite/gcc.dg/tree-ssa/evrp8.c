/* { dg-do compile } */
/* { dg-options "-O2 -fdump-tree-evrp-details" } */

int foo(int i)
{
  if (i < 0 || i >= 5)
    return i == 1;
  return 1;
}

/* { dg-final { scan-tree-dump "Removing dead stmt:\[^\r\n\]* = i_.* == 1" "evrp" } } */
