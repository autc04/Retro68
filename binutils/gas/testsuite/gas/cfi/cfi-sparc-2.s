	.data
	.byte %r_disp8(1f-1)
	.byte 0x50
1:

	.text
func:
	.cfi_startproc
	nop
	.cfi_escape 0x10	! DW_CFA_expression
	.cfi_escape 0		! reg0
	.cfi_escape %r_disp8(.Lend-1)
	.cfi_escape 0x50	! DW_OP_reg0
	.cfi_label .Lend
	ret
	.cfi_endproc
