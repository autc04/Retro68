	.text
	.globl	fun1
	.ent	fun1
fun1:
	li	$2, %pcrel_lo(var1 + 0xb1a29384)
	li	$3, %pcrel_lo(var2 + 0x12345678)
	jr	$31
	.end	fun1

	.globl	fun2
	.ent	fun2
fun2:
	auipc	$2, %pcrel_hi(var1 + 0xb1a29384)
	auipc	$3, %pcrel_hi(var2 + 0x12345678)
	jr	$31
	.end	fun2

	# Force some (non-delay-slot) zero bytes, to make 'objdump' print ...
	.align	4, 0
	.space	16
