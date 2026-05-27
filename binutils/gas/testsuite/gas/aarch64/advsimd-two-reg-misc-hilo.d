#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	0e212800 	xtn	v0\.8b, v0\.8h
 *[0-9a-f]+:	0e21281f 	xtn	v31\.8b, v0\.8h
 *[0-9a-f]+:	0e212be0 	xtn	v0\.8b, v31\.8h
 *[0-9a-f]+:	0e612800 	xtn	v0\.4h, v0\.4s
 *[0-9a-f]+:	0e61281f 	xtn	v31\.4h, v0\.4s
 *[0-9a-f]+:	0e612be0 	xtn	v0\.4h, v31\.4s
 *[0-9a-f]+:	0ea12800 	xtn	v0\.2s, v0\.2d
 *[0-9a-f]+:	0ea1281f 	xtn	v31\.2s, v0\.2d
 *[0-9a-f]+:	0ea12be0 	xtn	v0\.2s, v31\.2d
 *[0-9a-f]+:	4e212800 	xtn2	v0\.16b, v0\.8h
 *[0-9a-f]+:	4e21281f 	xtn2	v31\.16b, v0\.8h
 *[0-9a-f]+:	4e212be0 	xtn2	v0\.16b, v31\.8h
 *[0-9a-f]+:	4e612800 	xtn2	v0\.8h, v0\.4s
 *[0-9a-f]+:	4e61281f 	xtn2	v31\.8h, v0\.4s
 *[0-9a-f]+:	4e612be0 	xtn2	v0\.8h, v31\.4s
 *[0-9a-f]+:	4ea12800 	xtn2	v0\.4s, v0\.2d
 *[0-9a-f]+:	4ea1281f 	xtn2	v31\.4s, v0\.2d
 *[0-9a-f]+:	4ea12be0 	xtn2	v0\.4s, v31\.2d
 *[0-9a-f]+:	0e214800 	sqxtn	v0\.8b, v0\.8h
 *[0-9a-f]+:	0e21481f 	sqxtn	v31\.8b, v0\.8h
 *[0-9a-f]+:	0e214be0 	sqxtn	v0\.8b, v31\.8h
 *[0-9a-f]+:	0e614800 	sqxtn	v0\.4h, v0\.4s
 *[0-9a-f]+:	0e61481f 	sqxtn	v31\.4h, v0\.4s
 *[0-9a-f]+:	0e614be0 	sqxtn	v0\.4h, v31\.4s
 *[0-9a-f]+:	0ea14800 	sqxtn	v0\.2s, v0\.2d
 *[0-9a-f]+:	0ea1481f 	sqxtn	v31\.2s, v0\.2d
 *[0-9a-f]+:	0ea14be0 	sqxtn	v0\.2s, v31\.2d
 *[0-9a-f]+:	4e214800 	sqxtn2	v0\.16b, v0\.8h
 *[0-9a-f]+:	4e21481f 	sqxtn2	v31\.16b, v0\.8h
 *[0-9a-f]+:	4e214be0 	sqxtn2	v0\.16b, v31\.8h
 *[0-9a-f]+:	4e614800 	sqxtn2	v0\.8h, v0\.4s
 *[0-9a-f]+:	4e61481f 	sqxtn2	v31\.8h, v0\.4s
 *[0-9a-f]+:	4e614be0 	sqxtn2	v0\.8h, v31\.4s
 *[0-9a-f]+:	4ea14800 	sqxtn2	v0\.4s, v0\.2d
 *[0-9a-f]+:	4ea1481f 	sqxtn2	v31\.4s, v0\.2d
 *[0-9a-f]+:	4ea14be0 	sqxtn2	v0\.4s, v31\.2d
 *[0-9a-f]+:	0e216800 	fcvtn	v0\.4h, v0\.4s
 *[0-9a-f]+:	0e21681f 	fcvtn	v31\.4h, v0\.4s
 *[0-9a-f]+:	0e216be0 	fcvtn	v0\.4h, v31\.4s
 *[0-9a-f]+:	0e616800 	fcvtn	v0\.2s, v0\.2d
 *[0-9a-f]+:	0e61681f 	fcvtn	v31\.2s, v0\.2d
 *[0-9a-f]+:	0e616be0 	fcvtn	v0\.2s, v31\.2d
 *[0-9a-f]+:	4e216800 	fcvtn2	v0\.8h, v0\.4s
 *[0-9a-f]+:	4e21681f 	fcvtn2	v31\.8h, v0\.4s
 *[0-9a-f]+:	4e216be0 	fcvtn2	v0\.8h, v31\.4s
 *[0-9a-f]+:	4e616800 	fcvtn2	v0\.4s, v0\.2d
 *[0-9a-f]+:	4e61681f 	fcvtn2	v31\.4s, v0\.2d
 *[0-9a-f]+:	4e616be0 	fcvtn2	v0\.4s, v31\.2d
 *[0-9a-f]+:	0e217800 	fcvtl	v0\.4s, v0\.4h
 *[0-9a-f]+:	0e21781f 	fcvtl	v31\.4s, v0\.4h
 *[0-9a-f]+:	0e217be0 	fcvtl	v0\.4s, v31\.4h
 *[0-9a-f]+:	0e617800 	fcvtl	v0\.2d, v0\.2s
 *[0-9a-f]+:	0e61781f 	fcvtl	v31\.2d, v0\.2s
 *[0-9a-f]+:	0e617be0 	fcvtl	v0\.2d, v31\.2s
 *[0-9a-f]+:	4e217800 	fcvtl2	v0\.4s, v0\.8h
 *[0-9a-f]+:	4e21781f 	fcvtl2	v31\.4s, v0\.8h
 *[0-9a-f]+:	4e217be0 	fcvtl2	v0\.4s, v31\.8h
 *[0-9a-f]+:	4e617800 	fcvtl2	v0\.2d, v0\.4s
 *[0-9a-f]+:	4e61781f 	fcvtl2	v31\.2d, v0\.4s
 *[0-9a-f]+:	4e617be0 	fcvtl2	v0\.2d, v31\.4s
 *[0-9a-f]+:	2e212800 	sqxtun	v0\.8b, v0\.8h
 *[0-9a-f]+:	2e21281f 	sqxtun	v31\.8b, v0\.8h
 *[0-9a-f]+:	2e212be0 	sqxtun	v0\.8b, v31\.8h
 *[0-9a-f]+:	2e612800 	sqxtun	v0\.4h, v0\.4s
 *[0-9a-f]+:	2e61281f 	sqxtun	v31\.4h, v0\.4s
 *[0-9a-f]+:	2e612be0 	sqxtun	v0\.4h, v31\.4s
 *[0-9a-f]+:	2ea12800 	sqxtun	v0\.2s, v0\.2d
 *[0-9a-f]+:	2ea1281f 	sqxtun	v31\.2s, v0\.2d
 *[0-9a-f]+:	2ea12be0 	sqxtun	v0\.2s, v31\.2d
 *[0-9a-f]+:	6e212800 	sqxtun2	v0\.16b, v0\.8h
 *[0-9a-f]+:	6e21281f 	sqxtun2	v31\.16b, v0\.8h
 *[0-9a-f]+:	6e212be0 	sqxtun2	v0\.16b, v31\.8h
 *[0-9a-f]+:	6e612800 	sqxtun2	v0\.8h, v0\.4s
 *[0-9a-f]+:	6e61281f 	sqxtun2	v31\.8h, v0\.4s
 *[0-9a-f]+:	6e612be0 	sqxtun2	v0\.8h, v31\.4s
 *[0-9a-f]+:	6ea12800 	sqxtun2	v0\.4s, v0\.2d
 *[0-9a-f]+:	6ea1281f 	sqxtun2	v31\.4s, v0\.2d
 *[0-9a-f]+:	6ea12be0 	sqxtun2	v0\.4s, v31\.2d
 *[0-9a-f]+:	2e213800 	shll	v0\.8h, v0\.8b, #8
 *[0-9a-f]+:	2e21381f 	shll	v31\.8h, v0\.8b, #8
 *[0-9a-f]+:	2e213be0 	shll	v0\.8h, v31\.8b, #8
 *[0-9a-f]+:	2e613800 	shll	v0\.4s, v0\.4h, #16
 *[0-9a-f]+:	2e61381f 	shll	v31\.4s, v0\.4h, #16
 *[0-9a-f]+:	2e613be0 	shll	v0\.4s, v31\.4h, #16
 *[0-9a-f]+:	2ea13800 	shll	v0\.2d, v0\.2s, #32
 *[0-9a-f]+:	2ea1381f 	shll	v31\.2d, v0\.2s, #32
 *[0-9a-f]+:	2ea13be0 	shll	v0\.2d, v31\.2s, #32
 *[0-9a-f]+:	6e213800 	shll2	v0\.8h, v0\.16b, #8
 *[0-9a-f]+:	6e21381f 	shll2	v31\.8h, v0\.16b, #8
 *[0-9a-f]+:	6e213be0 	shll2	v0\.8h, v31\.16b, #8
 *[0-9a-f]+:	6e613800 	shll2	v0\.4s, v0\.8h, #16
 *[0-9a-f]+:	6e61381f 	shll2	v31\.4s, v0\.8h, #16
 *[0-9a-f]+:	6e613be0 	shll2	v0\.4s, v31\.8h, #16
 *[0-9a-f]+:	6ea13800 	shll2	v0\.2d, v0\.4s, #32
 *[0-9a-f]+:	6ea1381f 	shll2	v31\.2d, v0\.4s, #32
 *[0-9a-f]+:	6ea13be0 	shll2	v0\.2d, v31\.4s, #32
 *[0-9a-f]+:	2e214800 	uqxtn	v0\.8b, v0\.8h
 *[0-9a-f]+:	2e21481f 	uqxtn	v31\.8b, v0\.8h
 *[0-9a-f]+:	2e214be0 	uqxtn	v0\.8b, v31\.8h
 *[0-9a-f]+:	2e614800 	uqxtn	v0\.4h, v0\.4s
 *[0-9a-f]+:	2e61481f 	uqxtn	v31\.4h, v0\.4s
 *[0-9a-f]+:	2e614be0 	uqxtn	v0\.4h, v31\.4s
 *[0-9a-f]+:	2ea14800 	uqxtn	v0\.2s, v0\.2d
 *[0-9a-f]+:	2ea1481f 	uqxtn	v31\.2s, v0\.2d
 *[0-9a-f]+:	2ea14be0 	uqxtn	v0\.2s, v31\.2d
 *[0-9a-f]+:	6e214800 	uqxtn2	v0\.16b, v0\.8h
 *[0-9a-f]+:	6e21481f 	uqxtn2	v31\.16b, v0\.8h
 *[0-9a-f]+:	6e214be0 	uqxtn2	v0\.16b, v31\.8h
 *[0-9a-f]+:	6e614800 	uqxtn2	v0\.8h, v0\.4s
 *[0-9a-f]+:	6e61481f 	uqxtn2	v31\.8h, v0\.4s
 *[0-9a-f]+:	6e614be0 	uqxtn2	v0\.8h, v31\.4s
 *[0-9a-f]+:	6ea14800 	uqxtn2	v0\.4s, v0\.2d
 *[0-9a-f]+:	6ea1481f 	uqxtn2	v31\.4s, v0\.2d
 *[0-9a-f]+:	6ea14be0 	uqxtn2	v0\.4s, v31\.2d
 *[0-9a-f]+:	2e616800 	fcvtxn	v0\.2s, v0\.2d
 *[0-9a-f]+:	2e61681f 	fcvtxn	v31\.2s, v0\.2d
 *[0-9a-f]+:	2e616be0 	fcvtxn	v0\.2s, v31\.2d
 *[0-9a-f]+:	6e616800 	fcvtxn2	v0\.4s, v0\.2d
 *[0-9a-f]+:	6e61681f 	fcvtxn2	v31\.4s, v0\.2d
 *[0-9a-f]+:	6e616be0 	fcvtxn2	v0\.4s, v31\.2d
