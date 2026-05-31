# Check 32bit AVX10.2/512 instructions

	.arch generic32
	.arch .avx10.2/512
	.text
_start:
	.irp m, add, div, max, min, mul, scalef, sub
	v\m\()bf16	%zmm4, %zmm5, %zmm6
	v\m\()bf16	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	v\m\()bf16	(%ecx){1to32}, %zmm5, %zmm6
	v\m\()bf16	8128(%ecx), %zmm5, %zmm6
	v\m\()bf16	-256(%edx){1to32}, %zmm5, %zmm6{%k7}{z}
	.endr

	.irp m, madd, msub, nmadd, nmsub
	.irp n, 132, 213, 231
	vf\m\n\(\())bf16	%zmm4, %zmm5, %zmm6
	vf\m\n\(\())bf16	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vf\m\n\(\())bf16	(%ecx){1to32}, %zmm5, %zmm6
	vf\m\n\(\())bf16	8128(%ecx), %zmm5, %zmm6
	vf\m\n\(\())bf16	-256(%edx){1to32}, %zmm5, %zmm6{%k7}{z}
	.endr
	.endr

	.irp m, getexp, rcp, rsqrt, sqrt
	v\m\()bf16	%zmm5, %zmm6
	v\m\()bf16	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	v\m\()bf16	(%ecx){1to32}, %zmm6
	v\m\()bf16	8128(%ecx), %zmm6
	v\m\()bf16	-256(%edx){1to32}, %zmm6{%k7}{z}
	.endr

	.irp m, getmant, reduce, rndscale
	v\m\()bf16	$123, %zmm5, %zmm6
	v\m\()bf16	$123, 0x10000000(%esp, %esi, 8), %zmm6{%k7}
	v\m\()bf16	$123, (%ecx){1to32}, %zmm6
	v\m\()bf16	$123, 8128(%ecx), %zmm6
	v\m\()bf16	$123, -256(%edx){1to32}, %zmm6{%k7}{z}
	.endr

	vcmpbf16	$123, %zmm4, %zmm5, %k5
	vcmpbf16	$123, 0x10000000(%esp, %esi, 8), %zmm5, %k5{%k7}
	vcmpbf16	$123, (%ecx){1to32}, %zmm5, %k5
	vcmpbf16	$123, 8128(%ecx), %zmm5, %k5
	vcmpbf16	$123, -256(%edx){1to32}, %zmm5, %k5{%k7}

	vfpclassbf16	$123, %zmm5, %k5
	vfpclassbf16z	$123, 0x10000000(%esp, %esi, 8), %k5{%k7}
	vfpclassbf16	$123, (%ecx){1to32}, %k5
	vfpclassbf16z	$123, 8128(%ecx), %k5
	vfpclassbf16	$123, -256(%edx){1to32}, %k5{%k7}

_intel:
	.intel_syntax noprefix
	.irp m, add, div, max, min, mul, scalef, sub
	v\m\()bf16	zmm6, zmm5, zmm4
	v\m\()bf16	zmm6{k7}, zmm5, [esp+esi*8+0x10000000]
	v\m\()bf16	zmm6, zmm5, [ecx]{1to32}
	v\m\()bf16	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	v\m\()bf16	zmm6{k7}{z}, zmm5, WORD PTR [edx-256]{1to32}
	.endr

	.irp m, madd, msub, nmadd, nmsub
	.irp n, 132, 213, 231
	vf\m\n\(\())bf16	zmm6, zmm5, zmm4
	vf\m\n\(\())bf16	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vf\m\n\(\())bf16	zmm6, zmm5, WORD PTR [ecx]{1to32}
	vf\m\n\(\())bf16	zmm6, zmm5, [ecx+8128]
	vf\m\n\(\())bf16	zmm6{k7}{z}, zmm5, [edx-256]{1to32}
	.endr
	.endr

	.irp m, getexp, rcp, rsqrt, sqrt
	v\m\()bf16	zmm6, zmm5
	v\m\()bf16	zmm6{k7}, [esp+esi*8+0x10000000]
	v\m\()bf16	zmm6, [ecx]{1to32}
	v\m\()bf16	zmm6, ZMMWORD PTR [ecx+8128]
	v\m\()bf16	zmm6{k7}{z}, WORD PTR [edx-256]{1to32}
	.endr

	.irp m, getmant, reduce, rndscale
	v\m\()bf16	zmm6, zmm5, 123
	v\m\()bf16	zmm6{k7}, ZMMWORD PTR [esp+esi*8+0x10000000], 123
	v\m\()bf16	zmm6, WORD PTR [ecx]{1to32}, 123
	v\m\()bf16	zmm6, [ecx+8128], 123
	v\m\()bf16	zmm6{k7}{z}, [edx-256]{1to32}, 123
	.endr

	vcmpbf16	k5, zmm5, zmm4, 123
	vcmpbf16	k5{k7}, zmm5, [esp+esi*8+0x10000000], 123
	vcmpbf16	k5, zmm5, [ecx]{1to32}, 123
	vcmpbf16	k5, zmm5, ZMMWORD PTR [ecx+8128], 123
	vcmpbf16	k5{k7}, zmm5, WORD PTR [edx-256]{1to32}, 123

	vfpclassbf16	k5, zmm5, 123
	vfpclassbf16	k5{k7}, ZMMWORD PTR [esp+esi*8+0x10000000], 123
	vfpclassbf16	k5, WORD PTR [ecx]{1to32}, 123
	vfpclassbf16	k5, ZMMWORD PTR [ecx+8128], 123
	vfpclassbf16	k5{k7}, [edx-256]{1to32}, 123
