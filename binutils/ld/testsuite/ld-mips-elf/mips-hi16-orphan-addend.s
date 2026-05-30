	.text
	.globl	fun1
	.ent	fun1
fun1:
	li	$2, %lo(var1 + 0x12345677)
	li	$4, %dtprel_lo(var2 + 0x12345677)
	li	$6, %tprel_lo(var3 + 0x12345677)
	jr	$31
	.end	fun1

	.globl	fun2
	.ent	fun2
fun2:
# Prevent from the end of `fun1' overrunning the beginning of `fun2'
# causing the wrong function name to be printed due to an oddity in
# ISA bit handling.
	nop
	li	$7, %tprel_hi(var3 + 0xb1a29384)
	li	$6, %tprel_hi(var3 + 0x12345678)
	li	$5, %dtprel_hi(var2 + 0xb1a29384)
	li	$4, %dtprel_hi(var2 + 0x12345678)
	li	$3, %hi(var1 + 0xb1a29384)
	li	$2, %hi(var1 + 0x12345678)
	jr	$31
	.end	fun2

# Force some (non-delay-slot) zero bytes, to make 'objdump' print ...
	.space	16
	.align	4, 0
