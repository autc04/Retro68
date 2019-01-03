# Check instructions with optimized encoding

	.allow_index_reg
	.text
_start:
	testl	$0x7f, %eax
	testw	$0x7f, %ax
	testb	$0x7f, %al
	test	$0x7f, %ebx
	test	$0x7f, %bx
	test	$0x7f, %bl
	test	$0x7f, %edi
	test	$0x7f, %di
