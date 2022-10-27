# Check illegal in AVXVNNI instructions

	.text
	.arch .noavx512_vnni
_start:
	vpdpbusds %xmm2, %xmm4, %xmm2
	vpdpbusds %xmm22, %xmm4, %xmm2
