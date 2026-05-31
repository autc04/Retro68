## CFI_escape may be used to encode DWARF expressions among other things.
## In this test, a stream of valid DWARF information is presented in a
## single CFI_escape.  Parsing such cases is currently not deemed worth the
## effort.  So, such cases are skipped for SFrame FDE generation and a
## warning issued to the user.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
# DW_CFA_val_offset,rcx,ULEB scaled offset(16), DW_CFA_expr,r10,length,DW_OP_deref,SLEB(-8)
	.cfi_escape 0x14,0x2,0x2,0x10,0xa,0x2,0x76,0x78
	.long 0
	.cfi_endproc
