	.globl text_symbol
	.text
text_symbol:
	.nop

	.section .special,"0x10000", %progbits
	.long -1
