	.text
	.global _start
_start:
	movq $foo@PLT, %rax
	leaq -11(%rip), %rbx
	leaq (%rbx, %rax), %rax
	call *%rax

	# Write out "PASS\n".
	movl	$5, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$1, %eax
	syscall

	# exit
	movq $60, %rax
	movq $0, %rdi
	syscall

foo:
	ret

	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"PASS\n"
	.section	.note.GNU-stack,"",@progbits
