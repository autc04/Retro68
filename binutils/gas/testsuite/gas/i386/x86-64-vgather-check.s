# Check vgather instructions

	.text
vgather:
	vgatherdps %xmm2,(%rax,%xmm1,1),%xmm0
	vgatherdps %xmm2,(%rax,%xmm1,2),%xmm2
	vgatherdps %xmm2,(%rax,%xmm1,2),%xmm10
	vgatherdps %xmm1,(%rax,%xmm1,4),%xmm0
	vgatherdps %xmm9,(%rax,%xmm1,4),%xmm0
	vgatherdps %xmm2,(%rax,%xmm1,8),%xmm1
	vgatherdps %xmm2,(%rax,%xmm1,8),%xmm9
