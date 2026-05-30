	.cfi_sections .sframe
	.cfi_startproc
	stg	%r14,112(%r15)
	.cfi_rel_offset 14, 112
	stg	%r11,88(%r15)
	.cfi_rel_offset 11, 88
	la	%r11,0
	la	%r14,0
.Lreturn:
	lg	%r11,88(%r15)
	.cfi_restore 11
	lg	%r14,112(%r15)
	.cfi_restore 14
	br	%r14
	.cfi_endproc
