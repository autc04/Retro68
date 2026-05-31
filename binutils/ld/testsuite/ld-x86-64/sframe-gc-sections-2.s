# --gc-sections will clean up .text.bar, and there should be no
# SFrame stack trace information for it.
	.section	.text.start,"ax",@progbits
	.globl	start
	.type	start, @function
start:
	.cfi_startproc
	jmp	foo
	.cfi_endproc
	.size	start, .-start

	.section	.text.foo,"ax",@progbits
	.globl	foo
	.type	foo, @function
foo:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register %rbp
	leave
	.cfi_def_cfa %rsp, 8
	ret
	.cfi_endproc
	.size	foo, .-foo

	.section	.text.bar,"ax",@progbits
	.globl	bar
	.type	bar, @function
bar:
	.cfi_startproc
	ret
	.cfi_endproc
	.size	bar, .-bar
