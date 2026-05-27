# Check instructions do not need {evex} prefix under memory operand

	.text
_start:
	vpsrlw	$0x1f,(%eax,%ecx,4),%xmm0
	vpsraw	$0x1f,(%eax,%ecx,4),%xmm0
	vpsllw	$0x1f,(%eax,%ecx,4),%xmm0
	vpsrad	$0x1f,(%eax,%ecx,4),%xmm0
	vpsraq	$0x1f,(%eax,%ecx,4),%xmm0
	vpsraq	$0x1f,%xmm1,%xmm0
	vpsraq	(%eax,%ecx,4),%xmm1,%xmm0
	vpsraq	%xmm2,%xmm1,%xmm0
	vpsrldq	$0x1f,(%eax,%ecx,4),%xmm0
	vpslldq	$0x1f,(%eax,%ecx,4),%xmm0
	vpsrld	$0x1f,(%eax,%ecx,4),%xmm0
	vpslld	$0x1f,(%eax,%ecx,4),%xmm0
	vpsrlq	$0x1f,(%eax,%ecx,4),%xmm0
	vpsllq	$0x1f,(%eax,%ecx,4),%xmm0
