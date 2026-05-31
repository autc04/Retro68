	.abicalls
	.text
	.align	2
	.globl	__tls_get_addr
	.ent	__tls_get_addr
	.type	__tls_get_addr, @function
__tls_get_addr:
	.frame	$sp,0,$31
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	__tls_get_addr
	.size	__tls_get_addr, .-__tls_get_addr
	.align	2
	.globl	__start
	.ent	__start
	.type	__start, @function
__start:
	.frame	$sp,16,$31
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-16
	lw	$25,%call16(__tls_get_addr)($28)
	addiu	$4,$28,%tlsgd(var)
	sw	$31,12($sp)
	.cprestore	0
	.reloc	1f,R_MIPS_JALR,__tls_get_addr
1:	jalr	$25
	nop

	lw	$31,12($sp)
	lw	$2,0($2)
	jr	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	__start
	.size	__start, .-__start
	.weak	var
	.hidden	var
	.section	.note.GNU-stack,"",@progbits
