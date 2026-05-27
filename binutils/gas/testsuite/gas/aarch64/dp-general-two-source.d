#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	1ac00800 	udiv	w0, w0, w0
 *[0-9a-f]+:	1ac0081f 	udiv	wzr, w0, w0
 *[0-9a-f]+:	1ac00be0 	udiv	w0, wzr, w0
 *[0-9a-f]+:	1adf0800 	udiv	w0, w0, wzr
 *[0-9a-f]+:	9ac00800 	udiv	x0, x0, x0
 *[0-9a-f]+:	9ac0081f 	udiv	xzr, x0, x0
 *[0-9a-f]+:	9ac00be0 	udiv	x0, xzr, x0
 *[0-9a-f]+:	9adf0800 	udiv	x0, x0, xzr
 *[0-9a-f]+:	1ac00c00 	sdiv	w0, w0, w0
 *[0-9a-f]+:	1ac00c1f 	sdiv	wzr, w0, w0
 *[0-9a-f]+:	1ac00fe0 	sdiv	w0, wzr, w0
 *[0-9a-f]+:	1adf0c00 	sdiv	w0, w0, wzr
 *[0-9a-f]+:	9ac00c00 	sdiv	x0, x0, x0
 *[0-9a-f]+:	9ac00c1f 	sdiv	xzr, x0, x0
 *[0-9a-f]+:	9ac00fe0 	sdiv	x0, xzr, x0
 *[0-9a-f]+:	9adf0c00 	sdiv	x0, x0, xzr
 *[0-9a-f]+:	1ac02000 	lsl	w0, w0, w0
 *[0-9a-f]+:	1ac0201f 	lsl	wzr, w0, w0
 *[0-9a-f]+:	1ac023e0 	lsl	w0, wzr, w0
 *[0-9a-f]+:	1adf2000 	lsl	w0, w0, wzr
 *[0-9a-f]+:	9ac02000 	lsl	x0, x0, x0
 *[0-9a-f]+:	9ac0201f 	lsl	xzr, x0, x0
 *[0-9a-f]+:	9ac023e0 	lsl	x0, xzr, x0
 *[0-9a-f]+:	9adf2000 	lsl	x0, x0, xzr
 *[0-9a-f]+:	1ac02000 	lsl	w0, w0, w0
 *[0-9a-f]+:	1ac0201f 	lsl	wzr, w0, w0
 *[0-9a-f]+:	1ac023e0 	lsl	w0, wzr, w0
 *[0-9a-f]+:	1adf2000 	lsl	w0, w0, wzr
 *[0-9a-f]+:	9ac02000 	lsl	x0, x0, x0
 *[0-9a-f]+:	9ac0201f 	lsl	xzr, x0, x0
 *[0-9a-f]+:	9ac023e0 	lsl	x0, xzr, x0
 *[0-9a-f]+:	9adf2000 	lsl	x0, x0, xzr
 *[0-9a-f]+:	1ac02400 	lsr	w0, w0, w0
 *[0-9a-f]+:	1ac0241f 	lsr	wzr, w0, w0
 *[0-9a-f]+:	1ac027e0 	lsr	w0, wzr, w0
 *[0-9a-f]+:	1adf2400 	lsr	w0, w0, wzr
 *[0-9a-f]+:	9ac02400 	lsr	x0, x0, x0
 *[0-9a-f]+:	9ac0241f 	lsr	xzr, x0, x0
 *[0-9a-f]+:	9ac027e0 	lsr	x0, xzr, x0
 *[0-9a-f]+:	9adf2400 	lsr	x0, x0, xzr
 *[0-9a-f]+:	1ac02400 	lsr	w0, w0, w0
 *[0-9a-f]+:	1ac0241f 	lsr	wzr, w0, w0
 *[0-9a-f]+:	1ac027e0 	lsr	w0, wzr, w0
 *[0-9a-f]+:	1adf2400 	lsr	w0, w0, wzr
 *[0-9a-f]+:	9ac02400 	lsr	x0, x0, x0
 *[0-9a-f]+:	9ac0241f 	lsr	xzr, x0, x0
 *[0-9a-f]+:	9ac027e0 	lsr	x0, xzr, x0
 *[0-9a-f]+:	9adf2400 	lsr	x0, x0, xzr
 *[0-9a-f]+:	1ac02800 	asr	w0, w0, w0
 *[0-9a-f]+:	1ac0281f 	asr	wzr, w0, w0
 *[0-9a-f]+:	1ac02be0 	asr	w0, wzr, w0
 *[0-9a-f]+:	1adf2800 	asr	w0, w0, wzr
 *[0-9a-f]+:	9ac02800 	asr	x0, x0, x0
 *[0-9a-f]+:	9ac0281f 	asr	xzr, x0, x0
 *[0-9a-f]+:	9ac02be0 	asr	x0, xzr, x0
 *[0-9a-f]+:	9adf2800 	asr	x0, x0, xzr
 *[0-9a-f]+:	1ac02800 	asr	w0, w0, w0
 *[0-9a-f]+:	1ac0281f 	asr	wzr, w0, w0
 *[0-9a-f]+:	1ac02be0 	asr	w0, wzr, w0
 *[0-9a-f]+:	1adf2800 	asr	w0, w0, wzr
 *[0-9a-f]+:	9ac02800 	asr	x0, x0, x0
 *[0-9a-f]+:	9ac0281f 	asr	xzr, x0, x0
 *[0-9a-f]+:	9ac02be0 	asr	x0, xzr, x0
 *[0-9a-f]+:	9adf2800 	asr	x0, x0, xzr
 *[0-9a-f]+:	1ac02c00 	ror	w0, w0, w0
 *[0-9a-f]+:	1ac02c1f 	ror	wzr, w0, w0
 *[0-9a-f]+:	1ac02fe0 	ror	w0, wzr, w0
 *[0-9a-f]+:	1adf2c00 	ror	w0, w0, wzr
 *[0-9a-f]+:	9ac02c00 	ror	x0, x0, x0
 *[0-9a-f]+:	9ac02c1f 	ror	xzr, x0, x0
 *[0-9a-f]+:	9ac02fe0 	ror	x0, xzr, x0
 *[0-9a-f]+:	9adf2c00 	ror	x0, x0, xzr
 *[0-9a-f]+:	1ac02c00 	ror	w0, w0, w0
 *[0-9a-f]+:	1ac02c1f 	ror	wzr, w0, w0
 *[0-9a-f]+:	1ac02fe0 	ror	w0, wzr, w0
 *[0-9a-f]+:	1adf2c00 	ror	w0, w0, wzr
 *[0-9a-f]+:	9ac02c00 	ror	x0, x0, x0
 *[0-9a-f]+:	9ac02c1f 	ror	xzr, x0, x0
 *[0-9a-f]+:	9ac02fe0 	ror	x0, xzr, x0
 *[0-9a-f]+:	9adf2c00 	ror	x0, x0, xzr
