	.text
	.p2align 4
	.globl	func
	.type	func, @function
func:
	leal	foo@tlsgd(,%ebx,1), %eax
	call	___tls_get_addr@PLT
	ret
	.section	.note.GNU-stack,"",@progbits
