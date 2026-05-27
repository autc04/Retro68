	.section .merge, "aM", 12
	.dc.l 1, 2, 3, 4, 5, 6
	.section .string, "aS", %progbits, 2
	.dc.w 0x0020, 0x0021, 0x0022
	.section .custom, "aE", 6
	.dc.w 5, 6, 7, 8, 9, 0
	.section .bss.custom, "awE", %nobits, 6
	.skip 30
