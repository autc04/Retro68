# Check 32bit AVX10.2/512 instructions

	.arch generic32
	.arch .avx10.2/512
	.text
_start:
	.irp m, bf16, pd, ph, ps
	vminmax\m	$123, %zmm4, %zmm5, %zmm6
	vminmax\m	$123, 0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vminmax\m	$123, 8128(%ecx), %zmm5, %zmm6
	.endr

	vminmaxbf16	$123, (%ecx){1to32}, %zmm5, %zmm6
	vminmaxbf16	$123, -256(%edx){1to32}, %zmm5, %zmm6{%k7}{z}
	vminmaxpd	$123, {sae}, %zmm4, %zmm5, %zmm6
	vminmaxpd	$123, (%ecx){1to8}, %zmm5, %zmm6
	vminmaxpd	$123, -1024(%edx){1to8}, %zmm5, %zmm6{%k7}{z}
	vminmaxph	$123, {sae}, %zmm4, %zmm5, %zmm6
	vminmaxph	$123, (%ecx){1to32}, %zmm5, %zmm6
	vminmaxph	$123, -256(%edx){1to32}, %zmm5, %zmm6{%k7}{z}
	vminmaxps	$123, {sae}, %zmm4, %zmm5, %zmm6
	vminmaxps	$123, (%ecx){1to16}, %zmm5, %zmm6
	vminmaxps	$123, -512(%edx){1to16}, %zmm5, %zmm6{%k7}{z}

_intel:
	.intel_syntax noprefix
	.irp m, bf16, pd, ph, ps
	vminmax\m	zmm6, zmm5, zmm4, 123
	vminmax\m	zmm6{k7}, zmm5, [esp+esi*8+0x10000000], 123
	vminmax\m	zmm6, zmm5, ZMMWORD PTR [ecx+8128], 123
	.endr

	vminmaxbf16	zmm6, zmm5, [ecx]{1to32}, 123
	vminmaxbf16	zmm6{k7}{z}, zmm5, WORD PTR [edx-256]{1to32}, 123
	vminmaxpd	zmm6, zmm5, zmm4, {sae}, 123
	vminmaxpd	zmm6, zmm5, QWORD PTR [ecx]{1to8}, 123
	vminmaxpd	zmm6{k7}{z}, zmm5, [edx-1024]{1to8}, 123
	vminmaxph	zmm6, zmm5, zmm4, {sae}, 123
	vminmaxph	zmm6, zmm5, WORD PTR [ecx]{1to32}, 123
	vminmaxph	zmm6{k7}{z}, zmm5, [edx-256]{1to32}, 123
	vminmaxps	zmm6, zmm5, zmm4, {sae}, 123
	vminmaxps	zmm6, zmm5, [ecx]{1to16}, 123
	vminmaxps	zmm6{k7}{z}, zmm5, DWORD PTR [edx-512]{1to16}, 123
