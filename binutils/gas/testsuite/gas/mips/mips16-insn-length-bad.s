	.set	mips16
foo:
	break.
	entry.
	addiu.	$2, 0x7fff
	addiu.	$3, $2, 0
	exit.ex
	exit.tx
	nop.ey
	nop.ty
	li.ez	$2, 0
	li.tz	$2, 0

# Force some (non-delay-slot) zero bytes, to make 'objdump' print ...
	.align	4, 0
	.space	16
