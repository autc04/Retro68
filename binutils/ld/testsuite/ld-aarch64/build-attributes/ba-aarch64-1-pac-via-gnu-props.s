	.text
	.globl foo3
	.type foo3,@function
foo3:
	bl foo_3

.ifdef __split_gnu_properties__
.include "gnu-note-properties-selectable-split.inc"
.else
.include "gnu-note-properties-selectable-merged.inc"
.endif
