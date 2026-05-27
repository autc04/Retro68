	.text
	.globl	fun1
	.ent	fun1
fun1:
	li	$2, %lo(var1 + 0x12345678)
	li	$3, %lo(var1 + 0xb1a29384)
	li	$4, %dtprel_lo(var2 + 0x12345678)
	li	$5, %dtprel_lo(var2 + 0xb1a29384)
	li	$6, %tprel_lo(var3 + 0x12345678)
	li	$7, %tprel_lo(var3 + 0xb1a29384)
	jr	$31
	.end	fun1

	.set	push
	.ifdef	micromips
	.set	micromips
	.else
	.set	mips16
	.endif

	.globl	fun2
	.ent	fun2
fun2:
	li	$2, %lo(var1 + 0x12345678)
	li	$3, %lo(var1 + 0xb1a29384)
	li	$4, %dtprel_lo(var2 + 0x12345678)
	li	$5, %dtprel_lo(var2 + 0xb1a29384)
	li	$6, %tprel_lo(var3 + 0x12345678)
	li	$7, %tprel_lo(var3 + 0xb1a29384)
	jr	$31
	.end	fun2

	.set	pop
	.align	2

	.globl	fun3
	.ent	fun3
fun3:
	li	$7, %tprel_hi(var3 + 0xb1a29384)
	li	$6, %tprel_hi(var3 + 0x12345678)
	li	$5, %dtprel_hi(var2 + 0xb1a29384)
	li	$4, %dtprel_hi(var2 + 0x12345678)
	li	$3, %hi(var1 + 0xb1a29384)
	li	$2, %hi(var1 + 0x12345678)
	jr	$31
	.end	fun3

	.set	push
	.ifdef	micromips
	.set	micromips
	.else
	.set	mips16
	.endif

	.globl	fun4
	.ent	fun4
fun4:
	li	$7, %tprel_hi(var3 + 0xb1a29384)
	li	$6, %tprel_hi(var3 + 0x12345678)
	li	$5, %dtprel_hi(var2 + 0xb1a29384)
	li	$4, %dtprel_hi(var2 + 0x12345678)
	li	$3, %hi(var1 + 0xb1a29384)
	li	$2, %hi(var1 + 0x12345678)
	jr	$31
	.end	fun4

	.set	pop
	.align	2

# Force some (non-delay-slot) zero bytes, to make 'objdump' print ...
	.space	16
	.align	4, 0
