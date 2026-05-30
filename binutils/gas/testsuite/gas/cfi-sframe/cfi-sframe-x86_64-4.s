# Code from /usr/bin/qemu-hppa-static
#
# 00049214 0000000000000030 00000050 FDE cie=000491c8 pc=0000000000616870..0000000000616c5f
#    LOC           CFA      rbx   ra
# 0000000000616870 rsp+24   u     c-8
# 0000000000616878 rsp+56   u     c-8
# 000000000061687c rsp+56   c-56  c-8
# 0000000000616884 rbx+56   c-56  c-8
# 0000000000616b86 rsp+56   u     c-8
# 0000000000616b8a rsp+8    u     c-8
# 0000000000616b8d rbx+56   c-56  c-8
# 0000000000616c5a rsp+56   u     c-8
# 0000000000616c5e rsp+8    u     c-8
	.p2align 4
	.globl	foo
	.type	foo, @function
foo:
	.cfi_startproc
	endbr64
	sub	$0x20,%rsp
	.cfi_adjust_cfa_offset 0x20
	mov	%rbx,(%rsp)
	.cfi_offset 0x3, 56
	mov	%rax,0x8(%rsp)
	mov	%rsp,%rbx
	.cfi_def_cfa_register rbx
	.cfi_remember_state
	and	$0xffffffffffffffe0,%rsp
	sub	$0x380,%rsp
	mov	%rsp,0x18(%rbx)
	mov	%rdx,(%rsp)
	mov	%r8,0x8(%rsp)
	mov	%r9,0x10(%rsp)
	mov	%rcx,0x18(%rsp)
	mov	%rsi,0x20(%rsp)
	mov	%rdi,0x28(%rsp)
	mov	%rbp,0x30(%rsp)
	lea	0x30(%rbx),%rax
	mov	%rax,0x38(%rsp)
	vmovdqa	%xmm0,0x40(%rsp)

	mov	0x10(%rbx),%rcx
	test	%rcx,%rcx
	jns	0x616b8d
	mov	0x18(%rsp),%rcx
	mov	0x20(%rsp),%rsi
	mov	0x28(%rsp),%rdi
	mov	%rbx,%rsp
	.cfi_def_cfa_register rsp
	mov	(%rsp),%rbx
	add	$0x30,%rsp
	.cfi_adjust_cfa_offset -0x30
	jmp	*%r11
	.cfi_restore_state
	lea	0x38(%rbx),%rsi
	add	$0x8,%rcx
	and	$0xfffffffffffffff0,%rcx
	sub	%rcx,%rsp
	mov	%rsp,%rdi
	rep movsb (%rsi),(%rdi)
	mov	0x18(%rdi),%rcx
	mov	0x20(%rdi),%rsi
	mov	0x28(%rdi),%rdi
	call   *%r11

	inc	%si
	jne	0x616c4b
	vmovdqa	0x90(%rsp),%ymm1

	fldt	0x40(%rsp)
	fldt	0x30(%rsp)
	mov	%rbx,%rsp
	mov	(%rsp),%rbx
	.cfi_def_cfa_register rsp
	.cfi_restore rbx
	add	$0x30,%rsp
	.cfi_adjust_cfa_offset -0x30
	ret
	.cfi_endproc
	.size	foo, .-foo
