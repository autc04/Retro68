# Check 32bit AVX512{_4VNNIW,VL} instructions

	.allow_index_reg
	.text
_start:
	vp4dpwssd	(%ecx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%ecx), %xmm4, %xmm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%ecx), %xmm4, %xmm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-123456(%esp,%esi,8), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	4064(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	4096(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-4096(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	-4128(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%ecx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%ecx), %ymm4, %ymm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%ecx), %ymm4, %ymm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-123456(%esp,%esi,8), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	4064(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	4096(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-4096(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	-4128(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%ecx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%ecx), %xmm4, %xmm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%ecx), %xmm4, %xmm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-123456(%esp,%esi,8), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	4064(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	4096(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-4096(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	-4128(%edx), %xmm4, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%ecx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%ecx), %ymm4, %ymm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%ecx), %ymm4, %ymm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-123456(%esp,%esi,8), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	4064(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	4096(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-4096(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	-4128(%edx), %ymm4, %ymm1	 # AVX512{_4VNNIW,VL}

	.intel_syntax noprefix
	vp4dpwssd	xmm1, xmm4, [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1{k7}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1{k7}{z}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm4, XMMWORD PTR [edx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	xmm1, xmm4, XMMWORD PTR [edx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm4, XMMWORD PTR [edx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	xmm1, xmm4, XMMWORD PTR [edx-4128]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm4, [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1{k7}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1{k7}{z}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm4, XMMWORD PTR [edx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	ymm1, ymm4, XMMWORD PTR [edx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm4, XMMWORD PTR [edx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	ymm1, ymm4, XMMWORD PTR [edx-4128]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm4, [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1{k7}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1{k7}{z}, xmm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm4, XMMWORD PTR [edx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	xmm1, xmm4, XMMWORD PTR [edx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm4, XMMWORD PTR [edx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	xmm1, xmm4, XMMWORD PTR [edx-4128]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm4, [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1{k7}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1{k7}{z}, ymm4, XMMWORD PTR [ecx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm4, XMMWORD PTR [esp+esi*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm4, XMMWORD PTR [edx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	ymm1, ymm4, XMMWORD PTR [edx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm4, XMMWORD PTR [edx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	ymm1, ymm4, XMMWORD PTR [edx-4128]	 # AVX512{_4VNNIW,VL}
