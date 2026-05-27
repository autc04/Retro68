#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	0f009400 	orr	v0\.4h, #0x0
 *[0-9a-f]+:	0f00941f 	orr	v31\.4h, #0x0
 *[0-9a-f]+:	0f0097e0 	orr	v0\.4h, #0x1f
 *[0-9a-f]+:	0f0797e0 	orr	v0\.4h, #0xff
 *[0-9a-f]+:	0f009400 	orr	v0\.4h, #0x0
 *[0-9a-f]+:	0f00b400 	orr	v0\.4h, #0x0, lsl #8
 *[0-9a-f]+:	4f009400 	orr	v0\.8h, #0x0
 *[0-9a-f]+:	4f00941f 	orr	v31\.8h, #0x0
 *[0-9a-f]+:	4f0097e0 	orr	v0\.8h, #0x1f
 *[0-9a-f]+:	4f0797e0 	orr	v0\.8h, #0xff
 *[0-9a-f]+:	4f0797e0 	orr	v0\.8h, #0xff
 *[0-9a-f]+:	4f07b7e0 	orr	v0\.8h, #0xff, lsl #8
 *[0-9a-f]+:	0f001400 	orr	v0\.2s, #0x0
 *[0-9a-f]+:	0f00141f 	orr	v31\.2s, #0x0
 *[0-9a-f]+:	0f0017e0 	orr	v0\.2s, #0x1f
 *[0-9a-f]+:	0f0717e0 	orr	v0\.2s, #0xff
 *[0-9a-f]+:	0f001400 	orr	v0\.2s, #0x0
 *[0-9a-f]+:	0f003400 	orr	v0\.2s, #0x0, lsl #8
 *[0-9a-f]+:	0f005400 	orr	v0\.2s, #0x0, lsl #16
 *[0-9a-f]+:	0f007400 	orr	v0\.2s, #0x0, lsl #24
 *[0-9a-f]+:	4f001400 	orr	v0\.4s, #0x0
 *[0-9a-f]+:	4f00141f 	orr	v31\.4s, #0x0
 *[0-9a-f]+:	4f0017e0 	orr	v0\.4s, #0x1f
 *[0-9a-f]+:	4f0717e0 	orr	v0\.4s, #0xff
 *[0-9a-f]+:	4f0717e0 	orr	v0\.4s, #0xff
 *[0-9a-f]+:	4f0737e0 	orr	v0\.4s, #0xff, lsl #8
 *[0-9a-f]+:	4f0757e0 	orr	v0\.4s, #0xff, lsl #16
 *[0-9a-f]+:	4f0777e0 	orr	v0\.4s, #0xff, lsl #24
 *[0-9a-f]+:	2f008400 	mvni	v0\.4h, #0x0
 *[0-9a-f]+:	2f00841f 	mvni	v31\.4h, #0x0
 *[0-9a-f]+:	2f0087e0 	mvni	v0\.4h, #0x1f
 *[0-9a-f]+:	2f0787e0 	mvni	v0\.4h, #0xff
 *[0-9a-f]+:	2f008400 	mvni	v0\.4h, #0x0
 *[0-9a-f]+:	2f00a400 	mvni	v0\.4h, #0x0, lsl #8
 *[0-9a-f]+:	6f008400 	mvni	v0\.8h, #0x0
 *[0-9a-f]+:	6f00841f 	mvni	v31\.8h, #0x0
 *[0-9a-f]+:	6f0087e0 	mvni	v0\.8h, #0x1f
 *[0-9a-f]+:	6f0787e0 	mvni	v0\.8h, #0xff
 *[0-9a-f]+:	6f0787e0 	mvni	v0\.8h, #0xff
 *[0-9a-f]+:	6f07a7e0 	mvni	v0\.8h, #0xff, lsl #8
 *[0-9a-f]+:	2f000400 	mvni	v0\.2s, #0x0
 *[0-9a-f]+:	2f00041f 	mvni	v31\.2s, #0x0
 *[0-9a-f]+:	2f0007e0 	mvni	v0\.2s, #0x1f
 *[0-9a-f]+:	2f0707e0 	mvni	v0\.2s, #0xff
 *[0-9a-f]+:	2f000400 	mvni	v0\.2s, #0x0
 *[0-9a-f]+:	2f002400 	mvni	v0\.2s, #0x0, lsl #8
 *[0-9a-f]+:	2f004400 	mvni	v0\.2s, #0x0, lsl #16
 *[0-9a-f]+:	2f006400 	mvni	v0\.2s, #0x0, lsl #24
 *[0-9a-f]+:	6f000400 	mvni	v0\.4s, #0x0
 *[0-9a-f]+:	6f00041f 	mvni	v31\.4s, #0x0
 *[0-9a-f]+:	6f0007e0 	mvni	v0\.4s, #0x1f
 *[0-9a-f]+:	6f0707e0 	mvni	v0\.4s, #0xff
 *[0-9a-f]+:	6f0707e0 	mvni	v0\.4s, #0xff
 *[0-9a-f]+:	6f0727e0 	mvni	v0\.4s, #0xff, lsl #8
 *[0-9a-f]+:	6f0747e0 	mvni	v0\.4s, #0xff, lsl #16
 *[0-9a-f]+:	6f0767e0 	mvni	v0\.4s, #0xff, lsl #24
 *[0-9a-f]+:	2f00c400 	mvni	v0\.2s, #0x0, msl #8
 *[0-9a-f]+:	2f00c41f 	mvni	v31\.2s, #0x0, msl #8
 *[0-9a-f]+:	2f00c7e0 	mvni	v0\.2s, #0x1f, msl #8
 *[0-9a-f]+:	2f07c7e0 	mvni	v0\.2s, #0xff, msl #8
 *[0-9a-f]+:	2f00d400 	mvni	v0\.2s, #0x0, msl #16
 *[0-9a-f]+:	6f00c400 	mvni	v0\.4s, #0x0, msl #8
 *[0-9a-f]+:	6f00c41f 	mvni	v31\.4s, #0x0, msl #8
 *[0-9a-f]+:	6f00c7e0 	mvni	v0\.4s, #0x1f, msl #8
 *[0-9a-f]+:	6f07c7e0 	mvni	v0\.4s, #0xff, msl #8
 *[0-9a-f]+:	6f07d7e0 	mvni	v0\.4s, #0xff, msl #16
 *[0-9a-f]+:	2f009400 	bic	v0\.4h, #0x0
 *[0-9a-f]+:	2f00941f 	bic	v31\.4h, #0x0
 *[0-9a-f]+:	2f0097e0 	bic	v0\.4h, #0x1f
 *[0-9a-f]+:	2f0797e0 	bic	v0\.4h, #0xff
 *[0-9a-f]+:	2f009400 	bic	v0\.4h, #0x0
 *[0-9a-f]+:	2f00b400 	bic	v0\.4h, #0x0, lsl #8
 *[0-9a-f]+:	6f009400 	bic	v0\.8h, #0x0
 *[0-9a-f]+:	6f00941f 	bic	v31\.8h, #0x0
 *[0-9a-f]+:	6f0097e0 	bic	v0\.8h, #0x1f
 *[0-9a-f]+:	6f0797e0 	bic	v0\.8h, #0xff
 *[0-9a-f]+:	6f0797e0 	bic	v0\.8h, #0xff
 *[0-9a-f]+:	6f07b7e0 	bic	v0\.8h, #0xff, lsl #8
 *[0-9a-f]+:	2f001400 	bic	v0\.2s, #0x0
 *[0-9a-f]+:	2f00141f 	bic	v31\.2s, #0x0
 *[0-9a-f]+:	2f0017e0 	bic	v0\.2s, #0x1f
 *[0-9a-f]+:	2f0717e0 	bic	v0\.2s, #0xff
 *[0-9a-f]+:	2f001400 	bic	v0\.2s, #0x0
 *[0-9a-f]+:	2f003400 	bic	v0\.2s, #0x0, lsl #8
 *[0-9a-f]+:	2f005400 	bic	v0\.2s, #0x0, lsl #16
 *[0-9a-f]+:	2f007400 	bic	v0\.2s, #0x0, lsl #24
 *[0-9a-f]+:	6f001400 	bic	v0\.4s, #0x0
 *[0-9a-f]+:	6f00141f 	bic	v31\.4s, #0x0
 *[0-9a-f]+:	6f0017e0 	bic	v0\.4s, #0x1f
 *[0-9a-f]+:	6f0717e0 	bic	v0\.4s, #0xff
 *[0-9a-f]+:	6f0717e0 	bic	v0\.4s, #0xff
 *[0-9a-f]+:	6f0737e0 	bic	v0\.4s, #0xff, lsl #8
 *[0-9a-f]+:	6f0757e0 	bic	v0\.4s, #0xff, lsl #16
 *[0-9a-f]+:	6f0777e0 	bic	v0\.4s, #0xff, lsl #24
