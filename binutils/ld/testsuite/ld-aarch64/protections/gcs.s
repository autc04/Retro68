	.text
	.globl _start
	.type _start,@function
_start:
	mov x1, #2
	bl foo

.ifdef __splitted_gnu_properties__
.include "gnu-note-properties-selectable-split.inc"
.else
.include "gnu-note-properties-selectable-merged.inc"
.endif
