# Testcase with FLEX FDE generation due to RA using reg on AMD64
# Also, tagged as outermost frame.
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register rbp
	nop
	.cfi_register rip, rbx
	nop
	.cfi_undefined rip
	.cfi_def_cfa rsp, 8
	ret
	.cfi_endproc
