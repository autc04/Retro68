	.globl	foo
	.ent	foo
foo:
	eret
	.end	foo

	.globl	bar
	.ent	bar
bar:
	beq	$4,$0,1f
	sw	$4,0($5)
1:
	jr	$31
	.end	bar
