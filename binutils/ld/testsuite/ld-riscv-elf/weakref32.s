	.option nopic
	.text
	.align	1
	.globl	_start
	.type	_start, @function
_start:
	lla	a5,f
	beqz	a5,.L1
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	f
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	f
.L1:
	ret
	.size	_start, .-_start
	.weak	f
