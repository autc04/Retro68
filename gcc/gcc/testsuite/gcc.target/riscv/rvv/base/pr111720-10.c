/* { dg-do compile } */
/* { dg-options "-O3 -march=rv64gcv -mabi=lp64d -ftree-vectorize -mrvv-vector-bits=zvl" } */

#include "riscv_vector.h"

vbool4_t test () {
  uint8_t arr[32] = {
    1, 2, 7, 1, 3, 4, 5, 3,
    1, 0, 1, 2, 4, 4, 9, 9,
    1, 2, 7, 1, 3, 4, 5, 3,
    1, 0, 1, 2, 4, 4, 9, 9,
  };

  return __riscv_vlm_v_b4(arr, 32);
}

/* { dg-final { scan-assembler-not {vle[0-9]+\.v\s+v[0-9]+,\s*[0-9]+\(sp\)} } } */
/* { dg-final { scan-assembler-not {vs[0-9]+r\.v\s+v[0-9]+,\s*[0-9]+\(sp\)} } } */
