	.section __patchable_function_entries,"awo",%progbits,foo
	.dc.a	.LPFE1
	.text
.LPFE1:
	.byte 0
	.set	foo,0x1000
