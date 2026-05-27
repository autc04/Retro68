	.text
	.globl func2
	.type func2,@function
func2:
	bl foo2
	bl bar2
	ret
	.size	func2, .-func2

.ifdef __split_gnu_properties__
.include "gnu-note-properties-selectable-split.inc"
.else
.include "gnu-note-properties-selectable-merged.inc"
.endif
