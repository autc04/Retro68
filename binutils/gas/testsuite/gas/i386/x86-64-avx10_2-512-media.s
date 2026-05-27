# Check 64bit AVX10.2/512 instructions

	.arch generic64
	.arch .avx10.2/512
	.text
_start:
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	%zmm28, %zmm29, %zmm30
	vpdpb\m\()d\s	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vpdpb\m\()d\s	(%r9){1to16}, %zmm29, %zmm30
	vpdpb\m\()d\s	8128(%rcx), %zmm29, %zmm30
	vpdpb\m\()d\s	-512(%rdx){1to16}, %zmm29, %zmm30{%k7}{z}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	%zmm28, %zmm29, %zmm30
	vpdpw\m\()d\s	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vpdpw\m\()d\s	(%r9){1to16}, %zmm29, %zmm30
	vpdpw\m\()d\s	8128(%rcx), %zmm29, %zmm30
	vpdpw\m\()d\s	-512(%rdx){1to16}, %zmm29, %zmm30{%k7}{z}
	.endr
	.endr

	vdpphps	%zmm28, %zmm29, %zmm30
	vdpphps	0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vdpphps	(%r9){1to16}, %zmm29, %zmm30
	vdpphps	8128(%rcx), %zmm29, %zmm30
	vdpphps	-512(%rdx){1to16}, %zmm29, %zmm30{%k7}{z}

	vmpsadbw	$123, %zmm28, %zmm29, %zmm30
	vmpsadbw	$123, 0x10000000(%rbp, %r14, 8), %zmm29, %zmm30{%k7}
	vmpsadbw	$123, (%r9), %zmm29, %zmm30
	vmpsadbw	$123, 8128(%rcx), %zmm29, %zmm30
	vmpsadbw	$123, -8192(%rdx), %zmm29, %zmm30{%k7}{z}

_intel:
	.intel_syntax noprefix
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	zmm30, zmm29, zmm28
	vpdpb\m\()d\s	zmm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vpdpb\m\()d\s	zmm30, zmm29, DWORD PTR [r9]{1to16}
	vpdpb\m\()d\s	zmm30, zmm29, ZMMWORD PTR [rcx+8128]
	vpdpb\m\()d\s	zmm30{k7}{z}, zmm29, DWORD PTR [rdx-512]{1to16}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	zmm30, zmm29, zmm28
	vpdpw\m\()d\s	zmm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vpdpw\m\()d\s	zmm30, zmm29, DWORD PTR [r9]{1to16}
	vpdpw\m\()d\s	zmm30, zmm29, ZMMWORD PTR [rcx+8128]
	vpdpw\m\()d\s	zmm30{k7}{z}, zmm29, DWORD PTR [rdx-512]{1to16}
	.endr
	.endr

	vdpphps	zmm30, zmm29, zmm28
	vdpphps	zmm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000]
	vdpphps	zmm30, zmm29, DWORD PTR [r9]{1to16}
	vdpphps	zmm30, zmm29, ZMMWORD PTR [rcx+8128]
	vdpphps	zmm30{k7}{z}, zmm29, DWORD PTR [rdx-512]{1to16}

	vmpsadbw	zmm30, zmm29, zmm28, 123
	vmpsadbw	zmm30{k7}, zmm29, ZMMWORD PTR [rbp+r14*8+0x10000000], 123
	vmpsadbw	zmm30, zmm29, ZMMWORD PTR [r9], 123
	vmpsadbw	zmm30, zmm29, ZMMWORD PTR [rcx+8128], 123
	vmpsadbw	zmm30{k7}{z}, zmm29, ZMMWORD PTR [rdx-8192], 123
