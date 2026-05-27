	.text
	.globl _start
_start:
	kmovd %gs:foo@tpoff,%k0
	kmovd foo@tpoff(%eax),%k0
	kmovd %gs:foo@ntpoff,%k0
	kmovd foo@ntpoff(%eax),%k0
	.globl foo
	.section	.tdata,"awT",@progbits
	.align 4
	.type	foo, @object
	.size	foo, 4
foo:
	.long	100
