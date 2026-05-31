# Check 64bit MOVRS, AVX10.2/256 instructions

	.arch generic64
	.arch .avx10.2/256
	.arch .movrs
_start:
	vmovrsb	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vmovrsb	(%r9), %xmm30
	vmovrsb	2032(%rcx), %xmm30
	vmovrsb	-2048(%rdx), %xmm30{%k7}{z}
	vmovrsd	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vmovrsd	(%r9), %xmm30
	vmovrsd	2032(%rcx), %xmm30
	vmovrsd	-2048(%rdx), %xmm30{%k7}{z}
	vmovrsq	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vmovrsq	(%r9), %xmm30
	vmovrsq	2032(%rcx), %xmm30
	vmovrsq	-2048(%rdx), %xmm30{%k7}{z}
	vmovrsw	0x10000000(%rbp, %r14, 8), %xmm30{%k7}
	vmovrsw	(%r9), %xmm30
	vmovrsw	2032(%rcx), %xmm30
	vmovrsw	-2048(%rdx), %xmm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	vmovrsb	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsb	xmm30, XMMWORD PTR [r9]
	vmovrsb	xmm30, XMMWORD PTR [rcx+2032]
	vmovrsb	xmm30{k7}{z}, XMMWORD PTR [rdx-2048]
	vmovrsd	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsd	xmm30, XMMWORD PTR [r9]
	vmovrsd	xmm30, XMMWORD PTR [rcx+2032]
	vmovrsd	xmm30{k7}{z}, XMMWORD PTR [rdx-2048]
	vmovrsq	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsq	xmm30, XMMWORD PTR [r9]
	vmovrsq	xmm30, XMMWORD PTR [rcx+2032]
	vmovrsq	xmm30{k7}{z}, XMMWORD PTR [rdx-2048]
	vmovrsw	xmm30{k7}, XMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsw	xmm30, XMMWORD PTR [r9]
	vmovrsw	xmm30, XMMWORD PTR [rcx+2032]
	vmovrsw	xmm30{k7}{z}, XMMWORD PTR [rdx-2048]
