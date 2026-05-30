	.arch armv8-a+memtag
	.text
	.align	2
	.global	foo
	.type	foo, %function
foo:
	.cfi_startproc
	.cfi_mte_tagged_frame
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	.cfi_endproc
	.size	foo, .-foo
	.align	2
	.global	bar
	.type	bar, %function
bar:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	.cfi_endproc
