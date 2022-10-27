# Check illegal in AVXVNNI instructions

	.text
	.arch .noavx512_vnni
_start:
	vpdpbusd %xmm2,%xmm4,%xmm2
