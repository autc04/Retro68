	.text
	# tdpbf8ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.NP.M5.W0 0xfd, %tmm1, %tmm1, %tmm2

	# tdpbf8ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.NP.M5.W0 0xfd, %tmm1, %tmm2, %tmm1

	# tdpbf8ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.NP.M5.W0 0xfd, %tmm2, %tmm1, %tmm1

	# tdpbhf8ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.f2.M5.W0 0xfd, %tmm1, %tmm1, %tmm2

	# tdpbhf8ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f2.M5.W0 0xfd, %tmm1, %tmm2, %tmm1

	# tdpbhf8ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f2.M5.W0 0xfd, %tmm2, %tmm1, %tmm1

	# tdphbf8ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.f3.M5.W0 0xfd, %tmm1, %tmm1, %tmm2

	# tdphbf8ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f3.M5.W0 0xfd, %tmm1, %tmm2, %tmm1

	# tdphbf8ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.f3.M5.W0 0xfd, %tmm2, %tmm1, %tmm1

	# tdphf8ps %tmm1, %tmm1, %tmm2 all tmm registers should be distinct
	.insn VEX.128.66.M5.W0 0xfd, %tmm1, %tmm1, %tmm2

	# tdphf8ps %tmm1, %tmm2, %tmm1 all tmm registers should be distinct
	.insn VEX.128.66.M5.W0 0xfd, %tmm1, %tmm2, %tmm1

	# tdphf8ps %tmm2, %tmm1, %tmm1 all tmm registers should be distinct
	.insn VEX.128.66.M5.W0 0xfd, %tmm2, %tmm1, %tmm1
