	.code16
	.arch i8086,nojumps

	.section .text.other, "ax", @progbits
other:
	js	early
	ret

	.text
early:
	jc	late
	jo	undef
	jp	other
	.nops 125
late:
	jz	early
	.arch i8086,jumps
	jnz	other
	jz	undef
	js	early
	ret
