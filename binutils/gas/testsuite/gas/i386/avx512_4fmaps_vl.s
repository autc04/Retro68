# Check 32bit AVX512{_4FMAPS,VL} instructions

	.allow_index_reg
	.text
_start:
	v4fmaddps	(%ecx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	(%ecx), %xmm4, %xmm1{%k7}	 # AVX512{_4FMAPS,VL}
	v4fmaddps	(%ecx), %xmm4, %xmm1{%k7}{z}	 # AVX512{_4FMAPS,VL}
	v4fmaddps	-123456(%esp,%esi,8), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	4064(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	4096(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	-4096(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	-4128(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	(%ecx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	(%ecx), %ymm4, %ymm1{%k7}	 # AVX512{_4FMAPS,VL}
	v4fmaddps	(%ecx), %ymm4, %ymm1{%k7}{z}	 # AVX512{_4FMAPS,VL}
	v4fmaddps	-123456(%esp,%esi,8), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	4064(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	4096(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fmaddps	-4096(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	-4128(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	(%ecx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	(%ecx), %xmm4, %xmm1{%k7}	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	(%ecx), %xmm4, %xmm1{%k7}{z}	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	-123456(%esp,%esi,8), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	4064(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	4096(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	-4096(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	-4128(%edx), %xmm4, %xmm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	(%ecx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	(%ecx), %ymm4, %ymm1{%k7}	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	(%ecx), %ymm4, %ymm1{%k7}{z}	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	-123456(%esp,%esi,8), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	4064(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	4096(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	-4096(%edx), %ymm4, %ymm1	 # AVX512{_4FMAPS,VL} Disp8

	.intel_syntax noprefix
	v4fmaddps	xmm1, xmm4, [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	xmm1, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	xmm1{k7}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	xmm1{k7}{z}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	xmm1, xmm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	xmm1, xmm4, XMMWORD PTR [edx+4064]	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	xmm1, xmm4, XMMWORD PTR [edx+4096]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	xmm1, xmm4, XMMWORD PTR [edx-4096]	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	xmm1, xmm4, XMMWORD PTR [edx-4128]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1, ymm4, [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1{k7}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1{k7}{z}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1, ymm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1, ymm4, XMMWORD PTR [edx+4064]	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	ymm1, ymm4, XMMWORD PTR [edx+4096]	 # AVX512{_4FMAPS,VL}
	v4fmaddps	ymm1, ymm4, XMMWORD PTR [edx-4096]	 # AVX512{_4FMAPS,VL} Disp8
	v4fmaddps	ymm1, ymm4, XMMWORD PTR [edx-4128]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1, xmm4, [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1{k7}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1{k7}{z}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1, xmm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1, xmm4, XMMWORD PTR [edx+4064]	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	xmm1, xmm4, XMMWORD PTR [edx+4096]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	xmm1, xmm4, XMMWORD PTR [edx-4096]	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	xmm1, xmm4, XMMWORD PTR [edx-4128]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1, ymm4, [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1{k7}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1{k7}{z}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1, ymm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1, ymm4, XMMWORD PTR [edx+4064]	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	ymm1, ymm4, XMMWORD PTR [edx+4096]	 # AVX512{_4FMAPS,VL}
	v4fnmaddps	ymm1, ymm4, XMMWORD PTR [edx-4096]	 # AVX512{_4FMAPS,VL} Disp8
	v4fnmaddps	ymm1, ymm4, XMMWORD PTR [edx-4128]	 # AVX512{_4FMAPS,VL}
