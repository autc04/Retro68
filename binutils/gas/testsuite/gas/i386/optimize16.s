# Check 16-bit instructions with optimized encoding

	.code16
	.text
_start:
	movzw	%bx, %eax
	movzwl	%si, %ecx
	.intel_syntax noprefix
	movzx	edx, di
	.att_syntax prefix
