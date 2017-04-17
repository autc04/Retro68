# Check warnings for invalid usage of register group

.text
	v4fmaddps (%rax), %xmm0, %xmm10
	v4fmaddps (%rax), %xmm1, %xmm10
	v4fmaddps (%rax), %xmm2, %xmm10
	v4fmaddps (%rax), %xmm3, %xmm10
	v4fmaddps (%rax), %xmm4, %xmm10
	v4fnmaddps (%rax), %xmm0, %xmm10
	v4fnmaddps (%rax), %xmm1, %xmm10
	v4fnmaddps (%rax), %xmm2, %xmm10
	v4fnmaddps (%rax), %xmm3, %xmm10
	v4fnmaddps (%rax), %xmm4, %xmm10
	v4fmaddps (%rax), %ymm0, %ymm10
	v4fmaddps (%rax), %ymm1, %ymm10
	v4fmaddps (%rax), %ymm2, %ymm10
	v4fmaddps (%rax), %ymm3, %ymm10
	v4fmaddps (%rax), %ymm4, %ymm10
	v4fnmaddps (%rax), %ymm0, %ymm10
	v4fnmaddps (%rax), %ymm1, %ymm10
	v4fnmaddps (%rax), %ymm2, %ymm10
	v4fnmaddps (%rax), %ymm3, %ymm10
	v4fnmaddps (%rax), %ymm4, %ymm10
