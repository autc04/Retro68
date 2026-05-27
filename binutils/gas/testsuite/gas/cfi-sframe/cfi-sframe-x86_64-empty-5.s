# Currently, SFrame does not track REG_SP explicitly.  Ensure graceful
# behaviour: generate no SFrame FDE for the function, and warn the user.
	.cfi_startproc
	.long 0
	.cfi_def_cfa_offset 16
	.cfi_register rsp, rcx
	.long 0
	.cfi_endproc
