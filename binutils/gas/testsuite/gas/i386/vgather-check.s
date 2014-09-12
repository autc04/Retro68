# Check vgather instructions

	.text
vgather:
	vgatherdps %xmm2,(%eax,%xmm1,1),%xmm0
	vgatherdps %xmm2,(%eax,%xmm1,2),%xmm2
	vgatherdps %xmm1,(%eax,%xmm1,4),%xmm0
	vgatherdps %xmm2,(%eax,%xmm1,8),%xmm1
