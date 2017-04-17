# Check warnings for invalid usage of register group

.text
	v4fmaddps (%eax), %xmm0, %xmm6
	v4fmaddps (%eax), %xmm1, %xmm6
	v4fmaddps (%eax), %xmm2, %xmm6
	v4fmaddps (%eax), %xmm3, %xmm6
	v4fmaddps (%eax), %xmm4, %xmm6
	v4fnmaddps (%eax), %xmm0, %xmm6
	v4fnmaddps (%eax), %xmm1, %xmm6
	v4fnmaddps (%eax), %xmm2, %xmm6
	v4fnmaddps (%eax), %xmm3, %xmm6
	v4fnmaddps (%eax), %xmm4, %xmm6
	v4fmaddps (%eax), %ymm0, %ymm6
	v4fmaddps (%eax), %ymm1, %ymm6
	v4fmaddps (%eax), %ymm2, %ymm6
	v4fmaddps (%eax), %ymm3, %ymm6
	v4fmaddps (%eax), %ymm4, %ymm6
	v4fnmaddps (%eax), %ymm0, %ymm6
	v4fnmaddps (%eax), %ymm1, %ymm6
	v4fnmaddps (%eax), %ymm2, %ymm6
	v4fnmaddps (%eax), %ymm3, %ymm6
	v4fnmaddps (%eax), %ymm4, %ymm6
