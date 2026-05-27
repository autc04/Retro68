	.text
	.globl _start
	.type _start,@function
_start:
	.cfi_startproc
	.cfi_remember_state
	# Save used call-saved registers.
	stm	%r12,%r15,48(%r15)
	.cfi_rel_offset %r12, 48
	.cfi_rel_offset %r13, 52
	.cfi_rel_offset %r14, 56
	.cfi_rel_offset %r15, 60
	# Allocate stack frame and maintain backchain.
	lr	%r0,%r15
	ahi	%r15,-96
	.cfi_adjust_cfa_offset 96
	st	%r0,0(%r15)
	# Setup literal pool pointer in r13.
	bras	%r13,.Llp_end
.Llp:
.Llpgot: .long	_GLOBAL_OFFSET_TABLE_-.Llp
.Llpfoo: .long	foo@plt
.Llpbar: .long	bar@plt
.Llp_end:
	# Setup GOT pointer in r12.
	l	%r12,.Llpgot-.Llp(%r13)		# _GLOBAL_OFFSET_TABLE_
	alr	%r12,%r13
	# Call foo via PLT.
	l	%r1,.Llpfoo-.Llp(%r13)		# foo@plt
	basr	%r14,%r1
	# Call bar via PLT.
	l	%r1,.Llpbar-.Llp(%r13)		# bar@plt
	basr	%r14,%r1
	# Free stack frame and restore used call-saved registers.
	lm	%r12,%r15,96+48(%r15)
	.cfi_restore_state
	# Return to caller with return code 0.
	xr	%r2,%r2
	br	%r14
	.cfi_endproc
