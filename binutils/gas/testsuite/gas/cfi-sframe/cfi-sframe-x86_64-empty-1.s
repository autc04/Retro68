## CFI_escape may be used to encode DWARF expressions among other things.
## In this test, a DWARF expression involving a register of interest (REG_SP on
## x86_64, which is also the CFA in the current FRE) is seen.  SFrame
## generation, is skipped and a warning issued to the user.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
# DW_CFA_expression,reg 0x7,length 2,DW_OP_breg6,SLEB(-8)
	.cfi_escape 0x10,0x7,0x2,0x76,0x78
	.long 0
	.cfi_endproc
