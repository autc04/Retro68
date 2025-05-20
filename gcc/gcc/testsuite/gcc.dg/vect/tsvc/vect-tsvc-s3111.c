/*  This file is distributed under the University of Illinois Open Source
    License. See license.txt for details.  */

/* { dg-additional-options "--param vect-epilogues-nomask=0" } */
/* { dg-require-effective-target vect_float } */

#include "tsvc.h"

real_t s3111(struct args_t * func_args)
{
//    reductions
//    conditional sum reduction

    initialise_arrays(__func__);

    real_t sum;
    for (int nl = 0; nl < iterations/2; nl++) {
        sum = 0.;
        for (int i = 0; i < LEN_1D; i++) {
            if (a[i] > (real_t)0.) {
                sum += a[i];
            }
        }
        dummy(a, b, c, d, e, aa, bb, cc, sum);
    }

    return sum;
}

int main (int argc, char **argv)
{
  int n1 = 1;
  int n3 = 1;
  int* ip;
  real_t s1,s2;
  init(&ip, &s1, &s2);

  run(&s3111, "s31111", NULL);

  return 0;
}


/* { dg-final { scan-tree-dump "vectorized 1 loops" "vect" { xfail { { ! aarch64_sve } && { ! riscv_v } }  } } } */
