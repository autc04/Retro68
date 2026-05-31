## CFI_escape may be used to encode DWARF expressions among other things.
## In this test, a DWARF expression involving a register of interest (REG_SP on
## x86_64, which is also the CFA in the current FRE) is seen.  SFrame
## generation, is skipped and a warning issued to the user.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
# DW_CFA_val_offset,rbp,ULEB scaled offset(16)
	.cfi_escape 0x14,0x6,0x2
	.long 0
	.cfi_endproc
