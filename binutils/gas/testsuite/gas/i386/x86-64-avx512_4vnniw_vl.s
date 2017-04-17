# Check 64bit AVX512{_4VNNIW,VL} instructions

	.allow_index_reg
	.text
_start:
	vp4dpwssd	(%rcx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%rcx), %xmm8, %xmm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%rcx), %xmm8, %xmm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-123456(%rax,%r14,8), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	4064(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	4096(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-4096(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	-4128(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%rcx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%rcx), %ymm8, %ymm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	(%rcx), %ymm8, %ymm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-123456(%rax,%r14,8), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	4064(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	4096(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	-4096(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	-4128(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%rcx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%rcx), %xmm8, %xmm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%rcx), %xmm8, %xmm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-123456(%rax,%r14,8), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	4064(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	4096(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-4096(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	-4128(%rdx), %xmm8, %xmm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%rcx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%rcx), %ymm8, %ymm1{%k7}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	(%rcx), %ymm8, %ymm1{%k7}{z}	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-123456(%rax,%r14,8), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	4064(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	4096(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	-4096(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	-4128(%rdx), %ymm8, %ymm1	 # AVX512{_4VNNIW,VL}

	.intel_syntax noprefix
	vp4dpwssd	xmm1, xmm8, [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1{k7}, xmm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1{k7}{z}, xmm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm8, XMMWORD PTR [rax+r14*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm8, XMMWORD PTR [rdx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	xmm1, xmm8, XMMWORD PTR [rdx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	xmm1, xmm8, XMMWORD PTR [rdx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	xmm1, xmm8, XMMWORD PTR [rdx-4128]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm8, [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1{k7}, ymm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1{k7}{z}, ymm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm8, XMMWORD PTR [rax+r14*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm8, XMMWORD PTR [rdx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	ymm1, ymm8, XMMWORD PTR [rdx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssd	ymm1, ymm8, XMMWORD PTR [rdx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssd	ymm1, ymm8, XMMWORD PTR [rdx-4128]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm8, [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1{k7}, xmm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1{k7}{z}, xmm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm8, XMMWORD PTR [rax+r14*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm8, XMMWORD PTR [rdx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	xmm1, xmm8, XMMWORD PTR [rdx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	xmm1, xmm8, XMMWORD PTR [rdx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	xmm1, xmm8, XMMWORD PTR [rdx-4128]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm8, [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1{k7}, ymm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1{k7}{z}, ymm8, XMMWORD PTR [rcx]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm8, XMMWORD PTR [rax+r14*8-123456]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm8, XMMWORD PTR [rdx+4064]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	ymm1, ymm8, XMMWORD PTR [rdx+4096]	 # AVX512{_4VNNIW,VL}
	vp4dpwssds	ymm1, ymm8, XMMWORD PTR [rdx-4096]	 # AVX512{_4VNNIW,VL} Disp8
	vp4dpwssds	ymm1, ymm8, XMMWORD PTR [rdx-4128]	 # AVX512{_4VNNIW,VL}
