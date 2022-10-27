# Check 64bit instructions with optimized encoding

	.allow_index_reg
	.text
_start:
	testq	$0x7f, %rax
	testl	$0x7f, %eax
	testw	$0x7f, %ax
	testb	$0x7f, %al
	test	$0x7f, %rbx
	test	$0x7f, %ebx
	test	$0x7f, %bx
	test	$0x7f, %bl
	test	$0x7f, %rdi
	test	$0x7f, %edi
	test	$0x7f, %di
	test	$0x7f, %dil
	test	$0x7f, %r9
	test	$0x7f, %r9d
	test	$0x7f, %r9w
	test	$0x7f, %r9b
