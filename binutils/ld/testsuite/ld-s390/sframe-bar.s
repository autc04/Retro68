	.text
	.globl	bar
	.type	bar, @function
bar:
	.cfi_startproc
	stmg	%r14,%r15,112(%r15)
	.cfi_rel_offset %r14, 112
	.cfi_rel_offset %r15, 120
	lay	%r15,-160(%r15)
	.cfi_adjust_cfa_offset 160
	clgfi	%r2,1000
	jle	.Lreturn
	brasl	%r14,foo@PLT
.Lreturn:
	lay	%r15,160(%r15)
	.cfi_adjust_cfa_offset -160
	lg	%r14,112(%r15)
	.cfi_restore %r14
	br	%r14
	.cfi_endproc
	.size	bar, .-bar
