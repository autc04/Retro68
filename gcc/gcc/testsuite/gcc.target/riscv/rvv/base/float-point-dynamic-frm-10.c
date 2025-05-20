/* { dg-do compile } */
/* { dg-options "-march=rv64gcv -mabi=lp64 -O3" } */

#include "riscv_vector.h"

vfloat32m1_t
test_float_point_dynamic_frm (vfloat32m1_t op1, vfloat32m1_t op2,
			      int count, size_t vl)
{
  vfloat32m1_t result = op1;

  for (int i = 0; i < count; i++)
    {
      result = __riscv_vfadd_vv_f32m1 (result, op2, vl);
      result = __riscv_vfadd_vv_f32m1_rm (result, op2, 1, vl);
      result = __riscv_vfadd_vv_f32m1_rm (result, op2, 3, vl);
    }

  return result;
}

/* { dg-final { scan-assembler-times {vfadd\.v[vf]\s+v[0-9]+,\s*v[0-9]+,\s*[fav]+[0-9]+} 3 } } */
/* { dg-final { scan-assembler-times {frrm\s+[axs][0-9]+} 1 } } */
/* { dg-final { scan-assembler-times {fsrmi\s+[01234]} 2 } } */
/* { dg-final { scan-assembler-times {fsrm\s+[axs][0-9]+} 2 } } */
/* { dg-final { scan-assembler-not {fsrmi\s+[axs][0-9]+,\s*[01234]} } } */
