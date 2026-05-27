	.text
	# tmmultf32ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.66.0F38.W0 0x48, %tmm1, %tmm1, %tmm2

	# tmmultf32ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.66.0F38.W0 0x48, %tmm1, %tmm2, %tmm1

	# tmmultf32ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.66.0F38.W0 0x48, %tmm2, %tmm1, %tmm1
