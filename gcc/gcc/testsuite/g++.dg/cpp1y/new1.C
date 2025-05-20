/* { dg-do compile } */
/* { dg-options "-O2 -fdump-tree-cddce-details -fdelete-null-pointer-checks" } */

#include <stdlib.h>

void
new_without_use() {
  int *x = new int;
}

void
new_array_without_use() {
  int *x = new int[5];
}

void
new_primitive() {
  int *x = new int;
  delete x;
}

void
new_array() {
  int *x = new int[10];
  delete [] x;
}

void
new_primitive_store() {
  int *x = new int;
  *x = 10;
  delete x;
}

void
new_primitive_load() {
  int *x = new int;
  int tmp = *x;
  delete x;
}

int
new_primitive_load_with_use() {
  int *x = new int;
  int tmp = *x;
  delete x;
  return tmp;
}

void
new_array_store() {
  int *x = new int[10];
  x[4] = 10;
  delete [] x;
}

void
new_array_load() {
  int *x = new int[10];
  int tmp = x[4];
  delete [] x;
}

void
test_unused() {
  volatile double d = 0.0;
  double *p = new double ();
  d += 1.0;
  delete p;
}

/* { dg-final { scan-tree-dump-times "Deleting : operator delete" 6 "cddce1"} } */
/* { dg-final { scan-tree-dump-times "Deleting : _\\d+ = operator new" 8 "cddce1"} } */
