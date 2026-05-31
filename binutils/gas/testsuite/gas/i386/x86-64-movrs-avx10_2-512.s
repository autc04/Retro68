# Check 64bit MOVRS, AVX10.2/512 instructions

	.arch generic64
	.arch .avx10.2/512
	.arch .movrs
_start:
	vmovrsb	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vmovrsb	(%r9), %zmm30
	vmovrsb	8128(%rcx), %zmm30
	vmovrsb	-8192(%rdx), %zmm30{%k7}{z}
	vmovrsd	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vmovrsd	(%r9), %zmm30
	vmovrsd	8128(%rcx), %zmm30
	vmovrsd	-8192(%rdx), %zmm30{%k7}{z}
	vmovrsq	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vmovrsq	(%r9), %zmm30
	vmovrsq	8128(%rcx), %zmm30
	vmovrsq	-8192(%rdx), %zmm30{%k7}{z}
	vmovrsw	0x10000000(%rbp, %r14, 8), %zmm30{%k7}
	vmovrsw	(%r9), %zmm30
	vmovrsw	8128(%rcx), %zmm30
	vmovrsw	-8192(%rdx), %zmm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	vmovrsb	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsb	zmm30, ZMMWORD PTR [r9]
	vmovrsb	zmm30, ZMMWORD PTR [rcx+8128]
	vmovrsb	zmm30{k7}{z}, ZMMWORD PTR [rdx-8192]
	vmovrsd	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsd	zmm30, ZMMWORD PTR [r9]
	vmovrsd	zmm30, ZMMWORD PTR [rcx+8128]
	vmovrsd	zmm30{k7}{z}, ZMMWORD PTR [rdx-8192]
	vmovrsq	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsq	zmm30, ZMMWORD PTR [r9]
	vmovrsq	zmm30, ZMMWORD PTR [rcx+8128]
	vmovrsq	zmm30{k7}{z}, ZMMWORD PTR [rdx-8192]
	vmovrsw	zmm30{k7}, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vmovrsw	zmm30, ZMMWORD PTR [r9]
	vmovrsw	zmm30, ZMMWORD PTR [rcx+8128]
	vmovrsw	zmm30{k7}{z}, ZMMWORD PTR [rdx-8192]
