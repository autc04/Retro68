# Check 64bit AVX10.2/256 instructions

	.arch generic64
	.arch .avx10.2/256
	.text
_start:
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	%ymm28, %ymm29, %ymm30
	vpdpb\m\()d\s	%xmm28, %xmm29, %xmm30
	vpdpb\m\()d\s	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vpdpb\m\()d\s	(%r9){1to8}, %ymm29, %ymm30
	vpdpb\m\()d\s	4064(%rcx), %ymm29, %ymm30
	vpdpb\m\()d\s	-512(%rdx){1to8}, %ymm29, %ymm30{%k7}{z}
	vpdpb\m\()d\s	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vpdpb\m\()d\s	(%r9){1to4}, %xmm29, %xmm30
	vpdpb\m\()d\s	2032(%rcx), %xmm29, %xmm30
	vpdpb\m\()d\s	-512(%rdx){1to4}, %xmm29, %xmm30{%k7}{z}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	%ymm28, %ymm29, %ymm30
	vpdpw\m\()d\s	%xmm28, %xmm29, %xmm30
	vpdpw\m\()d\s	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vpdpw\m\()d\s	(%r9){1to8}, %ymm29, %ymm30
	vpdpw\m\()d\s	4064(%rcx), %ymm29, %ymm30
	vpdpw\m\()d\s	-512(%rdx){1to8}, %ymm29, %ymm30{%k7}{z}
	vpdpw\m\()d\s	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vpdpw\m\()d\s	(%r9){1to4}, %xmm29, %xmm30
	vpdpw\m\()d\s	2032(%rcx), %xmm29, %xmm30
	vpdpw\m\()d\s	-512(%rdx){1to4}, %xmm29, %xmm30{%k7}{z}
	.endr
	.endr

	vdpphps	%ymm28, %ymm29, %ymm30
	vdpphps	%xmm28, %xmm29, %xmm30
	vdpphps	0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vdpphps	(%r9){1to8}, %ymm29, %ymm30
	vdpphps	4064(%rcx), %ymm29, %ymm30
	vdpphps	-512(%rdx){1to8}, %ymm29, %ymm30{%k7}{z}
	vdpphps	0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vdpphps	(%r9){1to4}, %xmm29, %xmm30
	vdpphps	2032(%rcx), %xmm29, %xmm30
	vdpphps	-512(%rdx){1to4}, %xmm29, %xmm30{%k7}{z}

	vmpsadbw	$123, %xmm28, %xmm29, %xmm30
	vmpsadbw	$123, %ymm28, %ymm29, %ymm30
	vmpsadbw	$123, 0x10000000(%rbp, %r14, 8), %ymm29, %ymm30{%k7}
	vmpsadbw	$123, (%r9), %ymm29, %ymm30
	vmpsadbw	$123, 4064(%rcx), %ymm29, %ymm30
	vmpsadbw	$123, -4096(%rdx), %ymm29, %ymm30{%k7}{z}
	vmpsadbw	$123, 0x10000000(%rbp, %r14, 8), %xmm29, %xmm30{%k7}
	vmpsadbw	$123, (%r9), %xmm29, %xmm30
	vmpsadbw	$123, 2032(%rcx), %xmm29, %xmm30
	vmpsadbw	$123, -2048(%rdx), %xmm29, %xmm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	ymm30, ymm29, ymm28
	vpdpb\m\()d\s	xmm30, xmm29, xmm28
	vpdpb\m\()d\s	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vpdpb\m\()d\s	ymm30, ymm29, DWORD PTR [r9]{1to8}
	vpdpb\m\()d\s	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	vpdpb\m\()d\s	ymm30{k7}{z}, ymm29, DWORD PTR [rdx-512]{1to8}
	vpdpb\m\()d\s	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vpdpb\m\()d\s	xmm30, xmm29, DWORD PTR [r9]{1to4}
	vpdpb\m\()d\s	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	vpdpb\m\()d\s	xmm30{k7}{z}, xmm29, DWORD PTR [rdx-512]{1to4}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	ymm30, ymm29, ymm28
	vpdpw\m\()d\s	xmm30, xmm29, xmm28
	vpdpw\m\()d\s	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vpdpw\m\()d\s	ymm30, ymm29, DWORD PTR [r9]{1to8}
	vpdpw\m\()d\s	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	vpdpw\m\()d\s	ymm30{k7}{z}, ymm29, DWORD PTR [rdx-512]{1to8}
	vpdpw\m\()d\s	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vpdpw\m\()d\s	xmm30, xmm29, DWORD PTR [r9]{1to4}
	vpdpw\m\()d\s	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	vpdpw\m\()d\s	xmm30{k7}{z}, xmm29, DWORD PTR [rdx-512]{1to4}
	.endr
	.endr

	vdpphps	ymm30, ymm29, ymm28
	vdpphps	xmm30, xmm29, xmm28
	vdpphps	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000]
	vdpphps	ymm30, ymm29, DWORD PTR [r9]{1to8}
	vdpphps	ymm30, ymm29, YMMWORD PTR [rcx+4064]
	vdpphps	ymm30{k7}{z}, ymm29, DWORD PTR [rdx-512]{1to8}
	vdpphps	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000]
	vdpphps	xmm30, xmm29, DWORD PTR [r9]{1to4}
	vdpphps	xmm30, xmm29, XMMWORD PTR [rcx+2032]
	vdpphps	xmm30{k7}{z}, xmm29, DWORD PTR [rdx-512]{1to4}

	vmpsadbw	xmm30, xmm29, xmm28, 123
	vmpsadbw	ymm30, ymm29, ymm28, 123
	vmpsadbw	ymm30{k7}, ymm29, YMMWORD PTR [rbp+r14*8+0x10000000], 123
	vmpsadbw	ymm30, ymm29, YMMWORD PTR [r9], 123
	vmpsadbw	ymm30, ymm29, YMMWORD PTR [rcx+4064], 123
	vmpsadbw	ymm30{k7}{z}, ymm29, YMMWORD PTR [rdx-4096], 123
	vmpsadbw	xmm30{k7}, xmm29, XMMWORD PTR [rbp+r14*8+0x10000000], 123
	vmpsadbw	xmm30, xmm29, XMMWORD PTR [r9], 123
	vmpsadbw	xmm30, xmm29, XMMWORD PTR [rcx+2032], 123
	vmpsadbw	xmm30{k7}{z}, xmm29, XMMWORD PTR [rdx-2048], 123
