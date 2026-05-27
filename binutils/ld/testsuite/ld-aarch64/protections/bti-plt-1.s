	.text
	.globl _start
	.type _start,@function
_start:
	bl foo
	bl bar

.ifdef __split_gnu_properties__
.include "gnu-note-properties-selectable-split.inc"
.else
.include "gnu-note-properties-selectable-merged.inc"
.endif
