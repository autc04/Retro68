## CFI_escape may be used to encode DWARF expressions among other things.
## Depending on the register applicable for the DWARF expression, skipping
## SFrame FDE may be OK: SFrame stack trace information is relevant for SP, FP
## and RA only.  In this test, CFI_escape is safe to skip (does not affect
## correctness of SFrame data).  The register 0xc is non SP / FP on both
## aarch64 and x86_64.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
# DW_CFA_expression,reg 0xc,length 2,DW_OP_breg6,SLEB(-8)
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
# DW_CFA_nop
	.cfi_escape 0x0
	.cfi_escape 0x0,0x0,0x0,0x0
# DW_CFA_val_offset,reg 0xc,ULEB scaled offset
	.cfi_escape 0x14,0xc,0x4
	.long 0
	.cfi_endproc
