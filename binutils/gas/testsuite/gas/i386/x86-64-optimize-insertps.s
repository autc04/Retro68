	.text
insertps:
	insertps $0, %xmm1, %xmm2
	insertps $0xce, (%rcx), %xmm2
	insertps $0x0e, (%r17), %xmm2
	insertps $0xff, %xmm1, %xmm2

	vinsertps $0, %xmm1, %xmm2, %xmm3
	vinsertps $0xce, (%rcx), %xmm2, %xmm2
	vinsertps $0xff, %xmm1, %xmm2, %xmm3

	vinsertps $0xbf, %xmm9, %xmm2, %xmm3
	vinsertps $0x7f, %xmm1, %xmm10, %xmm3
	vinsertps $0x3f, %xmm1, %xmm2, %xmm11

	vinsertps $0, %xmm17, %xmm2, %xmm3
	vinsertps $0xce, (%rcx), %xmm18, %xmm18
	vinsertps $0xff, %xmm17, %xmm2, %xmm3
	vinsertps $0xff, %xmm1, %xmm18, %xmm3
	vinsertps $0xff, %xmm1, %xmm2, %xmm19
