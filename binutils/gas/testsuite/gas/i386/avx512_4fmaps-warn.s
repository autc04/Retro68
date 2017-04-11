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
	v4fmaddss (%eax), %xmm0, %xmm6
	v4fmaddss (%eax), %xmm1, %xmm6
	v4fmaddss (%eax), %xmm2, %xmm6
	v4fmaddss (%eax), %xmm3, %xmm6
	v4fmaddss (%eax), %xmm4, %xmm6
	v4fnmaddss (%eax), %xmm0, %xmm6
	v4fnmaddss (%eax), %xmm1, %xmm6
	v4fnmaddss (%eax), %xmm2, %xmm6
	v4fnmaddss (%eax), %xmm3, %xmm6
	v4fnmaddss (%eax), %xmm4, %xmm6
