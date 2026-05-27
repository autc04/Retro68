	.text
	.globl	main
	.type	main, @function
main:
	beq	$a0,$a1,%b16(fun1)
	beqz	$a0,%b21(fun1)
	bl	%b26(fun1)
