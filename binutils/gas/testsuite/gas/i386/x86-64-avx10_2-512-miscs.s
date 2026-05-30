# Check 64bit AVX10.2/512 instructions

	.arch generic64
	.arch .avx10.2/512
	.text
_start:
	.irp m, bf16, pd, ph, ps
	vminmax\m	$123, %zmm28, %zmm29, %zmm30
	vminmax\m	$123, 0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vminmax\m	$123, 8128(%rcx), %zmm29, %zmm30
	.endr

	vminmaxbf16	$123, (%r9){1to32}, %zmm29, %zmm30
	vminmaxbf16	$123, -256(%rdx){1to32}, %zmm29, %zmm30{%k7}{z}
	vminmaxpd	$123, {sae}, %zmm28, %zmm29, %zmm30
	vminmaxpd	$123, (%r9){1to8}, %zmm29, %zmm30
	vminmaxpd	$123, -1024(%rdx){1to8}, %zmm29, %zmm30{%k7}{z}
	vminmaxph	$123, {sae}, %zmm28, %zmm29, %zmm30
	vminmaxph	$123, (%r9){1to32}, %zmm29, %zmm30
	vminmaxph	$123, -256(%rdx){1to32}, %zmm29, %zmm30{%k7}{z}
	vminmaxps	$123, {sae}, %zmm28, %zmm29, %zmm30
	vminmaxps	$123, (%r9){1to16}, %zmm29, %zmm30
	vminmaxps	$123, -512(%rdx){1to16}, %zmm29, %zmm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	.irp m, bf16, pd, ph, ps
	vminmax\m	zmm30, zmm29, zmm28, 123
	vminmax\m	zmm30{k7}, zmm29, [rbp+r14*8+0x10000000], 123
	vminmax\m	zmm30, zmm29, ZMMWORD PTR [rcx+8128], 123
	.endr

	vminmaxbf16	zmm30, zmm29, [r9]{1to32}, 123
	vminmaxbf16	zmm30{k7}{z}, zmm29, WORD PTR [rdx-256]{1to32}, 123
	vminmaxpd	zmm30, zmm29, zmm28, {sae}, 123
	vminmaxpd	zmm30, zmm29, QWORD PTR [r9]{1to8}, 123
	vminmaxpd	zmm30{k7}{z}, zmm29, [rdx-1024]{1to8}, 123
	vminmaxph	zmm30, zmm29, zmm28, {sae}, 123
	vminmaxph	zmm30, zmm29, WORD PTR [r9]{1to32}, 123
	vminmaxph	zmm30{k7}{z}, zmm29, [rdx-256]{1to32}, 123
	vminmaxps	zmm30, zmm29, zmm28, {sae}, 123
	vminmaxps	zmm30, zmm29, [r9]{1to16}, 123
	vminmaxps	zmm30{k7}{z}, zmm29, DWORD PTR [rdx-512]{1to16}, 123
