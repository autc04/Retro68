	.text
	.hidden	a_func
	.hidden	b_func
	.hidden	c_func

.zero	0x01000000

	.global	c_func
	.type	c_func, %function
c_func:
	b	a_func
	b	b_func
	b	extern_func

.include "gnu-note-properties-selectable-merged.inc"
