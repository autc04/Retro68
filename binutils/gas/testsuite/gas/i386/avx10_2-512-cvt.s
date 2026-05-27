# Check 32bit AVX10.2/512 instructions

	.arch generic32
	.arch .avx10.2/512
	.text
_start:
	vcvt2ps2phx	%zmm4, %zmm5, %zmm6
	vcvt2ps2phx	{rn-sae}, %zmm4, %zmm5, %zmm6
	vcvt2ps2phx	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vcvt2ps2phx	(%ecx){1to16}, %zmm5, %zmm6
	vcvt2ps2phx	8128(%ecx), %zmm5, %zmm6
	vcvt2ps2phx	-512(%edx){1to16}, %zmm5, %zmm6{%k7}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	%zmm4, %zmm5, %ymm6
	vcvtbiasph2\m	0x10000000(%esp, %esi, 8), %zmm5, %ymm6{%k7}
	vcvtbiasph2\m	(%ecx){1to32}, %zmm5, %ymm6
	vcvtbiasph2\m	8128(%ecx), %zmm5, %ymm6
	vcvtbiasph2\m	-256(%edx){1to32}, %zmm5, %ymm6{%k7}{z}
	vcvt2ph2\m	%zmm4, %zmm5, %zmm6
	vcvt2ph2\m	0x10000000(%esp, %esi, 8), %zmm5, %zmm6{%k7}
	vcvt2ph2\m	(%ecx){1to32}, %zmm5, %zmm6
	vcvt2ph2\m	8128(%ecx), %zmm5, %zmm6
	vcvt2ph2\m	-256(%edx){1to32}, %zmm5, %zmm6{%k7}
	vcvtph2\m	%zmm5, %ymm6
	vcvtph2\m	0x10000000(%esp, %esi, 8), %ymm6{%k7}
	vcvtph2\m	(%ecx){1to32}, %ymm6
	vcvtph2\m	8128(%ecx), %ymm6
	vcvtph2\m	-256(%edx){1to32}, %ymm6{%k7}{z}
	.endr

	vcvthf82ph	%ymm5, %zmm6
	vcvthf82ph	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vcvthf82ph	(%ecx), %zmm6
	vcvthf82ph	4064(%ecx), %zmm6
	vcvthf82ph	-4096(%edx), %zmm6{%k7}{z}

_intel:
	.intel_syntax noprefix
	vcvt2ps2phx	zmm6, zmm5, zmm4
	vcvt2ps2phx	zmm6, zmm5, zmm4, {rn-sae}
	vcvt2ps2phx	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvt2ps2phx	zmm6, zmm5, DWORD PTR [ecx]{1to16}
	vcvt2ps2phx	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vcvt2ps2phx	zmm6{k7}, zmm5, DWORD PTR [edx-512]{1to16}

	.irp m, bf8, bf8s, hf8, hf8s
	vcvtbiasph2\m	ymm6, zmm5, zmm4
	vcvtbiasph2\m	ymm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvtbiasph2\m	ymm6, zmm5, WORD PTR [ecx]{1to32}
	vcvtbiasph2\m	ymm6, zmm5, ZMMWORD PTR [ecx+8128]
	vcvtbiasph2\m	ymm6{k7}{z}, zmm5, WORD PTR [edx-256]{1to32}
	vcvt2ph2\m	zmm6, zmm5, zmm4
	vcvt2ph2\m	zmm6{k7}, zmm5, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvt2ph2\m	zmm6, zmm5, WORD PTR [ecx]{1to32}
	vcvt2ph2\m	zmm6, zmm5, ZMMWORD PTR [ecx+8128]
	vcvt2ph2\m	zmm6{k7}, zmm5, WORD PTR [edx-256]{1to32}
	vcvtph2\m	ymm6, zmm5
	vcvtph2\m	ymm6{k7}, ZMMWORD PTR [esp+esi*8+0x10000000]
	vcvtph2\m	ymm6, WORD PTR [ecx]{1to32}
	vcvtph2\m	ymm6, ZMMWORD PTR [ecx+8128]
	vcvtph2\m	ymm6{k7}{z}, WORD PTR [edx-256]{1to32}
	.endr

	vcvthf82ph	zmm6, ymm5
	vcvthf82ph	zmm6{k7}, YMMWORD PTR [esp+esi*8+0x10000000]
	vcvthf82ph	zmm6, YMMWORD PTR [ecx]
	vcvthf82ph	zmm6, YMMWORD PTR [ecx+4064]
	vcvthf82ph	zmm6{k7}{z}, YMMWORD PTR [edx-4096]
