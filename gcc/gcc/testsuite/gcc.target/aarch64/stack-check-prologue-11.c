/* { dg-do compile } */
/* { dg-options "-O2 -fstack-clash-protection --param stack-clash-protection-guard-size=16 -fno-stack-protector" } */
/* { dg-require-effective-target supports_stack_clash_protection } */

#define SIZE (6 * 64 * 1024) + (1 * 32 * 1024)
#include "stack-check-prologue.h"

/* { dg-final { scan-assembler-times {str\s+xzr, \[sp, 1024\]} 1 } } */

/* SIZE is more than 4x guard-size and remainder larger than guard-size - 1Kb,
   1 probe expected in a loop and 1 residual probe.  */
