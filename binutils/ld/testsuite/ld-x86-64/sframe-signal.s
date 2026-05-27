# Input file with SFrame FDE for a signal trampoline
# When linked with other "special" case FDEs like start frame,
# this is a useful test for sframe_encoder's merge input sections
# functionality and its associated write code-paths (sframe_encoder_write)
	.text
	.globl	rest_rt
	.type	rest_rt, @function
rest_rt:
	.cfi_startproc
	.cfi_signal_frame
	# DW_CFA_def_cfa_expression, length, DW_OP_breg9, (sleb)offset, DW_OP_deref
	.cfi_escape 0xf,0x3,0x79,0x78,0x6
	nop
	.cfi_offset rbp, -16
	ret
	.cfi_endproc
	.size	rest_rt, .-rest_rt
	.section	.note.GNU-stack,"",@progbits
