	.text
	.globl func1
func1:
	ret
foo:
	call	func1@PLT
	call	func2@PLT
	add	__ehdr_start@GOTPCREL(%rip), %rax
	.globl func2
func2:
	ret
	.globl func3
func3:
	ret
	.section .bar,"aw",@progbits
	.p2align 3
	.dc.a	data1
	.dc.a	__ehdr_start

	.section .foo,"aw",@progbits
	.p2align 3
	.dc.a	data1
	.dc.a	__ehdr_start
