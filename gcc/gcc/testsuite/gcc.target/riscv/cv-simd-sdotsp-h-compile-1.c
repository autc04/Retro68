/* { dg-do compile } */
/* { dg-require-effective-target cv_simd } */
/* { dg-options "-march=rv32i_xcvsimd -mabi=ilp32" } */

int
foo1 (int a, int b, int c)
{
	return __builtin_riscv_cv_simd_sdotsp_h(a, b, c);
}

/* { dg-final { scan-assembler-times "cv\\.sdotsp\\.h" 1 } } */
