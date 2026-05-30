# Check 32bit AVX10.2/256 instructions

	.arch generic32
	.arch .avx10.2/256
	.text
_start:
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	%ymm4, %ymm5, %ymm6{%k7}
	vpdpb\m\()d\s	%xmm4, %xmm5, %xmm6{%k7}
	vpdpb\m\()d\s	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vpdpb\m\()d\s	(%ecx){1to8}, %ymm5, %ymm6
	vpdpb\m\()d\s	4064(%ecx), %ymm5, %ymm6{%k7}
	vpdpb\m\()d\s	-512(%edx){1to8}, %ymm5, %ymm6{%k7}{z}
	vpdpb\m\()d\s	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vpdpb\m\()d\s	(%ecx){1to4}, %xmm5, %xmm6
	vpdpb\m\()d\s	2032(%ecx), %xmm5, %xmm6{%k7}
	vpdpb\m\()d\s	-512(%edx){1to4}, %xmm5, %xmm6{%k7}{z}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	%ymm4, %ymm5, %ymm6{%k7}
	vpdpw\m\()d\s	%xmm4, %xmm5, %xmm6{%k7}
	vpdpw\m\()d\s	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vpdpw\m\()d\s	(%ecx){1to8}, %ymm5, %ymm6
	vpdpw\m\()d\s	4064(%ecx), %ymm5, %ymm6{%k7}
	vpdpw\m\()d\s	-512(%edx){1to8}, %ymm5, %ymm6{%k7}{z}
	vpdpw\m\()d\s	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vpdpw\m\()d\s	(%ecx){1to4}, %xmm5, %xmm6
	vpdpw\m\()d\s	2032(%ecx), %xmm5, %xmm6{%k7}
	vpdpw\m\()d\s	-512(%edx){1to4}, %xmm5, %xmm6{%k7}{z}
	.endr
	.endr

	vdpphps	%ymm4, %ymm5, %ymm6{%k7}
	vdpphps	%xmm4, %xmm5, %xmm6{%k7}
	vdpphps	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vdpphps	(%ecx){1to8}, %ymm5, %ymm6
	vdpphps	4064(%ecx), %ymm5, %ymm6{%k7}
	vdpphps	-512(%edx){1to8}, %ymm5, %ymm6{%k7}{z}
	vdpphps	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vdpphps	(%ecx){1to4}, %xmm5, %xmm6
	vdpphps	2032(%ecx), %xmm5, %xmm6{%k7}
	vdpphps	-512(%edx){1to4}, %xmm5, %xmm6{%k7}{z}

	vmpsadbw	$123, %xmm4, %xmm5, %xmm6{%k7}
	vmpsadbw	$123, %ymm4, %ymm5, %ymm6{%k7}
	vmpsadbw	$123, 0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vmpsadbw	$123, (%ecx), %ymm5, %ymm6{%k7}
	vmpsadbw	$123, 4064(%ecx), %ymm5, %ymm6{%k7}
	vmpsadbw	$123, -4096(%edx), %ymm5, %ymm6{%k7}{z}
	vmpsadbw	$123, 0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vmpsadbw	$123, (%ecx), %xmm5, %xmm6{%k7}
	vmpsadbw	$123, 2032(%ecx), %xmm5, %xmm6{%k7}
	vmpsadbw	$123, -2048(%edx), %xmm5, %xmm6{%k7}{z}

_intel:
	.intel_syntax noprefix
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	ymm6{k7}, ymm5, ymm4
	vpdpb\m\()d\s	xmm6{k7}, xmm5, xmm4
	vpdpb\m\()d\s	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vpdpb\m\()d\s	ymm6, ymm5, DWORD PTR [ecx]{1to8}
	vpdpb\m\()d\s	ymm6{k7}, ymm5, YMMWORD PTR [ecx+4064]
	vpdpb\m\()d\s	ymm6{k7}{z}, ymm5, DWORD PTR [edx-512]{1to8}
	vpdpb\m\()d\s	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	vpdpb\m\()d\s	xmm6, xmm5, DWORD PTR [ecx]{1to4}
	vpdpb\m\()d\s	xmm6{k7}, xmm5, XMMWORD PTR [ecx+2032]
	vpdpb\m\()d\s	xmm6{k7}{z}, xmm5, DWORD PTR [edx-512]{1to4}
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	ymm6{k7}, ymm5, ymm4
	vpdpw\m\()d\s	xmm6{k7}, xmm5, xmm4
	vpdpw\m\()d\s	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vpdpw\m\()d\s	ymm6, ymm5, DWORD PTR [ecx]{1to8}
	vpdpw\m\()d\s	ymm6{k7}, ymm5, YMMWORD PTR [ecx+4064]
	vpdpw\m\()d\s	ymm6{k7}{z}, ymm5, DWORD PTR [edx-512]{1to8}
	vpdpw\m\()d\s	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	vpdpw\m\()d\s	xmm6, xmm5, DWORD PTR [ecx]{1to4}
	vpdpw\m\()d\s	xmm6{k7}, xmm5, XMMWORD PTR [ecx+2032]
	vpdpw\m\()d\s	xmm6{k7}{z}, xmm5, DWORD PTR [edx-512]{1to4}
	.endr
	.endr

	vdpphps	ymm6{k7}, ymm5, ymm4
	vdpphps	xmm6{k7}, xmm5, xmm4
	vdpphps	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vdpphps	ymm6, ymm5, DWORD PTR [ecx]{1to8}
	vdpphps	ymm6{k7}, ymm5, YMMWORD PTR [ecx+4064]
	vdpphps	ymm6{k7}{z}, ymm5, DWORD PTR [edx-512]{1to8}
	vdpphps	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	vdpphps	xmm6, xmm5, DWORD PTR [ecx]{1to4}
	vdpphps	xmm6{k7}, xmm5, XMMWORD PTR [ecx+2032]
	vdpphps	xmm6{k7}{z}, xmm5, DWORD PTR [edx-512]{1to4}

	vmpsadbw	xmm6{k7}, xmm5, xmm4, 123
	vmpsadbw	ymm6{k7}, ymm5, ymm4, 123
	vmpsadbw	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000], 123
	vmpsadbw	ymm6{k7}, ymm5, YMMWORD PTR [ecx], 123
	vmpsadbw	ymm6{k7}, ymm5, YMMWORD PTR [ecx+4064], 123
	vmpsadbw	ymm6{k7}{z}, ymm5, YMMWORD PTR [edx-4096], 123
	vmpsadbw	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000], 123
	vmpsadbw	xmm6{k7}, xmm5, XMMWORD PTR [ecx], 123
	vmpsadbw	xmm6{k7}, xmm5, XMMWORD PTR [ecx+2032], 123
	vmpsadbw	xmm6{k7}{z}, xmm5, XMMWORD PTR [edx-2048], 123
