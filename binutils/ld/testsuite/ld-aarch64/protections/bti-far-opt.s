	.text
	.global	_start
	.type	_start, %function
_start:
	bl foo
	bl bar
	bl baz
baz:
	nop
baz_bti_:
	bti
baz_bti_c:
	bti c
baz_bti_j:
	bti j
baz_bti_jc:
	bti jc
baz_paciasp:
	paciasp
baz_pacibsp:
	pacibsp

	.section	.far,"ax",@progbits
	.global	foo
	.type	foo, %function
foo:
	bl baz
	bl baz_bti_
	bl baz_bti_c
	bl baz_bti_j
	bl baz_bti_jc
	bl baz_paciasp
	bl baz_pacibsp
bar:
	b foo
	b baz
	b baz_bti_
	b baz_bti_c
	b baz_bti_j
	b baz_bti_jc
	b baz_paciasp
	b baz_pacibsp

.include "gnu-note-properties-selectable-merged.inc"
