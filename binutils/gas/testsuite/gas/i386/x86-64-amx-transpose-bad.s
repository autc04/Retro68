	.text
	# ttdpbf16ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.f3.0F38.W0 0x6c, %tmm1, %tmm1, %tmm2

	# ttdpbf16ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f3.0F38.W0 0x6c, %tmm1, %tmm2, %tmm1

	# ttdpbf16ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f3.0F38.W0 0x6c, %tmm2, %tmm1, %tmm1

	# ttdpfp16ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.f2.0F38.W0 0x6c, %tmm1, %tmm1, %tmm2

	# ttdpfp16ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f2.0F38.W0 0x6c, %tmm1, %tmm2, %tmm1

	# ttdpfp16ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f2.0F38.W0 0x6c, %tmm2, %tmm1, %tmm1

	# ttmmultf32ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.NP.0F38.W0 0x48, %tmm1, %tmm1, %tmm2

	# ttmmultf32ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.NP.0F38.W0 0x48, %tmm1, %tmm2, %tmm1

	# ttmmultf32ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.NP.0F38.W0 0x48, %tmm2, %tmm1, %tmm1
