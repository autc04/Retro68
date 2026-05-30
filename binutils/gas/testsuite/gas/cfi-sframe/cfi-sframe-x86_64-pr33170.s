# PR gas/33170
# Ennsure graceful handling.
	.section  .text.unlikely
	.cfi_startproc
	.type    XZ.cold, @function
XZ.cold:
.L1:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
.L2:
	.cfi_restore 12
	.cfi_restore 13
	movl   $56, %esi
	movq   %r14, %rdi
	call   _Z@PLT
	movq   %r12, -32(%rbp)
	movq   %r13, -24(%rbp)
	movq   %r14, -16(%rbp)
	movq   %r15, -8(%rbp)
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	jne    .L3
	movq   %rbx, %rdi
	call   bar@PLT
.L3:
	movq   -32(%rbp), %r12
	.cfi_remember_state
	.cfi_restore 12
	jmp    .L4
.L4:
	.cfi_restore_state
	call   _ZF@PLT
	.cfi_endproc
