# Check 64bit AVX10.2/256 instructions

	.arch generic64
	.arch .avx10.2/256
	.text
_start:
	.irp m, add, div, max, min, mul, scalef, sub
	v\m\()bf16	%ymm28, %ymm29, %ymm30
	v\m\()bf16	%xmm28, %xmm29, %xmm30
	v\m\()bf16	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	v\m\()bf16	(%r9){1to16}, %ymm29, %ymm30
	v\m\()bf16	4064(%rcx), %ymm29, %ymm30
	v\m\()bf16	-256(%rdx){1to16}, %ymm29, %ymm30{%k7}{z}
	v\m\()bf16	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	v\m\()bf16	(%r9){1to8}, %xmm29, %xmm30
	v\m\()bf16	2032(%rcx), %xmm29, %xmm30
	v\m\()bf16	-256(%rdx){1to8}, %xmm29, %xmm30{%k7}{z}
	.endr

	.irp m, madd, msub, nmadd, nmsub
	.irp n, 132, 213, 231
	vf\m\n\(\())bf16	%ymm28, %ymm29, %ymm30
	vf\m\n\(\())bf16	%xmm28, %xmm29, %xmm30
	vf\m\n\(\())bf16	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vf\m\n\(\())bf16	(%r9){1to16}, %ymm29, %ymm30
	vf\m\n\(\())bf16	4064(%rcx), %ymm29, %ymm30
	vf\m\n\(\())bf16	-256(%rdx){1to16}, %ymm29, %ymm30{%k7}{z}
	vf\m\n\(\())bf16	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vf\m\n\(\())bf16	(%r9){1to8}, %xmm29, %xmm30
	vf\m\n\(\())bf16	2032(%rcx), %xmm29, %xmm30
	vf\m\n\(\())bf16	-256(%rdx){1to8}, %xmm29, %xmm30{%k7}{z}
	.endr
	.endr

	.irp m, getexp, rcp, rsqrt, sqrt
	v\m\()bf16	%xmm29, %xmm30
	v\m\()bf16	%ymm29, %ymm30
	v\m\()bf16	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	v\m\()bf16	(%r9){1to8}, %xmm30
	v\m\()bf16	2032(%rcx), %xmm30
	v\m\()bf16	-256(%rdx){1to8}, %xmm30{%k7}{z}
	v\m\()bf16	0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	v\m\()bf16	(%r9){1to16}, %ymm30
	v\m\()bf16	4064(%rcx), %ymm30
	v\m\()bf16	-256(%rdx){1to16}, %ymm30{%k7}{z}
	.endr

	.irp m, getmant, reduce, rndscale
	v\m\()bf16	$123, %ymm29, %ymm30
	v\m\()bf16	$123, %xmm29, %xmm30
	v\m\()bf16	$123, 0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	v\m\()bf16	$123, (%r9){1to8}, %xmm30
	v\m\()bf16	$123, 2032(%rcx), %xmm30
	v\m\()bf16	$123, -256(%rdx){1to8}, %xmm30{%k7}{z}
	v\m\()bf16	$123, 0x10000000(%rbp, %r14, 8), %ymm30{%k7}
	v\m\()bf16	$123, (%r9){1to16}, %ymm30
	v\m\()bf16	$123, 4064(%rcx), %ymm30
	v\m\()bf16	$123, -256(%rdx){1to16}, %ymm30{%k7}{z}
	.endr

	vcmpbf16	$123, %ymm28, %ymm29, %k5
	vcmpbf16	$123, %xmm28, %xmm29, %k5
	vcmpbf16	$123, 0x10000000(%rbp, %r14, 8), %xmm29, %k5{%k7}
	vcmpbf16	$123, (%r9){1to8}, %xmm29, %k5
	vcmpbf16	$123, 2032(%rcx), %xmm29, %k5
	vcmpbf16	$123, -256(%rdx){1to8}, %xmm29, %k5{%k7}
	vcmpbf16	$123, 0x10000000(%rbp, %r14, 8), %ymm29, %k5{%k7}
	vcmpbf16	$123, (%r9){1to16}, %ymm29, %k5
	vcmpbf16	$123, 4064(%rcx), %ymm29, %k5
	vcmpbf16	$123, -256(%rdx){1to16}, %ymm29, %k5{%k7}

	vcomisbf16	%xmm29, %xmm30
	vcomisbf16	0x10000000(%rbp, %r14, 8), %xmm30
	vcomisbf16	(%r9), %xmm30
	vcomisbf16	254(%rcx), %xmm30
	vcomisbf16	-256(%rdx), %xmm30

	vfpclassbf16	$123, %ymm29, %k5
	vfpclassbf16	$123, %xmm29, %k5
	vfpclassbf16x	$123, 0x10000000(%rbp, %r14, 8), %k5{%k7}
	vfpclassbf16	$123, (%r9){1to8}, %k5
	vfpclassbf16x	$123, 2032(%rcx), %k5
	vfpclassbf16	$123, -256(%rdx){1to8}, %k5{%k7}
	vfpclassbf16	$123, (%r9){1to16}, %k5
	vfpclassbf16y	$123, 4064(%rcx), %k5
	vfpclassbf16	$123, -256(%rdx){1to16}, %k5{%k7}

_intel:
	.intel_syntax noprefix
	.irp m, add, div, max, min, mul, scalef, sub
	v\m\()bf16	ymm30, ymm29, ymm28
	v\m\()bf16	xmm30, xmm29, xmm28
	v\m\()bf16	ymm30{k7}, ymm29, [rbp+r14*8+0x10000000]
	v\m\()bf16	ymm30, ymm29, [r9]{1to16}
	v\m\()bf16	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	v\m\()bf16	ymm30{k7}{z}, ymm29, WORD PTR [rdx-256]{1to16}
	v\m\()bf16	xmm30{k7}, xmm29, [rbp+r14*8+0x10000000]
	v\m\()bf16	xmm30, xmm29, [r9]{1to8}
	v\m\()bf16	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	v\m\()bf16	xmm30{k7}{z}, xmm29, WORD PTR [rdx-256]{1to8}
	.endr

	.irp m, madd, msub, nmadd, nmsub
	.irp n, 132, 213, 231
	vf\m\n\(\())bf16	ymm30, ymm29, ymm28
	vf\m\n\(\())bf16	xmm30, xmm29, xmm28
	vf\m\n\(\())bf16	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vf\m\n\(\())bf16	ymm30, ymm29, WORD PTR [r9]{1to16}
	vf\m\n\(\())bf16	ymm30, ymm29, [rcx+4064]
	vf\m\n\(\())bf16	ymm30{k7}{z}, ymm29, [rdx-256]{1to16}
	vf\m\n\(\())bf16	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vf\m\n\(\())bf16	xmm30, xmm29, WORD PTR [r9]{1to8}
	vf\m\n\(\())bf16	xmm30, xmm29, [rcx+2032]
	vf\m\n\(\())bf16	xmm30{k7}{z}, xmm29, [rdx-256]{1to8}
	.endr
	.endr

	.irp m, getexp, rcp, rsqrt, sqrt
	v\m\()bf16	xmm30, xmm29
	v\m\()bf16	ymm30, ymm29
	v\m\()bf16	xmm30{k7}, [rbp+r14*8+0x10000000]
	v\m\()bf16	xmm30, [r9]{1to8}
	v\m\()bf16	xmm30, XMMWORD PTR [rcx+2032]
	v\m\()bf16	xmm30{k7}{z}, WORD PTR [rdx-256]{1to8}
	v\m\()bf16	ymm30{k7}, YMMWORD PTR [rbp+r14*8+0x10000000]
	v\m\()bf16	ymm30, WORD PTR [r9]{1to16}
	v\m\()bf16	ymm30, [rcx+4064]
	v\m\()bf16	ymm30{k7}{z}, [rdx-256]{1to16}
	.endr

	.irp m, getmant, reduce, rndscale
	v\m\()bf16	ymm30, ymm29, 123
	v\m\()bf16	xmm30, xmm29, 123
	v\m\()bf16	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000], 123
	v\m\()bf16	xmm30, WORD PTR [r9]{1to8}, 123
	v\m\()bf16	xmm30, [rcx+2032], 123
	v\m\()bf16	xmm30{k7}{z}, [rdx-256]{1to8}, 123
	v\m\()bf16	ymm30{k7}, [rbp+r14*8+0x10000000], 123
	v\m\()bf16	ymm30, [r9]{1to16}, 123
	v\m\()bf16	ymm30, YMMWORD PTR [rcx+4064], 123
	v\m\()bf16	ymm30{k7}{z}, WORD PTR [rdx-256]{1to16}, 123
	.endr

	vcmpbf16	k5, ymm29, ymm28, 123
	vcmpbf16	k5, xmm29, xmm28, 123
	vcmpbf16	k5{k7}, xmm29, [rbp+r14*8+0x10000000], 123
	vcmpbf16	k5, xmm29, [r9]{1to8}, 123
	vcmpbf16	k5, xmm29, XMMWORD PTR [rcx+2032], 123
	vcmpbf16	k5{k7}, xmm29, WORD PTR [rdx-256]{1to8}, 123
	vcmpbf16	k5{k7}, ymm29, [rbp+r14*8+0x10000000], 123
	vcmpbf16	k5, ymm29, [r9]{1to16}, 123
	vcmpbf16	k5, ymm29, YMMWORD PTR [rcx+4064], 123
	vcmpbf16	k5{k7}, ymm29, WORD PTR [rdx-256]{1to16}, 123

	vcomisbf16	xmm30, xmm29
	vcomisbf16	xmm30, WORD PTR [rbp+r14*8+0x10000000]
	vcomisbf16	xmm30, [r9]
	vcomisbf16	xmm30, [rcx+254]
	vcomisbf16	xmm30, WORD PTR [rdx-256]

	vfpclassbf16	k5, ymm29, 123
	vfpclassbf16	k5, xmm29, 123
	vfpclassbf16	k5{k7}, XMMWORD PTR [rbp+r14*8+0x10000000], 123
	vfpclassbf16	k5, WORD PTR [r9]{1to8}, 123
	vfpclassbf16	k5, XMMWORD PTR [rcx+2032], 123
	vfpclassbf16	k5{k7}, [rdx-256]{1to8}, 123
	vfpclassbf16	k5, WORD PTR [r9]{1to16}, 123
	vfpclassbf16	k5, YMMWORD PTR [rcx+4064], 123
	vfpclassbf16	k5{k7}, [rdx-256]{1to16}, 123
