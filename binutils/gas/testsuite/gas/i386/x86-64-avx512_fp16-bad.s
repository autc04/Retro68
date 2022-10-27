.text
	#vfcmaddcph %zmm30, %zmm29, %zmm30 dest and src registers must be distinct.
	.byte 0x62
	.byte 0x06
	.byte 0x17
	.byte 0x40
	.byte 0x56
	.byte 0xf6
	#vfcmaddcph (%rcx), %zmm3, %zmm3 dest and src registers must be distinct.
	.byte 0x62
	.byte 0xf6
	.byte 0x67
	.byte 0x48
	.byte 0x56
	.byte 0x19
	#vfcmaddcph %xmm3, %xmm2, %xmm2 dest and src registers must be distinct.
	.byte 0x62
	.byte 0xf6
	.byte 0x6f
	.byte 0x08
	.byte 0x56
	.byte 0xd3
	#vfcmaddcsh %xmm3, %xmm2, %xmm3 dest and src registers must be distinct.
	.byte 0x62
	.byte 0xf6
	.byte 0x6f
	.byte 0x08
	.byte 0x57
	.byte 0xdb
	#vfcmaddcsh %xmm3, %xmm2, %xmm2 dest and src registers must be distinct.
	.byte 0x62
	.byte 0xf6
	.byte 0x6f
	.byte 0x08
	.byte 0x57
	.byte 0xd3
