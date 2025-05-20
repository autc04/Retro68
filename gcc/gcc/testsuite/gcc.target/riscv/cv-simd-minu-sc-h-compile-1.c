/* { dg-do compile } */
/* { dg-require-effective-target cv_simd } */
/* { dg-options "-march=rv32i_xcvsimd -mabi=ilp32" } */

int
foo1 (int a, int b)
{
	return __builtin_riscv_cv_simd_minu_sc_h(a, b);
}

int
foo2 (int a)
{
	return __builtin_riscv_cv_simd_minu_sc_h(a, 0);
}

int
foo3 (int a)
{
	return __builtin_riscv_cv_simd_minu_sc_h(a, 63);
}

/* { dg-final { scan-assembler-times "cv\\.minu\\.sc\\.h" 1 } } */
/* { dg-final { scan-assembler-times "cv\\.minu\\.sci\\.h" 2 } } */
