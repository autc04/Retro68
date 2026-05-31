# Check 32bit AVX10.2/256 instructions

	.arch generic32
	.arch .avx10.2/256
	.text
_start:
	vcvt2ps2phx	%xmm4, %xmm5, %xmm6
	vcvt2ps2phx	%ymm4, %ymm5, %ymm6
	vcvt2ps2phx	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vcvt2ps2phx	(%ecx){1to4}, %xmm5, %xmm6
	vcvt2ps2phx	2032(%ecx), %xmm5, %xmm6
	vcvt2ps2phx	-512(%edx){1to4}, %xmm5, %xmm6{%k7}
	vcvt2ps2phx	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vcvt2ps2phx	(%ecx){1to8}, %ymm5, %ymm6
	vcvt2ps2phx	4064(%ecx), %ymm5, %ymm6
	vcvt2ps2phx	-512(%edx){1to8}, %ymm5, %ymm6{%k7}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	%xmm4, %xmm5, %xmm6
	vcvtbiasph2\m	%ymm4, %ymm5, %xmm6
	vcvtbiasph2\m	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vcvtbiasph2\m	(%ecx){1to8}, %xmm5, %xmm6
	vcvtbiasph2\m	2032(%ecx), %xmm5, %xmm6
	vcvtbiasph2\m	-256(%edx){1to8}, %xmm5, %xmm6{%k7}{z}
	vcvtbiasph2\m	0x10000000(%esp, %esi, 8), %ymm5, %xmm6{%k7}
	vcvtbiasph2\m	(%ecx){1to16}, %ymm5, %xmm6
	vcvtbiasph2\m	4064(%ecx), %ymm5, %xmm6
	vcvtbiasph2\m	-256(%edx){1to16}, %ymm5, %xmm6{%k7}{z}
	vcvt2ph2\m	%xmm4, %xmm5, %xmm6
	vcvt2ph2\m	%ymm4, %ymm5, %ymm6
	vcvt2ph2\m	0x10000000(%esp, %esi, 8), %xmm5, %xmm6{%k7}
	vcvt2ph2\m	(%ecx){1to8}, %xmm5, %xmm6
	vcvt2ph2\m	2032(%ecx), %xmm5, %xmm6
	vcvt2ph2\m	-256(%edx){1to8}, %xmm5, %xmm6{%k7}
	vcvt2ph2\m	0x10000000(%esp, %esi, 8), %ymm5, %ymm6{%k7}
	vcvt2ph2\m	(%ecx){1to16}, %ymm5, %ymm6
	vcvt2ph2\m	4064(%ecx), %ymm5, %ymm6
	vcvt2ph2\m	-256(%edx){1to16}, %ymm5, %ymm6{%k7}
	vcvtph2\m	%xmm5, %xmm6
	vcvtph2\m	%ymm5, %xmm6
	vcvtph2\m\()x	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvtph2\m	(%ecx){1to8}, %xmm6
	vcvtph2\m\()x	2032(%ecx), %xmm6
	vcvtph2\m	-256(%edx){1to8}, %xmm6{%k7}{z}
	vcvtph2\m	(%ecx){1to16}, %xmm6
	vcvtph2\m\()y	4064(%ecx), %xmm6
	vcvtph2\m	-256(%edx){1to16}, %xmm6{%k7}{z}
	.endr

	vcvthf82ph	%xmm5, %xmm6
	vcvthf82ph	%xmm5, %ymm6
	vcvthf82ph	0x10000000(%esp, %esi, 8), %xmm6{%k7}
	vcvthf82ph	(%ecx), %xmm6
	vcvthf82ph	1016(%ecx), %xmm6
	vcvthf82ph	-1024(%edx), %xmm6{%k7}{z}
	vcvthf82ph	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvthf82ph	(%ecx), %ymm6
	vcvthf82ph	2032(%ecx), %ymm6
	vcvthf82ph	-2048(%edx), %ymm6{%k7}{z}

_intel:
	.intel_syntax noprefix
	vcvt2ps2phx	xmm6, xmm5, xmm4
	vcvt2ps2phx	ymm6, ymm5, ymm4
	vcvt2ps2phx	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvt2ps2phx	xmm6, xmm5, DWORD PTR [ecx]{1to4}
	vcvt2ps2phx	xmm6, xmm5, XMMWORD PTR [ecx+2032]
	vcvt2ps2phx	xmm6{k7}, xmm5, DWORD PTR [edx-512]{1to4}
	vcvt2ps2phx	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvt2ps2phx	ymm6, ymm5, DWORD PTR [ecx]{1to8}
	vcvt2ps2phx	ymm6, ymm5, YMMWORD PTR [ecx+4064]
	vcvt2ps2phx	ymm6{k7}, ymm5, DWORD PTR [edx-512]{1to8}
	
	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	xmm6, xmm5, xmm4
	vcvtbiasph2\m	xmm6, ymm5, ymm4
	vcvtbiasph2\m	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvtbiasph2\m	xmm6, xmm5, WORD PTR [ecx]{1to8}
	vcvtbiasph2\m	xmm6, xmm5, XMMWORD PTR [ecx+2032]
	vcvtbiasph2\m	xmm6{k7}{z}, xmm5, WORD PTR [edx-256]{1to8}
	vcvtbiasph2\m	xmm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvtbiasph2\m	xmm6, ymm5, WORD PTR [ecx]{1to16}
	vcvtbiasph2\m	xmm6, ymm5, YMMWORD PTR [ecx+4064]
	vcvtbiasph2\m	xmm6{k7}{z}, ymm5, WORD PTR [edx-256]{1to16}
	vcvt2ph2\m	xmm6, xmm5, xmm4
	vcvt2ph2\m	ymm6, ymm5, ymm4
	vcvt2ph2\m	xmm6{k7}, xmm5, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvt2ph2\m	xmm6, xmm5, WORD PTR [ecx]{1to8}
	vcvt2ph2\m	xmm6, xmm5, XMMWORD PTR [ecx+2032]
	vcvt2ph2\m	xmm6{k7}, xmm5, WORD PTR [edx-256]{1to8}
	vcvt2ph2\m	ymm6{k7}, ymm5, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvt2ph2\m	ymm6, ymm5, WORD PTR [ecx]{1to16}
	vcvt2ph2\m	ymm6, ymm5, YMMWORD PTR [ecx+4064]
	vcvt2ph2\m	ymm6{k7}, ymm5, WORD PTR [edx-256]{1to16}
	vcvtph2\m	xmm6, xmm5
	vcvtph2\m	xmm6, ymm5
	vcvtph2\m	xmm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvtph2\m	xmm6, WORD PTR [ecx]{1to8}
	vcvtph2\m	xmm6, XMMWORD PTR [ecx+2032]
	vcvtph2\m	xmm6{k7}{z}, WORD PTR [edx-256]{1to8}
	vcvtph2\m	xmm6, WORD PTR [ecx]{1to16}
	vcvtph2\m	xmm6, YMMWORD PTR [ecx+4064]
	vcvtph2\m	xmm6{k7}{z}, WORD PTR [edx-256]{1to16}
	.endr

	vcvthf82ph	xmm6, xmm5
	vcvthf82ph	ymm6, xmm5
	vcvthf82ph	xmm6{k7}, QWORD PTR [esp+esi*8+0x10000000]
	vcvthf82ph	xmm6, QWORD PTR [ecx]
	vcvthf82ph	xmm6, QWORD PTR [ecx+1016]
	vcvthf82ph	xmm6{k7}{z}, QWORD PTR [edx-1024]
	vcvthf82ph	ymm6{k7}, XMMWORD PTR [esp+esi*8+0x10000000]
	vcvthf82ph	ymm6, XMMWORD PTR [ecx]
	vcvthf82ph	ymm6, XMMWORD PTR [ecx+2032]
	vcvthf82ph	ymm6{k7}{z}, XMMWORD PTR [edx-2048]
