# Check instructions with optimized encoding

	.allow_index_reg
	.text
_start:
	{nooptimize} testl $0x7f, %eax
