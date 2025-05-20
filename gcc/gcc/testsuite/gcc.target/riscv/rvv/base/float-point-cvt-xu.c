/* { dg-do compile } */
/* { dg-options "-march=rv64gcv -mabi=lp64 -O3" } */

#include "riscv_vector.h"

vuint32m1_t
test_riscv_vfcvt_xu_f_v_u32m1_rm (vfloat32m1_t op1, size_t vl) {
  return __riscv_vfcvt_xu_f_v_u32m1_rm (op1, 0, vl);
}

vuint32m1_t
test_vfcvt_xu_f_v_u32m1_rm_m (vbool32_t mask, vfloat32m1_t op1, size_t vl) {
  return __riscv_vfcvt_xu_f_v_u32m1_rm_m (mask, op1, 1, vl);
}

vuint32m1_t
test_riscv_vfcvt_xu_f_vv_u32m1 (vfloat32m1_t op1, size_t vl) {
  return __riscv_vfcvt_xu_f_v_u32m1 (op1, vl);
}

vuint32m1_t
test_vfcvt_xu_f_v_u32m1_m (vbool32_t mask, vfloat32m1_t op1, size_t vl) {
  return __riscv_vfcvt_xu_f_v_u32m1_m (mask, op1, vl);
}

/* { dg-final { scan-assembler-times {vfcvt\.xu\.f\.v\s+v[0-9]+,\s*v[0-9]+} 4 } } */
/* { dg-final { scan-assembler-times {frrm\s+[axs][0-9]+} 2 } } */
/* { dg-final { scan-assembler-times {fsrm\s+[axs][0-9]+} 2 } } */
/* { dg-final { scan-assembler-times {fsrmi\s+[01234]} 2 } } */
