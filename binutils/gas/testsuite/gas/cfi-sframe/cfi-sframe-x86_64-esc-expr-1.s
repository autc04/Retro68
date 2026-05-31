	.p2align 4
	.globl	_ITM_RM256
	.type	_ITM_RM256, @function
_ITM_RM256:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa r10, 0
	andq	$-32, %rsp
	movq	%rdi, %rdx
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	# DW_CFA_expression, (uleb)reg, length, DW_OP_breg6, (sleb)offset
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r10
	# DW_CFA_def_cfa_expression, length, DW_OP_breg6, (sleb)offset, DW_OP_deref
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$48, %rsp

	movq	%fs:(80+1*8),%rdi
	rorq	$17,%rdi
	xorq	%fs:48,%rdi

	movq	(%rdi), %rax
	leaq	-48(%rbp), %rsi
	pushq	$1
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$32, %ecx
	call	*608(%rax)

	movq	-8(%rbp), %r10
	.cfi_def_cfa r10, 0
	vmovaps	-48(%rbp), %ymm0
	popq	%rax
	popq	%rdx
	leave
	leaq	-8(%r10), %rsp
	.cfi_def_cfa rsp, 8
	ret
	.cfi_endproc
	.size	_ITM_RM256, .-_ITM_RM256
