/* Test for target attribute assembly extension generations.  */
/* { dg-do compile } */
/* { dg-require-effective-target arm_arch_v8a_ok } */
/* { dg-add-options arm_arch_v8a } */
/* { dg-additional-options "-std=gnu99" } */

#include <stdint.h>

extern uint32_t bar();

__attribute__((target("arch=armv8-a+simd+crc"))) uint32_t crc32cw(uint32_t crc, uint32_t val)
{
    uint32_t res;
    asm("crc32cw %0, %1, %2" : "=r"(res) : "r"(crc), "r"(val));
    return res;
}

uint32_t restored ()
{
  return bar();
}

/* { dg-final { scan-assembler-times {\.arch\s+armv8-a} 3 } } */
/* { dg-final { scan-assembler-times {\.arch_extension\s+crc} 1 } } */

