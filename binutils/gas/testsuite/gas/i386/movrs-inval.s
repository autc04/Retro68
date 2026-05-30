# Check Illegal 32bit MOVRS instructions

	.text
_start:
	movrs	0x10000000(%esp, %esi, 8), %dx
	movrs	0x10000000(%esp, %esi, 8), %edx
	movrs	0x10000000(%esp, %esi, 8), %r12
	movrs	0x10000000(%esp, %esi, 8), %bl
	vmovrsb	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vmovrsd	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vmovrsq	0x10000000(%esp, %esi, 8), %zmm6{%k7}
	vmovrsw	0x10000000(%esp, %esi, 8), %zmm6{%k7}
