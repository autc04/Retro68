	.align	2
	.globl	_start
	.type	_start, @function
_start:
	.cfi_startproc
	addi.d	$sp,$sp,-16
	.cfi_def_cfa_offset 16
	st.d	$fp,$sp,8
	.cfi_offset 22, -8
	addi.d	$fp,$sp,16
	.cfi_def_cfa 22, 0
	or	$t0,$zero,$zero
	or	$a0,$t0,$zero
	ld.d	$fp,$sp,8
	.cfi_restore 22
	addi.d	$sp,$sp,16
	.cfi_def_cfa_register 3
	jr	$ra
	.cfi_endproc
	.size	_start, .-_start
