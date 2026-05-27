	.data
	.type	bar, @object
bar:
	.byte	1
	.size	bar, .-bar
	.globl	foo
	.type	foo, @object
foo:
	.byte	1
	.size	foo, .-foo
	.text
	.globl	_start
	.type	_start, @function
_start:
	# Other insns must not be accidentally transformed.
	adc	1f(%rip), %al
1:	.reloc .-4, R_X86_64_GOTPCRELX, bar-4
	test	%r15b, 1f(%rip)
1:	.reloc .-4, R_X86_64_REX_GOTPCRELX, bar-4
	xchg	1f(%rip), %rax
1:	.reloc .-4, R_X86_64_REX_GOTPCRELX, bar-4
	lsl	1f(%rip), %r16d
1:	.reloc .-4, R_X86_64_CODE_4_GOTPCRELX, bar-4
	{rex2} movlps %xmm0, 1f(%rip)
1:	.reloc .-4, R_X86_64_CODE_4_GOTPCRELX, bar-4
	{rex2} movntps %xmm0, 1f(%rip)
1:	.reloc .-4, R_X86_64_CODE_4_GOTPCRELX, bar-4

	.size	_start, .-_start
