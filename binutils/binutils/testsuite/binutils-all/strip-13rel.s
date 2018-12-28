	.text
foo:
	.dc.l    0x12345678

	.section .rel.text
	.dc.a	 0
	.dc.a    0x0000008f

	.dc.a	 0
	.dc.a    0
