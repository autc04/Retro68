	.cfi_sections .sframe
	.cfi_startproc
	stg	%r11,88(%r15)
	.cfi_rel_offset 11, 88
	stg	%r14,112(%r15)
	.cfi_rel_offset 14, 112
	la	%r11,0
	la	%r14,0
.Lreturn:
	lg	%r14,112(%r15)
	.cfi_restore 14
	lg	%r11,88(%r15)
	.cfi_restore 11
	br	%r14
	.cfi_endproc
