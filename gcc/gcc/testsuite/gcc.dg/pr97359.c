/* { dg-do compile } */
/* { dg-options "-O2 -Wno-pointer-to-int-cast" } */

typedef unsigned int uint32_t;
int a;
void b(uint32_t c) {
  uint32_t *d = &c;
  for (; a;)
    for (;; (*d %= a) / (*d > 1 > (c > 0)) ?: (int) d)
      ;
}
