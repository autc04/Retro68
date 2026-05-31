	.text
	.global	_start
	.type	_start, %function
_start:
	bl foo
	bl bar
	bl baz
baz:
	ret

	.section	.far,"ax",@progbits
	.global	foo
	.type	foo, %function
foo:
	bl baz
bar:
	bl baz
	bl foo

.include "gnu-note-properties-selectable-merged.inc"
