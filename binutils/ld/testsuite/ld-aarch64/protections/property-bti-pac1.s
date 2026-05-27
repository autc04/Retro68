	.text
	.globl _start
	.type _start,@function
_start:
	mov x1, #2
	bl foo

.ifdef __split_gnu_properties__
.include "gnu-note-properties-maskable-split.inc"
.else
.include "gnu-note-properties-maskable-merged.inc"
.endif
