	.text
	.global _start
_start:
	leaq 1f(%rip), %r11
1:
	movabs $_GLOBAL_OFFSET_TABLE_, %r15
	leaq (%r11,%r15), %r15

	movabs $ptr@GOT, %rax
	movabs $Ldst@GOTOFF, %rdx
	movq (%rax,%r15), %rax
	leaq (%rdx,%r15), %rcx
	movq %rcx, (%rax)

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

	.data
Ldst:
	.quad 0
ptr:
	.quad 0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"PASS\n"
	.section	.note.GNU-stack,"",@progbits
