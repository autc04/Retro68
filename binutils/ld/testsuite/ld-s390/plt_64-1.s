	.text
	.globl _start
	.type _start,@function
_start:
	.cfi_startproc
	.cfi_remember_state
	# Save used call-saved registers.
	stmg	%r14,%r15,112(%r15)
	.cfi_rel_offset %r14, 112
	.cfi_rel_offset %r15, 120
	# Allocate stack frame and maintain backchain.
	lgr	%r0,%r15
	aghi	%r15,-160
	.cfi_adjust_cfa_offset 160
	stg	%r0,0(%r15)
	# Call foo via PLT.
	brasl	%r14,foo@plt
	# Call bar via PLT.
	brasl	%r14,bar@plt
	# Free stack frame and restore used call-saved registers.
	lmg	%r14,%r15,160+112(%r15)
	.cfi_restore_state
	# Return to caller with return code 0.
	xgr	%r2,%r2
	br	%r14
	.cfi_endproc
