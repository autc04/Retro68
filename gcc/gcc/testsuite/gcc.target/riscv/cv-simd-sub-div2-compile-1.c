/* { dg-do compile } */
/* { dg-require-effective-target cv_simd } */
/* { dg-options "-march=rv32i_xcvsimd -mabi=ilp32" } */

int
foo1 (int a, int b)
{
	return __builtin_riscv_cv_simd_sub_h(a, b, 1);
}

/* { dg-final { scan-assembler-times "cv\\.sub\\.div2" 1 } } */
