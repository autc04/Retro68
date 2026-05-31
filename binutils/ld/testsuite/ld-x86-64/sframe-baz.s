	.text
	.globl	baz
	.type	baz, @function
baz:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call    foo
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size	baz, .-baz

	.global qux
	.type   qux, @function
qux:
	.cfi_startproc
	nop
	ret
	.cfi_endproc
	.size   qux, .-qux

        .global _start
        .type _start,%function
_start:
	.cfi_startproc
        mov     bar@GOTPCREL(%rip), %rax
        mov     foo@GOTPCREL(%rip), %rax
	.cfi_endproc
        .size _start, . - _start

	.section	.note.GNU-stack,"",@progbits
