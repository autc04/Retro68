#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	1a000000 	adc	w0, w0, w0
 *[0-9a-f]+:	1a00001f 	adc	wzr, w0, w0
 *[0-9a-f]+:	1a0003e0 	adc	w0, wzr, w0
 *[0-9a-f]+:	1a1f0000 	adc	w0, w0, wzr
 *[0-9a-f]+:	9a000000 	adc	x0, x0, x0
 *[0-9a-f]+:	9a00001f 	adc	xzr, x0, x0
 *[0-9a-f]+:	9a0003e0 	adc	x0, xzr, x0
 *[0-9a-f]+:	9a1f0000 	adc	x0, x0, xzr
 *[0-9a-f]+:	3a000000 	adcs	w0, w0, w0
 *[0-9a-f]+:	3a00001f 	adcs	wzr, w0, w0
 *[0-9a-f]+:	3a0003e0 	adcs	w0, wzr, w0
 *[0-9a-f]+:	3a1f0000 	adcs	w0, w0, wzr
 *[0-9a-f]+:	ba000000 	adcs	x0, x0, x0
 *[0-9a-f]+:	ba00001f 	adcs	xzr, x0, x0
 *[0-9a-f]+:	ba0003e0 	adcs	x0, xzr, x0
 *[0-9a-f]+:	ba1f0000 	adcs	x0, x0, xzr
 *[0-9a-f]+:	5a000000 	sbc	w0, w0, w0
 *[0-9a-f]+:	5a00001f 	sbc	wzr, w0, w0
 *[0-9a-f]+:	5a0003e0 	ngc	w0, w0
 *[0-9a-f]+:	5a1f0000 	sbc	w0, w0, wzr
 *[0-9a-f]+:	da000000 	sbc	x0, x0, x0
 *[0-9a-f]+:	da00001f 	sbc	xzr, x0, x0
 *[0-9a-f]+:	da0003e0 	ngc	x0, x0
 *[0-9a-f]+:	da1f0000 	sbc	x0, x0, xzr
 *[0-9a-f]+:	7a000000 	sbcs	w0, w0, w0
 *[0-9a-f]+:	7a00001f 	sbcs	wzr, w0, w0
 *[0-9a-f]+:	7a0003e0 	ngcs	w0, w0
 *[0-9a-f]+:	7a1f0000 	sbcs	w0, w0, wzr
 *[0-9a-f]+:	fa000000 	sbcs	x0, x0, x0
 *[0-9a-f]+:	fa00001f 	sbcs	xzr, x0, x0
 *[0-9a-f]+:	fa0003e0 	ngcs	x0, x0
 *[0-9a-f]+:	fa1f0000 	sbcs	x0, x0, xzr
 *[0-9a-f]+:	5a0003e0 	ngc	w0, w0
 *[0-9a-f]+:	5a0003ff 	ngc	wzr, w0
 *[0-9a-f]+:	5a1f03e0 	ngc	w0, wzr
 *[0-9a-f]+:	da0003e0 	ngc	x0, x0
 *[0-9a-f]+:	da0003ff 	ngc	xzr, x0
 *[0-9a-f]+:	da1f03e0 	ngc	x0, xzr
 *[0-9a-f]+:	7a0003e0 	ngcs	w0, w0
 *[0-9a-f]+:	7a0003ff 	ngcs	wzr, w0
 *[0-9a-f]+:	7a1f03e0 	ngcs	w0, wzr
 *[0-9a-f]+:	fa0003e0 	ngcs	x0, x0
 *[0-9a-f]+:	fa0003ff 	ngcs	xzr, x0
 *[0-9a-f]+:	fa1f03e0 	ngcs	x0, xzr
