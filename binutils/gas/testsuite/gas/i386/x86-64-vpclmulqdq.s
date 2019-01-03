

	.allow_index_reg
	.text
_start:
	vpclmulqdq	$0xab, %ymm28, %ymm29, %ymm30
	vpclmulqdq	$123, 0x124(%rax,%r14,8), %ymm29, %ymm30
	vpclmulqdq	$123, 4064(%rdx), %ymm29, %ymm30

	.intel_syntax noprefix
	vpclmulqdq	ymm30, ymm29, ymm28, 0xab
	vpclmulqdq	ymm30, ymm29, YMMWORD PTR [rax+r14*8+0x1234], 123
	vpclmulqdq	ymm30, ymm29, YMMWORD PTR [rdx+4064], 123
