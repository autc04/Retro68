/* { dg-do compile } */
/* { dg-options "-march=rv64gcv -mabi=lp64d -O3" } */

#include "riscv_vector.h"

void f (uint16_t *base,uint8_t *out,size_t vl, size_t shift)
{
    vuint16m2_t src = __riscv_vle16_v_u16m2 (base, vl);
    vuint8m1_t v = __riscv_vnclipu_wx_u8m1(src,shift,10,vl); /* { dg-error {passing 10 to argument 3 of '__riscv_vnclipu_wx_u8m1', which expects a value in the range \[0, 3\]} } */
    __riscv_vse8_v_u8m1 (out,v,vl);
}
