	.text
	.global _start
_start:
	.nop

	.section .rdata, "r"
	.dc.a	_start
	.dc.a	.

	.data
.L1:	.rva	_start
.L2:	.rva	.

	.section .reloc, "r"
	.p2align 2
	.rva	.data
	.long	2 * 4 + 2 * 2
	.short	.L1 - .data + (3 << 12)
	.short	.L2 - .data + (3 << 12)
