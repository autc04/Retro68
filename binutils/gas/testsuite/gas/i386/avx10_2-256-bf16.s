# Check 32bit AVX10.2/256 instructions

	.arch generic32
	.arch .avx10.2/256
	.text
_start:
	.irp m, add, div, max, min, mul, scalef, sub
	v\m\()bf16	%ymm4, %ymm5, %ymm6
	v\m\()bf16	%xmm4, %xmm5, %xmm6
	v\m\()bf16	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	v\m\()bf16	(%ecx){1to16}, %ymm5, %ymm6
	v\m\()bf16	4064(%ecx), %ymm5, %ymm6
	v\m\()bf16	-256(%edx){1to16}, %ymm5, %ymm6{%k7}{z}
	v\m\()bf16	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	v\m\()bf16	(%ecx){1to8}, %xmm5, %xmm6
	v\m\()bf16	2032(%ecx), %xmm5, %xmm6
	v\m\()bf16	-256(%edx){1to8}, %xmm5, %xmm6{%k7}{z}
	.endr

	.irp m, madd, msub, nmadd, nmsub
	.irp n, 132, 213, 231
	vf\m\n\(\())bf16	%ymm4, %ymm5, %ymm6
	vf\m\n\(\())bf16	%xmm4, %xmm5, %xmm6
	vf\m\n\(\())bf16	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vf\m\n\(\())bf16	(%ecx){1to16}, %ymm5, %ymm6
	vf\m\n\(\())bf16	4064(%ecx), %ymm5, %ymm6
	vf\m\n\(\())bf16	-256(%edx){1to16}, %ymm5, %ymm6{%k7}{z}
	vf\m\n\(\())bf16	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vf\m\n\(\())bf16	(%ecx){1to8}, %xmm5, %xmm6
	vf\m\n\(\())bf16	2032(%ecx), %xmm5, %xmm6
	vf\m\n\(\())bf16	-256(%edx){1to8}, %xmm5, %xmm6{%k7}{z}
	.endr
	.endr

	.irp m, getexp, rcp, rsqrt, sqrt
	v\m\()bf16	%xmm5, %xmm6
	v\m\()bf16	%ymm5, %ymm6
	v\m\()bf16	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	v\m\()bf16	(%ecx){1to8}, %xmm6
	v\m\()bf16	2032(%ecx), %xmm6
	v\m\()bf16	-256(%edx){1to8}, %xmm6{%k7}{z}
	v\m\()bf16	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	v\m\()bf16	(%ecx){1to16}, %ymm6
	v\m\()bf16	4064(%ecx), %ymm6
	v\m\()bf16	-256(%edx){1to16}, %ymm6{%k7}{z}
	.endr

	.irp m, getmant, reduce, rndscale
	v\m\()bf16	$123, %ymm5, %ymm6
	v\m\()bf16	$123, %xmm5, %xmm6
	v\m\()bf16	$123, 0x10000000(%esp, %esi, 8), %xmm6{%k7}
	v\m\()bf16	$123, (%ecx){1to8}, %xmm6
	v\m\()bf16	$123, 2032(%ecx), %xmm6
	v\m\()bf16	$123, -256(%edx){1to8}, %xmm6{%k7}{z}
	v\m\()bf16	$123, 0x10000000(%esp, %esi, 8), %ymm6{%k7}
	v\m\()bf16	$123, (%ecx){1to16}, %ymm6
	v\m\()bf16	$123, 4064(%ecx), %ymm6
	v\m\()bf16	$123, -256(%edx){1to16}, %ymm6{%k7}{z}
	.endr

	vcmpbf16	$123, %ymm4, %ymm5, %k5
	vcmpbf16	$123, %xmm4, %xmm5, %k5
	vcmpbf16	$123, 0x10000000(%esp, %esi, 8), %xmm5, %k5{%k7}
	vcmpbf16	$123, (%ecx){1to8}, %xmm5, %k5
	vcmpbf16	$123, 2032(%ecx), %xmm5, %k5
	vcmpbf16	$123, -256(%edx){1to8}, %xmm5, %k5{%k7}
	vcmpbf16	$123, 0x10000000(%esp, %esi, 8), %ymm5, %k5{%k7}
	vcmpbf16	$123, (%ecx){1to16}, %ymm5, %k5
	vcmpbf16	$123, 4064(%ecx), %ymm5, %k5
	vcmpbf16	$123, -256(%edx){1to16}, %ymm5, %k5{%k7}

	vcomisbf16	%xmm5, %xmm6
	vcomisbf16	0x10000000(%esp, %esi, 8), %xmm6
	vcomisbf16	(%ecx), %xmm6
	vcomisbf16	254(%ecx), %xmm6
	vcomisbf16	-256(%edx), %xmm6

	vfpclassbf16	$123, %ymm5, %k5
	vfpclassbf16	$123, %xmm5, %k5
	vfpclassbf16x	$123, 0x10000000(%esp, %esi, 8), %k5{%k7}
	vfpclassbf16	$123, (%ecx){1to8}, %k5
	vfpclassbf16x	$123, 2032(%ecx), %k5
	vfpclassbf16	$123, -256(%edx){1to8}, %k5{%k7}
	vfpclassbf16	$123, (%ecx){1to16}, %k5
	vfpclassbf16y	$123, 4064(%ecx), %k5
	vfpclassbf16	$123, -256(%edx){1to16}, %k5{%k7}

_intel:
	.intel_syntax noprefix
	.irp m, add, div, max, min, mul, scalef, sub
	v\m\()bf16	ymm6, ymm5, ymm4
	v\m\()bf16	xmm6, xmm5, xmm4
	v\m\()bf16	ymm6{k7}, ymm5, [esp+esi*8+0x10000000]
	v\m\()bf16	ymm6, ymm5, [ecx]{1to16}
	v\m\()bf16	ymm6, ymm5, YMMWORD PTR [ecx+4064]
	v\m\()bf16	ymm6{k7}{z}, ymm5, WORD PTR [edx-256]{1to16}
	v\m\()bf16	xmm6{k7}, xmm5, [esp+esi*8+0x10000000]
	v\m\()bf16	xmm6, xmm5, WORD PTR [ecx]{1to8}
	v\m\()bf16	xmm6, xmm5, XMMWORD PTR [ecx+2032]
	v\m\()bf16	xmm6{k7}{z}, xmm5, [edx-256]{1to8}
	.endr

	.irp m, madd, msub, nmadd, nmsub
	.irp n, 132, 213, 231
	vf\m\n\(\())bf16	ymm6, ymm5, ymm4
	vf\m\n\(\())bf16	xmm6, xmm5, xmm4
	vf\m\n\(\())bf16	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vf\m\n\(\())bf16	ymm6, ymm5, [ecx]{1to16}
	vf\m\n\(\())bf16	ymm6, ymm5, [ecx+4064]
	vf\m\n\(\())bf16	ymm6{k7}{z}, ymm5, WORD PTR [edx-256]{1to16}
	vf\m\n\(\())bf16	xmm6{k7}, xmm5, [esp+esi*8+0x10000000]
	vf\m\n\(\())bf16	xmm6, xmm5, WORD PTR [ecx]{1to8}
	vf\m\n\(\())bf16	xmm6, xmm5, XMMWORD PTR [ecx+2032]
	vf\m\n\(\())bf16	xmm6{k7}{z}, xmm5, [edx-256]{1to8}
	.endr
	.endr

	.irp m, getexp, rcp, rsqrt, sqrt
	v\m\()bf16	xmm6, xmm5
	v\m\()bf16	ymm6, ymm5
	v\m\()bf16	xmm6{k7}, [esp+esi*8+0x10000000]
	v\m\()bf16	xmm6, [ecx]{1to8}
	v\m\()bf16	xmm6, XMMWORD PTR [ecx+2032]
	v\m\()bf16	xmm6{k7}{z}, WORD PTR [edx-256]{1to8}
	v\m\()bf16	ymm6{k7}, [esp+esi*8+0x10000000]
	v\m\()bf16	ymm6, WORD PTR [ecx]{1to16}
	v\m\()bf16	ymm6, YMMWORD PTR [ecx+4064]
	v\m\()bf16	ymm6{k7}{z}, [edx-256]{1to16}
	.endr

	.irp m, getmant, reduce, rndscale
	v\m\()bf16	ymm6, ymm5, 123
	v\m\()bf16	xmm6, xmm5, 123
	v\m\()bf16	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000], 123
	v\m\()bf16	xmm6, [ecx]{1to8}, 123
	v\m\()bf16	xmm6, [ecx+2032], 123
	v\m\()bf16	xmm6{k7}{z}, WORD PTR [edx-256]{1to8}, 123
	v\m\()bf16	ymm6{k7}, YMMWORD PTR [esp+esi*8+0x10000000], 123
	v\m\()bf16	ymm6, [ecx]{1to16}, 123
	v\m\()bf16	ymm6, [ecx+4064], 123
	v\m\()bf16	ymm6{k7}{z}, WORD PTR [edx-256]{1to16}, 123
	.endr

	vcmpbf16	k5, ymm5, ymm4, 123
	vcmpbf16	k5, xmm5, xmm4, 123
	vcmpbf16	k5{k7}, xmm5, [esp+esi*8+0x10000000], 123
	vcmpbf16	k5, xmm5, WORD PTR [ecx]{1to8}, 123
	vcmpbf16	k5, xmm5, XMMWORD PTR [ecx+2032], 123
	vcmpbf16	k5{k7}, xmm5, [edx-256]{1to8}, 123
	vcmpbf16	k5{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000], 123
	vcmpbf16	k5, ymm5, WORD PTR [ecx]{1to16}, 123
	vcmpbf16	k5, ymm5, [ecx+4064], 123
	vcmpbf16	k5{k7}, ymm5, [edx-256]{1to16}, 123

	vcomisbf16	xmm6, xmm5
	vcomisbf16	xmm6, WORD PTR [esp+esi*8+0x10000000]
	vcomisbf16	xmm6, WORD PTR [ecx]
	vcomisbf16	xmm6, WORD PTR [ecx+254]
	vcomisbf16	xmm6, WORD PTR [edx-256]

	vfpclassbf16	k5, ymm5, 123
	vfpclassbf16	k5, xmm5, 123
	vfpclassbf16	k5{k7}, XMMWORD PTR [esp+esi*8+0x10000000], 123
	vfpclassbf16	k5, [ecx]{1to8}, 123
	vfpclassbf16	k5, XMMWORD PTR [ecx+2032], 123
	vfpclassbf16	k5{k7}, WORD PTR [edx-256]{1to8}, 123
	vfpclassbf16	k5, [ecx]{1to16}, 123
	vfpclassbf16	k5, YMMWORD PTR [ecx+4064], 123
	vfpclassbf16	k5{k7}, WORD PTR [edx-256]{1to16}, 123
