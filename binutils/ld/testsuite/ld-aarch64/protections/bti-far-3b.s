	.text
	.hidden	a_func
	.hidden	b_func
	.hidden	c_func

.zero	0x01000000

	.global	b_func
	.type	b_func, %function
b_func:
	b	c_func
	b	a_func

.zero	0x07000000

.include "gnu-note-properties-selectable-merged.inc"
