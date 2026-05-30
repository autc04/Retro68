# Input file mimicking the start of frame FDE
# When linked with other "special" case FDEs like signal frame,
# this is a useful test for sframe_encoder's merge input sections
# functionality and its associated write code-paths (sframe_encoder_write)
	.text
	.globl	_start
	.type	_start, @function
_start:
	.cfi_startproc
	.cfi_undefined rip
	xor	%rbp, %rbp
	call	foo
	.cfi_endproc
	.size	_start, .-_start
	.section	.note.GNU-stack,"",@progbits
