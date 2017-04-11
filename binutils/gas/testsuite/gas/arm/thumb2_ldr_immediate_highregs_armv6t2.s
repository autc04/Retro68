	.thumb
	.syntax unified
	.thumb_func
thumb2_ldr:
	# These can be encoded into movs since constant is small
	# And register can be encoded in 3 bits
	ldr r0,=0x00
	ldr r1,=0x08
	ldr r2,=0x51
	ldr r3,=0x1F
	ldr r4,=0x2F
	ldr r5,=0x3F
	ldr r6,=0x80
	ldr r7,=0xFF
	# These shall be encoded into mov.w
	# Since register cannot be encoded in 3 bits
	ldr r8,=0x00
	ldr r9,=0x08
	ldr r10,=0x51
	ldr r11,=0x1F
	ldr r12,=0x2F
	ldr r13,=0x3F
	ldr r14,=0x80
	ldr r15,=0xFF
