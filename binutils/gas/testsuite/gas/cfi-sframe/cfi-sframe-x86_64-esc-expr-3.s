# Testcase for transition of tracked entity (rbp) from DWARF expression, to
# register, and finally to CFA+offset.
	.type	foo, @function
foo:
	.cfi_startproc
	.long 0
	.cfi_adjust_cfa_offset 0x20
	.long 0
	# DW_CFA_expression, (uleb)reg, length, DW_OP_breg6, (sleb)offset
	.cfi_escape 0x10,0x6,0x2,0x76,sleb128(48)
	.long 0
	.cfi_register rbp, 3
	.long 0
	.cfi_offset rbp, 16
	.cfi_def_cfa rsp, 8
	ret
	.cfi_endproc
	.size	foo, .-foo
