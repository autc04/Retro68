	.data
	.type	bar, @object
bar:
	.byte	1
	.size	bar, .-bar

	.text
	.globl	_start
	.type	_start, @function
_start:
	# Other insns must not be accidentally transformed.
	adc	0, %al
	.reloc .-4, R_386_GOT32X, bar
	imul	$1, 0, %eax
	.reloc .-5, R_386_GOT32X, bar
	test	%dh, 0
	.reloc .-4, R_386_GOT32X, bar
	xchg	0, %eax
	.reloc .-4, R_386_GOT32X, bar

	.size	_start, .-_start
