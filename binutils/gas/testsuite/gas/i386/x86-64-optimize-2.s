# Check 64bit instructions with optimized encoding

	.allow_index_reg
	.text
_start:
	vandnpd %zmm1, %zmm1, %zmm15{%k7}
	vandnpd %ymm1, %ymm1, %ymm15	 {%k7}		{z}
	vandnpd %zmm1, %zmm1, %zmm15
	vandnpd %ymm1, %ymm1, %ymm15
	vandnpd %zmm1, %zmm1, %zmm16
	vandnpd %ymm1, %ymm1, %ymm16
	vandnpd %zmm17, %zmm17, %zmm1
	vandnpd %ymm17, %ymm17, %ymm1

	vandnps %zmm1, %zmm1, %zmm15{%k7}
	vandnps %ymm1, %ymm1, %ymm15{z}{%k7}
	vandnps %zmm1, %zmm1, %zmm15
	vandnps %ymm1, %ymm1, %ymm15
	vandnps %zmm1, %zmm1, %zmm16
	vandnps %ymm1, %ymm1, %ymm16
	vandnps %zmm17, %zmm17, %zmm1
	vandnps %ymm17, %ymm17, %ymm1

	vpandn %ymm1, %ymm1, %ymm15

	vpandnd %zmm1, %zmm1, %zmm15{%k7}
	vpandnd %ymm1, %ymm1, %ymm15{z}{%k7}
	vpandnd %zmm1, %zmm1, %zmm15
	vpandnd %ymm1, %ymm1, %ymm15
	vpandnd %zmm1, %zmm1, %zmm16
	vpandnd %ymm1, %ymm1, %ymm16
	vpandnd %zmm17, %zmm17, %zmm1
	vpandnd %ymm17, %ymm17, %ymm1

	vpandnq %zmm1, %zmm1, %zmm15{%k7}
	vpandnq %ymm1, %ymm1, %ymm15{z}{%k7}
	vpandnq %zmm1, %zmm1, %zmm15
	vpandnq %ymm1, %ymm1, %ymm15
	vpandnq %zmm1, %zmm1, %zmm16
	vpandnq %ymm1, %ymm1, %ymm16
	vpandnq %zmm17, %zmm17, %zmm1
	vpandnq %ymm17, %ymm17, %ymm1

	vxorpd %zmm1, %zmm1, %zmm15{%k7}
	vxorpd %ymm1, %ymm1, %ymm15{z}{%k7}
	vxorpd %zmm1, %zmm1, %zmm15
	vxorpd %ymm1, %ymm1, %ymm15
	vxorpd %zmm1, %zmm1, %zmm16
	vxorpd %ymm1, %ymm1, %ymm16
	vxorpd %zmm17, %zmm17, %zmm1
	vxorpd %ymm17, %ymm17, %ymm1

	vxorps %zmm1, %zmm1, %zmm15{%k7}
	vxorps %ymm1, %ymm1, %ymm15{z}{%k7}
	vxorps %zmm1, %zmm1, %zmm15
	vxorps %ymm1, %ymm1, %ymm15
	vxorps %zmm1, %zmm1, %zmm16
	vxorps %ymm1, %ymm1, %ymm16
	vxorps %zmm17, %zmm17, %zmm1
	vxorps %ymm17, %ymm17, %ymm1

	vpxor %ymm1, %ymm1, %ymm15

	vpxord %zmm1, %zmm1, %zmm15{%k7}
	vpxord %ymm1, %ymm1, %ymm15{z}{%k7}
	vpxord %zmm1, %zmm1, %zmm15
	vpxord %ymm1, %ymm1, %ymm15
	vpxord %zmm1, %zmm1, %zmm16
	vpxord %ymm1, %ymm1, %ymm16
	vpxord %zmm17, %zmm17, %zmm1
	vpxord %ymm17, %ymm17, %ymm1

	vpxorq %zmm1, %zmm1, %zmm15{%k7}
	vpxorq %ymm1, %ymm1, %ymm15{z}{%k7}
	vpxorq %zmm1, %zmm1, %zmm15
	vpxorq %ymm1, %ymm1, %ymm15
	vpxorq %zmm1, %zmm1, %zmm16
	vpxorq %ymm1, %ymm1, %ymm16
	vpxorq %zmm17, %zmm17, %zmm1
	vpxorq %ymm17, %ymm17, %ymm1

	vpsubb %zmm1, %zmm1, %zmm15{%k7}
	vpsubb %ymm1, %ymm1, %ymm15{z}{%k7}
	vpsubb %zmm1, %zmm1, %zmm15
	vpsubb %ymm1, %ymm1, %ymm15
	vpsubb %zmm1, %zmm1, %zmm16
	vpsubb %ymm1, %ymm1, %ymm16
	vpsubb %zmm17, %zmm17, %zmm1
	vpsubb %ymm17, %ymm17, %ymm1

	vpsubw %zmm1, %zmm1, %zmm15{%k7}
	vpsubw %ymm1, %ymm1, %ymm15{z}{%k7}
	vpsubw %zmm1, %zmm1, %zmm15
	vpsubw %ymm1, %ymm1, %ymm15
	vpsubw %zmm1, %zmm1, %zmm16
	vpsubw %ymm1, %ymm1, %ymm16
	vpsubw %zmm17, %zmm17, %zmm1
	vpsubw %ymm17, %ymm17, %ymm1

	vpsubd %zmm1, %zmm1, %zmm15{%k7}
	vpsubd %ymm1, %ymm1, %ymm15{z}{%k7}
	vpsubd %zmm1, %zmm1, %zmm15
	vpsubd %ymm1, %ymm1, %ymm15
	vpsubd %zmm1, %zmm1, %zmm16
	vpsubd %ymm1, %ymm1, %ymm16
	vpsubd %zmm17, %zmm17, %zmm1
	vpsubd %ymm17, %ymm17, %ymm1

	vpsubq %zmm1, %zmm1, %zmm15{%k7}
	vpsubq %ymm1, %ymm1, %ymm15{z}{%k7}
	vpsubq %zmm1, %zmm1, %zmm15
	vpsubq %ymm1, %ymm1, %ymm15
	vpsubq %zmm1, %zmm1, %zmm16
	vpsubq %ymm1, %ymm1, %ymm16
	vpsubq %zmm17, %zmm17, %zmm1
	vpsubq %ymm17, %ymm17, %ymm1
