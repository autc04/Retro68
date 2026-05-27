#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	5ac00000 	rbit	w0, w0
 *[0-9a-f]+:	5ac0001f 	rbit	wzr, w0
 *[0-9a-f]+:	5ac003e0 	rbit	w0, wzr
 *[0-9a-f]+:	dac00000 	rbit	x0, x0
 *[0-9a-f]+:	dac0001f 	rbit	xzr, x0
 *[0-9a-f]+:	dac003e0 	rbit	x0, xzr
 *[0-9a-f]+:	5ac00400 	rev16	w0, w0
 *[0-9a-f]+:	5ac0041f 	rev16	wzr, w0
 *[0-9a-f]+:	5ac007e0 	rev16	w0, wzr
 *[0-9a-f]+:	dac00400 	rev16	x0, x0
 *[0-9a-f]+:	dac0041f 	rev16	xzr, x0
 *[0-9a-f]+:	dac007e0 	rev16	x0, xzr
 *[0-9a-f]+:	5ac00800 	rev	w0, w0
 *[0-9a-f]+:	5ac0081f 	rev	wzr, w0
 *[0-9a-f]+:	5ac00be0 	rev	w0, wzr
 *[0-9a-f]+:	dac00800 	rev32	x0, x0
 *[0-9a-f]+:	dac0081f 	rev32	xzr, x0
 *[0-9a-f]+:	dac00be0 	rev32	x0, xzr
 *[0-9a-f]+:	dac00c00 	rev	x0, x0
 *[0-9a-f]+:	dac00c1f 	rev	xzr, x0
 *[0-9a-f]+:	dac00fe0 	rev	x0, xzr
 *[0-9a-f]+:	dac00c00 	rev	x0, x0
 *[0-9a-f]+:	dac00c1f 	rev	xzr, x0
 *[0-9a-f]+:	dac00fe0 	rev	x0, xzr
 *[0-9a-f]+:	5ac01000 	clz	w0, w0
 *[0-9a-f]+:	5ac0101f 	clz	wzr, w0
 *[0-9a-f]+:	5ac013e0 	clz	w0, wzr
 *[0-9a-f]+:	dac01000 	clz	x0, x0
 *[0-9a-f]+:	dac0101f 	clz	xzr, x0
 *[0-9a-f]+:	dac013e0 	clz	x0, xzr
 *[0-9a-f]+:	5ac01400 	cls	w0, w0
 *[0-9a-f]+:	5ac0141f 	cls	wzr, w0
 *[0-9a-f]+:	5ac017e0 	cls	w0, wzr
 *[0-9a-f]+:	dac01400 	cls	x0, x0
 *[0-9a-f]+:	dac0141f 	cls	xzr, x0
 *[0-9a-f]+:	dac017e0 	cls	x0, xzr
