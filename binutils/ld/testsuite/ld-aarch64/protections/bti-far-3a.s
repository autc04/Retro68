	.text
	.hidden	a_func
	.hidden	b_func
	.hidden	c_func

	.global	a_func
	.type	a_func, %function
a_func:
	b	b_func
	b	extern_func

.zero	0x07000000

.include "gnu-note-properties-selectable-merged.inc"
