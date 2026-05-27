	.globl	var
	.section	.tdata,"awT",@progbits
	.type	tls, @object
var:
	.word 1
	.text
	.globl	_start
_start:
	pcalau12i   $a0,%desc_pc_hi20(var)
	addi.d	    $a0,$a0,%desc_pc_lo12(var)
	ld.d	    $ra,$a0,%desc_ld(var)
	jirl	    $ra,$ra,%desc_call(var)

	pcalau12i   $t0,%ie_pc_hi20(var)
	ld.d	    $t0,$t0,%ie_pc_lo12(var)
