# Check 32bit AVX10.2/512 instructions

	.arch generic32
	.arch .avx10.2/512
	.text
_start:
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	%zmm4, %zmm5, %zmm6
	vpdpb\m\()d\s	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vpdpb\m\()d\s	(%ecx){1to16}, %zmm5, %zmm6
	vpdpb\m\()d\s	8128(%ecx), %zmm5, %zmm6
	vpdpb\m\()d\s	-512(%edx){1to16}, %zmm5, %zmm6{%k7}{z}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	%zmm4, %zmm5, %zmm6
	vpdpw\m\()d\s	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vpdpw\m\()d\s	(%ecx){1to16}, %zmm5, %zmm6
	vpdpw\m\()d\s	8128(%ecx), %zmm5, %zmm6
	vpdpw\m\()d\s	-512(%edx){1to16}, %zmm5, %zmm6{%k7}{z}
	.endr
	.endr

	vdpphps	%zmm4, %zmm5, %zmm6
	vdpphps	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vdpphps	(%ecx){1to16}, %zmm5, %zmm6
	vdpphps	8128(%ecx), %zmm5, %zmm6
	vdpphps	-512(%edx){1to16}, %zmm5, %zmm6{%k7}{z}

	vmpsadbw	$123, %zmm4, %zmm5, %zmm6
	vmpsadbw	$123, 0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vmpsadbw	$123, (%ecx), %zmm5, %zmm6
	vmpsadbw	$123, 8128(%ecx), %zmm5, %zmm6
	vmpsadbw	$123, -8192(%edx), %zmm5, %zmm6{%k7}{z}

_intel:
	.intel_syntax noprefix
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	zmm6, zmm5, zmm4
	vpdpb\m\()d\s	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vpdpb\m\()d\s	zmm6, zmm5, DWORD PTR [ecx]{1to16}
	vpdpb\m\()d\s	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vpdpb\m\()d\s	zmm6{k7}{z}, zmm5, DWORD PTR [edx-512]{1to16}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	zmm6, zmm5, zmm4
	vpdpw\m\()d\s	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vpdpw\m\()d\s	zmm6, zmm5, DWORD PTR [ecx]{1to16}
	vpdpw\m\()d\s	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vpdpw\m\()d\s	zmm6{k7}{z}, zmm5, DWORD PTR [edx-512]{1to16}
	.endr
	.endr

	vdpphps	zmm6, zmm5, zmm4
	vdpphps	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vdpphps	zmm6, zmm5, DWORD PTR [ecx]{1to16}
	vdpphps	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vdpphps	zmm6{k7}{z}, zmm5, DWORD PTR [edx-512]{1to16}

	vmpsadbw	zmm6, zmm5, zmm4, 123
	vmpsadbw	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000], 123
	vmpsadbw	zmm6, zmm5, ZMMWORD PTR [ecx], 123
	vmpsadbw	zmm6, zmm5, ZMMWORD PTR [ecx+8128], 123
	vmpsadbw	zmm6{k7}{z}, zmm5, ZMMWORD PTR [edx-8192], 123
