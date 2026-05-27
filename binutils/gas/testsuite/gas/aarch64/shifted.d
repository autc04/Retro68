#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
 *[0-9a-f]+:	aa030041 	orr	x1, x2, x3
 *[0-9a-f]+:	aa030441 	orr	x1, x2, x3, lsl #1
 *[0-9a-f]+:	aa030c41 	orr	x1, x2, x3, lsl #3
 *[0-9a-f]+:	aa031c41 	orr	x1, x2, x3, lsl #7
 *[0-9a-f]+:	aa033c41 	orr	x1, x2, x3, lsl #15
 *[0-9a-f]+:	aa037c41 	orr	x1, x2, x3, lsl #31
 *[0-9a-f]+:	aa03fc41 	orr	x1, x2, x3, lsl #63
 *[0-9a-f]+:	aa430041 	orr	x1, x2, x3, lsr #0
 *[0-9a-f]+:	aa430441 	orr	x1, x2, x3, lsr #1
 *[0-9a-f]+:	aa430c41 	orr	x1, x2, x3, lsr #3
 *[0-9a-f]+:	aa431c41 	orr	x1, x2, x3, lsr #7
 *[0-9a-f]+:	aa433c41 	orr	x1, x2, x3, lsr #15
 *[0-9a-f]+:	aa437c41 	orr	x1, x2, x3, lsr #31
 *[0-9a-f]+:	aa43fc41 	orr	x1, x2, x3, lsr #63
 *[0-9a-f]+:	aa830041 	orr	x1, x2, x3, asr #0
 *[0-9a-f]+:	aa830441 	orr	x1, x2, x3, asr #1
 *[0-9a-f]+:	aa830c41 	orr	x1, x2, x3, asr #3
 *[0-9a-f]+:	aa831c41 	orr	x1, x2, x3, asr #7
 *[0-9a-f]+:	aa833c41 	orr	x1, x2, x3, asr #15
 *[0-9a-f]+:	aa837c41 	orr	x1, x2, x3, asr #31
 *[0-9a-f]+:	aa83fc41 	orr	x1, x2, x3, asr #63
 *[0-9a-f]+:	aac30041 	orr	x1, x2, x3, ror #0
 *[0-9a-f]+:	aac30441 	orr	x1, x2, x3, ror #1
 *[0-9a-f]+:	aac30c41 	orr	x1, x2, x3, ror #3
 *[0-9a-f]+:	aac31c41 	orr	x1, x2, x3, ror #7
 *[0-9a-f]+:	aac33c41 	orr	x1, x2, x3, ror #15
 *[0-9a-f]+:	aac37c41 	orr	x1, x2, x3, ror #31
 *[0-9a-f]+:	aac3fc41 	orr	x1, x2, x3, ror #63
 *[0-9a-f]+:	2a030041 	orr	w1, w2, w3
 *[0-9a-f]+:	2a030441 	orr	w1, w2, w3, lsl #1
 *[0-9a-f]+:	2a030c41 	orr	w1, w2, w3, lsl #3
 *[0-9a-f]+:	2a031c41 	orr	w1, w2, w3, lsl #7
 *[0-9a-f]+:	2a033c41 	orr	w1, w2, w3, lsl #15
 *[0-9a-f]+:	2a037c41 	orr	w1, w2, w3, lsl #31
 *[0-9a-f]+:	2a430041 	orr	w1, w2, w3, lsr #0
 *[0-9a-f]+:	2a430441 	orr	w1, w2, w3, lsr #1
 *[0-9a-f]+:	2a430c41 	orr	w1, w2, w3, lsr #3
 *[0-9a-f]+:	2a431c41 	orr	w1, w2, w3, lsr #7
 *[0-9a-f]+:	2a433c41 	orr	w1, w2, w3, lsr #15
 *[0-9a-f]+:	2a437c41 	orr	w1, w2, w3, lsr #31
 *[0-9a-f]+:	2a830041 	orr	w1, w2, w3, asr #0
 *[0-9a-f]+:	2a830441 	orr	w1, w2, w3, asr #1
 *[0-9a-f]+:	2a830c41 	orr	w1, w2, w3, asr #3
 *[0-9a-f]+:	2a831c41 	orr	w1, w2, w3, asr #7
 *[0-9a-f]+:	2a833c41 	orr	w1, w2, w3, asr #15
 *[0-9a-f]+:	2a837c41 	orr	w1, w2, w3, asr #31
 *[0-9a-f]+:	2ac30041 	orr	w1, w2, w3, ror #0
 *[0-9a-f]+:	2ac30441 	orr	w1, w2, w3, ror #1
 *[0-9a-f]+:	2ac30c41 	orr	w1, w2, w3, ror #3
 *[0-9a-f]+:	2ac31c41 	orr	w1, w2, w3, ror #7
 *[0-9a-f]+:	2ac33c41 	orr	w1, w2, w3, ror #15
 *[0-9a-f]+:	2ac37c41 	orr	w1, w2, w3, ror #31
 *[0-9a-f]+:	8a030041 	and	x1, x2, x3
 *[0-9a-f]+:	8a030441 	and	x1, x2, x3, lsl #1
 *[0-9a-f]+:	8a030c41 	and	x1, x2, x3, lsl #3
 *[0-9a-f]+:	8a031c41 	and	x1, x2, x3, lsl #7
 *[0-9a-f]+:	8a033c41 	and	x1, x2, x3, lsl #15
 *[0-9a-f]+:	8a037c41 	and	x1, x2, x3, lsl #31
 *[0-9a-f]+:	8a03fc41 	and	x1, x2, x3, lsl #63
 *[0-9a-f]+:	8a430041 	and	x1, x2, x3, lsr #0
 *[0-9a-f]+:	8a430441 	and	x1, x2, x3, lsr #1
 *[0-9a-f]+:	8a430c41 	and	x1, x2, x3, lsr #3
 *[0-9a-f]+:	8a431c41 	and	x1, x2, x3, lsr #7
 *[0-9a-f]+:	8a433c41 	and	x1, x2, x3, lsr #15
 *[0-9a-f]+:	8a437c41 	and	x1, x2, x3, lsr #31
 *[0-9a-f]+:	8a43fc41 	and	x1, x2, x3, lsr #63
 *[0-9a-f]+:	8a830041 	and	x1, x2, x3, asr #0
 *[0-9a-f]+:	8a830441 	and	x1, x2, x3, asr #1
 *[0-9a-f]+:	8a830c41 	and	x1, x2, x3, asr #3
 *[0-9a-f]+:	8a831c41 	and	x1, x2, x3, asr #7
 *[0-9a-f]+:	8a833c41 	and	x1, x2, x3, asr #15
 *[0-9a-f]+:	8a837c41 	and	x1, x2, x3, asr #31
 *[0-9a-f]+:	8a83fc41 	and	x1, x2, x3, asr #63
 *[0-9a-f]+:	8ac30041 	and	x1, x2, x3, ror #0
 *[0-9a-f]+:	8ac30441 	and	x1, x2, x3, ror #1
 *[0-9a-f]+:	8ac30c41 	and	x1, x2, x3, ror #3
 *[0-9a-f]+:	8ac31c41 	and	x1, x2, x3, ror #7
 *[0-9a-f]+:	8ac33c41 	and	x1, x2, x3, ror #15
 *[0-9a-f]+:	8ac37c41 	and	x1, x2, x3, ror #31
 *[0-9a-f]+:	8ac3fc41 	and	x1, x2, x3, ror #63
 *[0-9a-f]+:	0a030041 	and	w1, w2, w3
 *[0-9a-f]+:	0a030441 	and	w1, w2, w3, lsl #1
 *[0-9a-f]+:	0a030c41 	and	w1, w2, w3, lsl #3
 *[0-9a-f]+:	0a031c41 	and	w1, w2, w3, lsl #7
 *[0-9a-f]+:	0a033c41 	and	w1, w2, w3, lsl #15
 *[0-9a-f]+:	0a037c41 	and	w1, w2, w3, lsl #31
 *[0-9a-f]+:	0a430041 	and	w1, w2, w3, lsr #0
 *[0-9a-f]+:	0a430441 	and	w1, w2, w3, lsr #1
 *[0-9a-f]+:	0a430c41 	and	w1, w2, w3, lsr #3
 *[0-9a-f]+:	0a431c41 	and	w1, w2, w3, lsr #7
 *[0-9a-f]+:	0a433c41 	and	w1, w2, w3, lsr #15
 *[0-9a-f]+:	0a437c41 	and	w1, w2, w3, lsr #31
 *[0-9a-f]+:	0a830041 	and	w1, w2, w3, asr #0
 *[0-9a-f]+:	0a830441 	and	w1, w2, w3, asr #1
 *[0-9a-f]+:	0a830c41 	and	w1, w2, w3, asr #3
 *[0-9a-f]+:	0a831c41 	and	w1, w2, w3, asr #7
 *[0-9a-f]+:	0a833c41 	and	w1, w2, w3, asr #15
 *[0-9a-f]+:	0a837c41 	and	w1, w2, w3, asr #31
 *[0-9a-f]+:	0ac30041 	and	w1, w2, w3, ror #0
 *[0-9a-f]+:	0ac30441 	and	w1, w2, w3, ror #1
 *[0-9a-f]+:	0ac30c41 	and	w1, w2, w3, ror #3
 *[0-9a-f]+:	0ac31c41 	and	w1, w2, w3, ror #7
 *[0-9a-f]+:	0ac33c41 	and	w1, w2, w3, ror #15
 *[0-9a-f]+:	0ac37c41 	and	w1, w2, w3, ror #31
 *[0-9a-f]+:	ca030041 	eor	x1, x2, x3
 *[0-9a-f]+:	ca030441 	eor	x1, x2, x3, lsl #1
 *[0-9a-f]+:	ca030c41 	eor	x1, x2, x3, lsl #3
 *[0-9a-f]+:	ca031c41 	eor	x1, x2, x3, lsl #7
 *[0-9a-f]+:	ca033c41 	eor	x1, x2, x3, lsl #15
 *[0-9a-f]+:	ca037c41 	eor	x1, x2, x3, lsl #31
 *[0-9a-f]+:	ca03fc41 	eor	x1, x2, x3, lsl #63
 *[0-9a-f]+:	ca430041 	eor	x1, x2, x3, lsr #0
 *[0-9a-f]+:	ca430441 	eor	x1, x2, x3, lsr #1
 *[0-9a-f]+:	ca430c41 	eor	x1, x2, x3, lsr #3
 *[0-9a-f]+:	ca431c41 	eor	x1, x2, x3, lsr #7
 *[0-9a-f]+:	ca433c41 	eor	x1, x2, x3, lsr #15
 *[0-9a-f]+:	ca437c41 	eor	x1, x2, x3, lsr #31
 *[0-9a-f]+:	ca43fc41 	eor	x1, x2, x3, lsr #63
 *[0-9a-f]+:	ca830041 	eor	x1, x2, x3, asr #0
 *[0-9a-f]+:	ca830441 	eor	x1, x2, x3, asr #1
 *[0-9a-f]+:	ca830c41 	eor	x1, x2, x3, asr #3
 *[0-9a-f]+:	ca831c41 	eor	x1, x2, x3, asr #7
 *[0-9a-f]+:	ca833c41 	eor	x1, x2, x3, asr #15
 *[0-9a-f]+:	ca837c41 	eor	x1, x2, x3, asr #31
 *[0-9a-f]+:	ca83fc41 	eor	x1, x2, x3, asr #63
 *[0-9a-f]+:	cac30041 	eor	x1, x2, x3, ror #0
 *[0-9a-f]+:	cac30441 	eor	x1, x2, x3, ror #1
 *[0-9a-f]+:	cac30c41 	eor	x1, x2, x3, ror #3
 *[0-9a-f]+:	cac31c41 	eor	x1, x2, x3, ror #7
 *[0-9a-f]+:	cac33c41 	eor	x1, x2, x3, ror #15
 *[0-9a-f]+:	cac37c41 	eor	x1, x2, x3, ror #31
 *[0-9a-f]+:	cac3fc41 	eor	x1, x2, x3, ror #63
 *[0-9a-f]+:	4a030041 	eor	w1, w2, w3
 *[0-9a-f]+:	4a030441 	eor	w1, w2, w3, lsl #1
 *[0-9a-f]+:	4a030c41 	eor	w1, w2, w3, lsl #3
 *[0-9a-f]+:	4a031c41 	eor	w1, w2, w3, lsl #7
 *[0-9a-f]+:	4a033c41 	eor	w1, w2, w3, lsl #15
 *[0-9a-f]+:	4a037c41 	eor	w1, w2, w3, lsl #31
 *[0-9a-f]+:	4a430041 	eor	w1, w2, w3, lsr #0
 *[0-9a-f]+:	4a430441 	eor	w1, w2, w3, lsr #1
 *[0-9a-f]+:	4a430c41 	eor	w1, w2, w3, lsr #3
 *[0-9a-f]+:	4a431c41 	eor	w1, w2, w3, lsr #7
 *[0-9a-f]+:	4a433c41 	eor	w1, w2, w3, lsr #15
 *[0-9a-f]+:	4a437c41 	eor	w1, w2, w3, lsr #31
 *[0-9a-f]+:	4a830041 	eor	w1, w2, w3, asr #0
 *[0-9a-f]+:	4a830441 	eor	w1, w2, w3, asr #1
 *[0-9a-f]+:	4a830c41 	eor	w1, w2, w3, asr #3
 *[0-9a-f]+:	4a831c41 	eor	w1, w2, w3, asr #7
 *[0-9a-f]+:	4a833c41 	eor	w1, w2, w3, asr #15
 *[0-9a-f]+:	4a837c41 	eor	w1, w2, w3, asr #31
 *[0-9a-f]+:	4ac30041 	eor	w1, w2, w3, ror #0
 *[0-9a-f]+:	4ac30441 	eor	w1, w2, w3, ror #1
 *[0-9a-f]+:	4ac30c41 	eor	w1, w2, w3, ror #3
 *[0-9a-f]+:	4ac31c41 	eor	w1, w2, w3, ror #7
 *[0-9a-f]+:	4ac33c41 	eor	w1, w2, w3, ror #15
 *[0-9a-f]+:	4ac37c41 	eor	w1, w2, w3, ror #31
 *[0-9a-f]+:	8a230041 	bic	x1, x2, x3
 *[0-9a-f]+:	8a230441 	bic	x1, x2, x3, lsl #1
 *[0-9a-f]+:	8a230c41 	bic	x1, x2, x3, lsl #3
 *[0-9a-f]+:	8a231c41 	bic	x1, x2, x3, lsl #7
 *[0-9a-f]+:	8a233c41 	bic	x1, x2, x3, lsl #15
 *[0-9a-f]+:	8a237c41 	bic	x1, x2, x3, lsl #31
 *[0-9a-f]+:	8a23fc41 	bic	x1, x2, x3, lsl #63
 *[0-9a-f]+:	8a630041 	bic	x1, x2, x3, lsr #0
 *[0-9a-f]+:	8a630441 	bic	x1, x2, x3, lsr #1
 *[0-9a-f]+:	8a630c41 	bic	x1, x2, x3, lsr #3
 *[0-9a-f]+:	8a631c41 	bic	x1, x2, x3, lsr #7
 *[0-9a-f]+:	8a633c41 	bic	x1, x2, x3, lsr #15
 *[0-9a-f]+:	8a637c41 	bic	x1, x2, x3, lsr #31
 *[0-9a-f]+:	8a63fc41 	bic	x1, x2, x3, lsr #63
 *[0-9a-f]+:	8aa30041 	bic	x1, x2, x3, asr #0
 *[0-9a-f]+:	8aa30441 	bic	x1, x2, x3, asr #1
 *[0-9a-f]+:	8aa30c41 	bic	x1, x2, x3, asr #3
 *[0-9a-f]+:	8aa31c41 	bic	x1, x2, x3, asr #7
 *[0-9a-f]+:	8aa33c41 	bic	x1, x2, x3, asr #15
 *[0-9a-f]+:	8aa37c41 	bic	x1, x2, x3, asr #31
 *[0-9a-f]+:	8aa3fc41 	bic	x1, x2, x3, asr #63
 *[0-9a-f]+:	8ae30041 	bic	x1, x2, x3, ror #0
 *[0-9a-f]+:	8ae30441 	bic	x1, x2, x3, ror #1
 *[0-9a-f]+:	8ae30c41 	bic	x1, x2, x3, ror #3
 *[0-9a-f]+:	8ae31c41 	bic	x1, x2, x3, ror #7
 *[0-9a-f]+:	8ae33c41 	bic	x1, x2, x3, ror #15
 *[0-9a-f]+:	8ae37c41 	bic	x1, x2, x3, ror #31
 *[0-9a-f]+:	8ae3fc41 	bic	x1, x2, x3, ror #63
 *[0-9a-f]+:	0a230041 	bic	w1, w2, w3
 *[0-9a-f]+:	0a230441 	bic	w1, w2, w3, lsl #1
 *[0-9a-f]+:	0a230c41 	bic	w1, w2, w3, lsl #3
 *[0-9a-f]+:	0a231c41 	bic	w1, w2, w3, lsl #7
 *[0-9a-f]+:	0a233c41 	bic	w1, w2, w3, lsl #15
 *[0-9a-f]+:	0a237c41 	bic	w1, w2, w3, lsl #31
 *[0-9a-f]+:	0a630041 	bic	w1, w2, w3, lsr #0
 *[0-9a-f]+:	0a630441 	bic	w1, w2, w3, lsr #1
 *[0-9a-f]+:	0a630c41 	bic	w1, w2, w3, lsr #3
 *[0-9a-f]+:	0a631c41 	bic	w1, w2, w3, lsr #7
 *[0-9a-f]+:	0a633c41 	bic	w1, w2, w3, lsr #15
 *[0-9a-f]+:	0a637c41 	bic	w1, w2, w3, lsr #31
 *[0-9a-f]+:	0aa30041 	bic	w1, w2, w3, asr #0
 *[0-9a-f]+:	0aa30441 	bic	w1, w2, w3, asr #1
 *[0-9a-f]+:	0aa30c41 	bic	w1, w2, w3, asr #3
 *[0-9a-f]+:	0aa31c41 	bic	w1, w2, w3, asr #7
 *[0-9a-f]+:	0aa33c41 	bic	w1, w2, w3, asr #15
 *[0-9a-f]+:	0aa37c41 	bic	w1, w2, w3, asr #31
 *[0-9a-f]+:	0ae30041 	bic	w1, w2, w3, ror #0
 *[0-9a-f]+:	0ae30441 	bic	w1, w2, w3, ror #1
 *[0-9a-f]+:	0ae30c41 	bic	w1, w2, w3, ror #3
 *[0-9a-f]+:	0ae31c41 	bic	w1, w2, w3, ror #7
 *[0-9a-f]+:	0ae33c41 	bic	w1, w2, w3, ror #15
 *[0-9a-f]+:	0ae37c41 	bic	w1, w2, w3, ror #31
 *[0-9a-f]+:	aa230041 	orn	x1, x2, x3
 *[0-9a-f]+:	aa230441 	orn	x1, x2, x3, lsl #1
 *[0-9a-f]+:	aa230c41 	orn	x1, x2, x3, lsl #3
 *[0-9a-f]+:	aa231c41 	orn	x1, x2, x3, lsl #7
 *[0-9a-f]+:	aa233c41 	orn	x1, x2, x3, lsl #15
 *[0-9a-f]+:	aa237c41 	orn	x1, x2, x3, lsl #31
 *[0-9a-f]+:	aa23fc41 	orn	x1, x2, x3, lsl #63
 *[0-9a-f]+:	aa630041 	orn	x1, x2, x3, lsr #0
 *[0-9a-f]+:	aa630441 	orn	x1, x2, x3, lsr #1
 *[0-9a-f]+:	aa630c41 	orn	x1, x2, x3, lsr #3
 *[0-9a-f]+:	aa631c41 	orn	x1, x2, x3, lsr #7
 *[0-9a-f]+:	aa633c41 	orn	x1, x2, x3, lsr #15
 *[0-9a-f]+:	aa637c41 	orn	x1, x2, x3, lsr #31
 *[0-9a-f]+:	aa63fc41 	orn	x1, x2, x3, lsr #63
 *[0-9a-f]+:	aaa30041 	orn	x1, x2, x3, asr #0
 *[0-9a-f]+:	aaa30441 	orn	x1, x2, x3, asr #1
 *[0-9a-f]+:	aaa30c41 	orn	x1, x2, x3, asr #3
 *[0-9a-f]+:	aaa31c41 	orn	x1, x2, x3, asr #7
 *[0-9a-f]+:	aaa33c41 	orn	x1, x2, x3, asr #15
 *[0-9a-f]+:	aaa37c41 	orn	x1, x2, x3, asr #31
 *[0-9a-f]+:	aaa3fc41 	orn	x1, x2, x3, asr #63
 *[0-9a-f]+:	aae30041 	orn	x1, x2, x3, ror #0
 *[0-9a-f]+:	aae30441 	orn	x1, x2, x3, ror #1
 *[0-9a-f]+:	aae30c41 	orn	x1, x2, x3, ror #3
 *[0-9a-f]+:	aae31c41 	orn	x1, x2, x3, ror #7
 *[0-9a-f]+:	aae33c41 	orn	x1, x2, x3, ror #15
 *[0-9a-f]+:	aae37c41 	orn	x1, x2, x3, ror #31
 *[0-9a-f]+:	aae3fc41 	orn	x1, x2, x3, ror #63
 *[0-9a-f]+:	2a230041 	orn	w1, w2, w3
 *[0-9a-f]+:	2a230441 	orn	w1, w2, w3, lsl #1
 *[0-9a-f]+:	2a230c41 	orn	w1, w2, w3, lsl #3
 *[0-9a-f]+:	2a231c41 	orn	w1, w2, w3, lsl #7
 *[0-9a-f]+:	2a233c41 	orn	w1, w2, w3, lsl #15
 *[0-9a-f]+:	2a237c41 	orn	w1, w2, w3, lsl #31
 *[0-9a-f]+:	2a630041 	orn	w1, w2, w3, lsr #0
 *[0-9a-f]+:	2a630441 	orn	w1, w2, w3, lsr #1
 *[0-9a-f]+:	2a630c41 	orn	w1, w2, w3, lsr #3
 *[0-9a-f]+:	2a631c41 	orn	w1, w2, w3, lsr #7
 *[0-9a-f]+:	2a633c41 	orn	w1, w2, w3, lsr #15
 *[0-9a-f]+:	2a637c41 	orn	w1, w2, w3, lsr #31
 *[0-9a-f]+:	2aa30041 	orn	w1, w2, w3, asr #0
 *[0-9a-f]+:	2aa30441 	orn	w1, w2, w3, asr #1
 *[0-9a-f]+:	2aa30c41 	orn	w1, w2, w3, asr #3
 *[0-9a-f]+:	2aa31c41 	orn	w1, w2, w3, asr #7
 *[0-9a-f]+:	2aa33c41 	orn	w1, w2, w3, asr #15
 *[0-9a-f]+:	2aa37c41 	orn	w1, w2, w3, asr #31
 *[0-9a-f]+:	2ae30041 	orn	w1, w2, w3, ror #0
 *[0-9a-f]+:	2ae30441 	orn	w1, w2, w3, ror #1
 *[0-9a-f]+:	2ae30c41 	orn	w1, w2, w3, ror #3
 *[0-9a-f]+:	2ae31c41 	orn	w1, w2, w3, ror #7
 *[0-9a-f]+:	2ae33c41 	orn	w1, w2, w3, ror #15
 *[0-9a-f]+:	2ae37c41 	orn	w1, w2, w3, ror #31
 *[0-9a-f]+:	ca230041 	eon	x1, x2, x3
 *[0-9a-f]+:	ca230441 	eon	x1, x2, x3, lsl #1
 *[0-9a-f]+:	ca230c41 	eon	x1, x2, x3, lsl #3
 *[0-9a-f]+:	ca231c41 	eon	x1, x2, x3, lsl #7
 *[0-9a-f]+:	ca233c41 	eon	x1, x2, x3, lsl #15
 *[0-9a-f]+:	ca237c41 	eon	x1, x2, x3, lsl #31
 *[0-9a-f]+:	ca23fc41 	eon	x1, x2, x3, lsl #63
 *[0-9a-f]+:	ca630041 	eon	x1, x2, x3, lsr #0
 *[0-9a-f]+:	ca630441 	eon	x1, x2, x3, lsr #1
 *[0-9a-f]+:	ca630c41 	eon	x1, x2, x3, lsr #3
 *[0-9a-f]+:	ca631c41 	eon	x1, x2, x3, lsr #7
 *[0-9a-f]+:	ca633c41 	eon	x1, x2, x3, lsr #15
 *[0-9a-f]+:	ca637c41 	eon	x1, x2, x3, lsr #31
 *[0-9a-f]+:	ca63fc41 	eon	x1, x2, x3, lsr #63
 *[0-9a-f]+:	caa30041 	eon	x1, x2, x3, asr #0
 *[0-9a-f]+:	caa30441 	eon	x1, x2, x3, asr #1
 *[0-9a-f]+:	caa30c41 	eon	x1, x2, x3, asr #3
 *[0-9a-f]+:	caa31c41 	eon	x1, x2, x3, asr #7
 *[0-9a-f]+:	caa33c41 	eon	x1, x2, x3, asr #15
 *[0-9a-f]+:	caa37c41 	eon	x1, x2, x3, asr #31
 *[0-9a-f]+:	caa3fc41 	eon	x1, x2, x3, asr #63
 *[0-9a-f]+:	cae30041 	eon	x1, x2, x3, ror #0
 *[0-9a-f]+:	cae30441 	eon	x1, x2, x3, ror #1
 *[0-9a-f]+:	cae30c41 	eon	x1, x2, x3, ror #3
 *[0-9a-f]+:	cae31c41 	eon	x1, x2, x3, ror #7
 *[0-9a-f]+:	cae33c41 	eon	x1, x2, x3, ror #15
 *[0-9a-f]+:	cae37c41 	eon	x1, x2, x3, ror #31
 *[0-9a-f]+:	cae3fc41 	eon	x1, x2, x3, ror #63
 *[0-9a-f]+:	4a230041 	eon	w1, w2, w3
 *[0-9a-f]+:	4a230441 	eon	w1, w2, w3, lsl #1
 *[0-9a-f]+:	4a230c41 	eon	w1, w2, w3, lsl #3
 *[0-9a-f]+:	4a231c41 	eon	w1, w2, w3, lsl #7
 *[0-9a-f]+:	4a233c41 	eon	w1, w2, w3, lsl #15
 *[0-9a-f]+:	4a237c41 	eon	w1, w2, w3, lsl #31
 *[0-9a-f]+:	4a630041 	eon	w1, w2, w3, lsr #0
 *[0-9a-f]+:	4a630441 	eon	w1, w2, w3, lsr #1
 *[0-9a-f]+:	4a630c41 	eon	w1, w2, w3, lsr #3
 *[0-9a-f]+:	4a631c41 	eon	w1, w2, w3, lsr #7
 *[0-9a-f]+:	4a633c41 	eon	w1, w2, w3, lsr #15
 *[0-9a-f]+:	4a637c41 	eon	w1, w2, w3, lsr #31
 *[0-9a-f]+:	4aa30041 	eon	w1, w2, w3, asr #0
 *[0-9a-f]+:	4aa30441 	eon	w1, w2, w3, asr #1
 *[0-9a-f]+:	4aa30c41 	eon	w1, w2, w3, asr #3
 *[0-9a-f]+:	4aa31c41 	eon	w1, w2, w3, asr #7
 *[0-9a-f]+:	4aa33c41 	eon	w1, w2, w3, asr #15
 *[0-9a-f]+:	4aa37c41 	eon	w1, w2, w3, asr #31
 *[0-9a-f]+:	4ae30041 	eon	w1, w2, w3, ror #0
 *[0-9a-f]+:	4ae30441 	eon	w1, w2, w3, ror #1
 *[0-9a-f]+:	4ae30c41 	eon	w1, w2, w3, ror #3
 *[0-9a-f]+:	4ae31c41 	eon	w1, w2, w3, ror #7
 *[0-9a-f]+:	4ae33c41 	eon	w1, w2, w3, ror #15
 *[0-9a-f]+:	4ae37c41 	eon	w1, w2, w3, ror #31
 *[0-9a-f]+:	ea030041 	ands	x1, x2, x3
 *[0-9a-f]+:	ea030441 	ands	x1, x2, x3, lsl #1
 *[0-9a-f]+:	ea030c41 	ands	x1, x2, x3, lsl #3
 *[0-9a-f]+:	ea031c41 	ands	x1, x2, x3, lsl #7
 *[0-9a-f]+:	ea033c41 	ands	x1, x2, x3, lsl #15
 *[0-9a-f]+:	ea037c41 	ands	x1, x2, x3, lsl #31
 *[0-9a-f]+:	ea03fc41 	ands	x1, x2, x3, lsl #63
 *[0-9a-f]+:	ea430041 	ands	x1, x2, x3, lsr #0
 *[0-9a-f]+:	ea430441 	ands	x1, x2, x3, lsr #1
 *[0-9a-f]+:	ea430c41 	ands	x1, x2, x3, lsr #3
 *[0-9a-f]+:	ea431c41 	ands	x1, x2, x3, lsr #7
 *[0-9a-f]+:	ea433c41 	ands	x1, x2, x3, lsr #15
 *[0-9a-f]+:	ea437c41 	ands	x1, x2, x3, lsr #31
 *[0-9a-f]+:	ea43fc41 	ands	x1, x2, x3, lsr #63
 *[0-9a-f]+:	ea830041 	ands	x1, x2, x3, asr #0
 *[0-9a-f]+:	ea830441 	ands	x1, x2, x3, asr #1
 *[0-9a-f]+:	ea830c41 	ands	x1, x2, x3, asr #3
 *[0-9a-f]+:	ea831c41 	ands	x1, x2, x3, asr #7
 *[0-9a-f]+:	ea833c41 	ands	x1, x2, x3, asr #15
 *[0-9a-f]+:	ea837c41 	ands	x1, x2, x3, asr #31
 *[0-9a-f]+:	ea83fc41 	ands	x1, x2, x3, asr #63
 *[0-9a-f]+:	eac30041 	ands	x1, x2, x3, ror #0
 *[0-9a-f]+:	eac30441 	ands	x1, x2, x3, ror #1
 *[0-9a-f]+:	eac30c41 	ands	x1, x2, x3, ror #3
 *[0-9a-f]+:	eac31c41 	ands	x1, x2, x3, ror #7
 *[0-9a-f]+:	eac33c41 	ands	x1, x2, x3, ror #15
 *[0-9a-f]+:	eac37c41 	ands	x1, x2, x3, ror #31
 *[0-9a-f]+:	eac3fc41 	ands	x1, x2, x3, ror #63
 *[0-9a-f]+:	6a030041 	ands	w1, w2, w3
 *[0-9a-f]+:	6a030441 	ands	w1, w2, w3, lsl #1
 *[0-9a-f]+:	6a030c41 	ands	w1, w2, w3, lsl #3
 *[0-9a-f]+:	6a031c41 	ands	w1, w2, w3, lsl #7
 *[0-9a-f]+:	6a033c41 	ands	w1, w2, w3, lsl #15
 *[0-9a-f]+:	6a037c41 	ands	w1, w2, w3, lsl #31
 *[0-9a-f]+:	6a430041 	ands	w1, w2, w3, lsr #0
 *[0-9a-f]+:	6a430441 	ands	w1, w2, w3, lsr #1
 *[0-9a-f]+:	6a430c41 	ands	w1, w2, w3, lsr #3
 *[0-9a-f]+:	6a431c41 	ands	w1, w2, w3, lsr #7
 *[0-9a-f]+:	6a433c41 	ands	w1, w2, w3, lsr #15
 *[0-9a-f]+:	6a437c41 	ands	w1, w2, w3, lsr #31
 *[0-9a-f]+:	6a830041 	ands	w1, w2, w3, asr #0
 *[0-9a-f]+:	6a830441 	ands	w1, w2, w3, asr #1
 *[0-9a-f]+:	6a830c41 	ands	w1, w2, w3, asr #3
 *[0-9a-f]+:	6a831c41 	ands	w1, w2, w3, asr #7
 *[0-9a-f]+:	6a833c41 	ands	w1, w2, w3, asr #15
 *[0-9a-f]+:	6a837c41 	ands	w1, w2, w3, asr #31
 *[0-9a-f]+:	6ac30041 	ands	w1, w2, w3, ror #0
 *[0-9a-f]+:	6ac30441 	ands	w1, w2, w3, ror #1
 *[0-9a-f]+:	6ac30c41 	ands	w1, w2, w3, ror #3
 *[0-9a-f]+:	6ac31c41 	ands	w1, w2, w3, ror #7
 *[0-9a-f]+:	6ac33c41 	ands	w1, w2, w3, ror #15
 *[0-9a-f]+:	6ac37c41 	ands	w1, w2, w3, ror #31
 *[0-9a-f]+:	ea230041 	bics	x1, x2, x3
 *[0-9a-f]+:	ea230441 	bics	x1, x2, x3, lsl #1
 *[0-9a-f]+:	ea230c41 	bics	x1, x2, x3, lsl #3
 *[0-9a-f]+:	ea231c41 	bics	x1, x2, x3, lsl #7
 *[0-9a-f]+:	ea233c41 	bics	x1, x2, x3, lsl #15
 *[0-9a-f]+:	ea237c41 	bics	x1, x2, x3, lsl #31
 *[0-9a-f]+:	ea23fc41 	bics	x1, x2, x3, lsl #63
 *[0-9a-f]+:	ea630041 	bics	x1, x2, x3, lsr #0
 *[0-9a-f]+:	ea630441 	bics	x1, x2, x3, lsr #1
 *[0-9a-f]+:	ea630c41 	bics	x1, x2, x3, lsr #3
 *[0-9a-f]+:	ea631c41 	bics	x1, x2, x3, lsr #7
 *[0-9a-f]+:	ea633c41 	bics	x1, x2, x3, lsr #15
 *[0-9a-f]+:	ea637c41 	bics	x1, x2, x3, lsr #31
 *[0-9a-f]+:	ea63fc41 	bics	x1, x2, x3, lsr #63
 *[0-9a-f]+:	eaa30041 	bics	x1, x2, x3, asr #0
 *[0-9a-f]+:	eaa30441 	bics	x1, x2, x3, asr #1
 *[0-9a-f]+:	eaa30c41 	bics	x1, x2, x3, asr #3
 *[0-9a-f]+:	eaa31c41 	bics	x1, x2, x3, asr #7
 *[0-9a-f]+:	eaa33c41 	bics	x1, x2, x3, asr #15
 *[0-9a-f]+:	eaa37c41 	bics	x1, x2, x3, asr #31
 *[0-9a-f]+:	eaa3fc41 	bics	x1, x2, x3, asr #63
 *[0-9a-f]+:	eae30041 	bics	x1, x2, x3, ror #0
 *[0-9a-f]+:	eae30441 	bics	x1, x2, x3, ror #1
 *[0-9a-f]+:	eae30c41 	bics	x1, x2, x3, ror #3
 *[0-9a-f]+:	eae31c41 	bics	x1, x2, x3, ror #7
 *[0-9a-f]+:	eae33c41 	bics	x1, x2, x3, ror #15
 *[0-9a-f]+:	eae37c41 	bics	x1, x2, x3, ror #31
 *[0-9a-f]+:	eae3fc41 	bics	x1, x2, x3, ror #63
 *[0-9a-f]+:	6a230041 	bics	w1, w2, w3
 *[0-9a-f]+:	6a230441 	bics	w1, w2, w3, lsl #1
 *[0-9a-f]+:	6a230c41 	bics	w1, w2, w3, lsl #3
 *[0-9a-f]+:	6a231c41 	bics	w1, w2, w3, lsl #7
 *[0-9a-f]+:	6a233c41 	bics	w1, w2, w3, lsl #15
 *[0-9a-f]+:	6a237c41 	bics	w1, w2, w3, lsl #31
 *[0-9a-f]+:	6a630041 	bics	w1, w2, w3, lsr #0
 *[0-9a-f]+:	6a630441 	bics	w1, w2, w3, lsr #1
 *[0-9a-f]+:	6a630c41 	bics	w1, w2, w3, lsr #3
 *[0-9a-f]+:	6a631c41 	bics	w1, w2, w3, lsr #7
 *[0-9a-f]+:	6a633c41 	bics	w1, w2, w3, lsr #15
 *[0-9a-f]+:	6a637c41 	bics	w1, w2, w3, lsr #31
 *[0-9a-f]+:	6aa30041 	bics	w1, w2, w3, asr #0
 *[0-9a-f]+:	6aa30441 	bics	w1, w2, w3, asr #1
 *[0-9a-f]+:	6aa30c41 	bics	w1, w2, w3, asr #3
 *[0-9a-f]+:	6aa31c41 	bics	w1, w2, w3, asr #7
 *[0-9a-f]+:	6aa33c41 	bics	w1, w2, w3, asr #15
 *[0-9a-f]+:	6aa37c41 	bics	w1, w2, w3, asr #31
 *[0-9a-f]+:	6ae30041 	bics	w1, w2, w3, ror #0
 *[0-9a-f]+:	6ae30441 	bics	w1, w2, w3, ror #1
 *[0-9a-f]+:	6ae30c41 	bics	w1, w2, w3, ror #3
 *[0-9a-f]+:	6ae31c41 	bics	w1, w2, w3, ror #7
 *[0-9a-f]+:	6ae33c41 	bics	w1, w2, w3, ror #15
 *[0-9a-f]+:	6ae37c41 	bics	w1, w2, w3, ror #31
 *[0-9a-f]+:	8b030041 	add	x1, x2, x3
 *[0-9a-f]+:	8b030441 	add	x1, x2, x3, lsl #1
 *[0-9a-f]+:	8b030c41 	add	x1, x2, x3, lsl #3
 *[0-9a-f]+:	8b031c41 	add	x1, x2, x3, lsl #7
 *[0-9a-f]+:	8b033c41 	add	x1, x2, x3, lsl #15
 *[0-9a-f]+:	8b037c41 	add	x1, x2, x3, lsl #31
 *[0-9a-f]+:	8b03fc41 	add	x1, x2, x3, lsl #63
 *[0-9a-f]+:	8b430041 	add	x1, x2, x3, lsr #0
 *[0-9a-f]+:	8b430441 	add	x1, x2, x3, lsr #1
 *[0-9a-f]+:	8b430c41 	add	x1, x2, x3, lsr #3
 *[0-9a-f]+:	8b431c41 	add	x1, x2, x3, lsr #7
 *[0-9a-f]+:	8b433c41 	add	x1, x2, x3, lsr #15
 *[0-9a-f]+:	8b437c41 	add	x1, x2, x3, lsr #31
 *[0-9a-f]+:	8b43fc41 	add	x1, x2, x3, lsr #63
 *[0-9a-f]+:	8b830041 	add	x1, x2, x3, asr #0
 *[0-9a-f]+:	8b830441 	add	x1, x2, x3, asr #1
 *[0-9a-f]+:	8b830c41 	add	x1, x2, x3, asr #3
 *[0-9a-f]+:	8b831c41 	add	x1, x2, x3, asr #7
 *[0-9a-f]+:	8b833c41 	add	x1, x2, x3, asr #15
 *[0-9a-f]+:	8b837c41 	add	x1, x2, x3, asr #31
 *[0-9a-f]+:	8b83fc41 	add	x1, x2, x3, asr #63
 *[0-9a-f]+:	8b230041 	add	x1, x2, w3, uxtb
 *[0-9a-f]+:	8b230441 	add	x1, x2, w3, uxtb #1
 *[0-9a-f]+:	8b230841 	add	x1, x2, w3, uxtb #2
 *[0-9a-f]+:	8b230c41 	add	x1, x2, w3, uxtb #3
 *[0-9a-f]+:	8b231041 	add	x1, x2, w3, uxtb #4
 *[0-9a-f]+:	8b232041 	add	x1, x2, w3, uxth
 *[0-9a-f]+:	8b232441 	add	x1, x2, w3, uxth #1
 *[0-9a-f]+:	8b232841 	add	x1, x2, w3, uxth #2
 *[0-9a-f]+:	8b232c41 	add	x1, x2, w3, uxth #3
 *[0-9a-f]+:	8b233041 	add	x1, x2, w3, uxth #4
 *[0-9a-f]+:	8b234041 	add	x1, x2, w3, uxtw
 *[0-9a-f]+:	8b234441 	add	x1, x2, w3, uxtw #1
 *[0-9a-f]+:	8b234841 	add	x1, x2, w3, uxtw #2
 *[0-9a-f]+:	8b234c41 	add	x1, x2, w3, uxtw #3
 *[0-9a-f]+:	8b235041 	add	x1, x2, w3, uxtw #4
 *[0-9a-f]+:	8b236041 	add	x1, x2, x3, uxtx
 *[0-9a-f]+:	8b236441 	add	x1, x2, x3, uxtx #1
 *[0-9a-f]+:	8b236841 	add	x1, x2, x3, uxtx #2
 *[0-9a-f]+:	8b236c41 	add	x1, x2, x3, uxtx #3
 *[0-9a-f]+:	8b237041 	add	x1, x2, x3, uxtx #4
 *[0-9a-f]+:	8b238041 	add	x1, x2, w3, sxtb
 *[0-9a-f]+:	8b238441 	add	x1, x2, w3, sxtb #1
 *[0-9a-f]+:	8b238841 	add	x1, x2, w3, sxtb #2
 *[0-9a-f]+:	8b238c41 	add	x1, x2, w3, sxtb #3
 *[0-9a-f]+:	8b239041 	add	x1, x2, w3, sxtb #4
 *[0-9a-f]+:	8b23a041 	add	x1, x2, w3, sxth
 *[0-9a-f]+:	8b23a441 	add	x1, x2, w3, sxth #1
 *[0-9a-f]+:	8b23a841 	add	x1, x2, w3, sxth #2
 *[0-9a-f]+:	8b23ac41 	add	x1, x2, w3, sxth #3
 *[0-9a-f]+:	8b23b041 	add	x1, x2, w3, sxth #4
 *[0-9a-f]+:	8b23c041 	add	x1, x2, w3, sxtw
 *[0-9a-f]+:	8b23c441 	add	x1, x2, w3, sxtw #1
 *[0-9a-f]+:	8b23c841 	add	x1, x2, w3, sxtw #2
 *[0-9a-f]+:	8b23cc41 	add	x1, x2, w3, sxtw #3
 *[0-9a-f]+:	8b23d041 	add	x1, x2, w3, sxtw #4
 *[0-9a-f]+:	8b23e041 	add	x1, x2, x3, sxtx
 *[0-9a-f]+:	8b23e441 	add	x1, x2, x3, sxtx #1
 *[0-9a-f]+:	8b23e841 	add	x1, x2, x3, sxtx #2
 *[0-9a-f]+:	8b23ec41 	add	x1, x2, x3, sxtx #3
 *[0-9a-f]+:	8b23f041 	add	x1, x2, x3, sxtx #4
 *[0-9a-f]+:	0b030041 	add	w1, w2, w3
 *[0-9a-f]+:	0b030441 	add	w1, w2, w3, lsl #1
 *[0-9a-f]+:	0b030c41 	add	w1, w2, w3, lsl #3
 *[0-9a-f]+:	0b031c41 	add	w1, w2, w3, lsl #7
 *[0-9a-f]+:	0b033c41 	add	w1, w2, w3, lsl #15
 *[0-9a-f]+:	0b037c41 	add	w1, w2, w3, lsl #31
 *[0-9a-f]+:	0b430041 	add	w1, w2, w3, lsr #0
 *[0-9a-f]+:	0b430441 	add	w1, w2, w3, lsr #1
 *[0-9a-f]+:	0b430c41 	add	w1, w2, w3, lsr #3
 *[0-9a-f]+:	0b431c41 	add	w1, w2, w3, lsr #7
 *[0-9a-f]+:	0b433c41 	add	w1, w2, w3, lsr #15
 *[0-9a-f]+:	0b437c41 	add	w1, w2, w3, lsr #31
 *[0-9a-f]+:	0b830041 	add	w1, w2, w3, asr #0
 *[0-9a-f]+:	0b830441 	add	w1, w2, w3, asr #1
 *[0-9a-f]+:	0b830c41 	add	w1, w2, w3, asr #3
 *[0-9a-f]+:	0b831c41 	add	w1, w2, w3, asr #7
 *[0-9a-f]+:	0b833c41 	add	w1, w2, w3, asr #15
 *[0-9a-f]+:	0b837c41 	add	w1, w2, w3, asr #31
 *[0-9a-f]+:	0b230041 	add	w1, w2, w3, uxtb
 *[0-9a-f]+:	0b230441 	add	w1, w2, w3, uxtb #1
 *[0-9a-f]+:	0b230841 	add	w1, w2, w3, uxtb #2
 *[0-9a-f]+:	0b230c41 	add	w1, w2, w3, uxtb #3
 *[0-9a-f]+:	0b231041 	add	w1, w2, w3, uxtb #4
 *[0-9a-f]+:	0b232041 	add	w1, w2, w3, uxth
 *[0-9a-f]+:	0b232441 	add	w1, w2, w3, uxth #1
 *[0-9a-f]+:	0b232841 	add	w1, w2, w3, uxth #2
 *[0-9a-f]+:	0b232c41 	add	w1, w2, w3, uxth #3
 *[0-9a-f]+:	0b233041 	add	w1, w2, w3, uxth #4
 *[0-9a-f]+:	0b238041 	add	w1, w2, w3, sxtb
 *[0-9a-f]+:	0b238441 	add	w1, w2, w3, sxtb #1
 *[0-9a-f]+:	0b238841 	add	w1, w2, w3, sxtb #2
 *[0-9a-f]+:	0b238c41 	add	w1, w2, w3, sxtb #3
 *[0-9a-f]+:	0b239041 	add	w1, w2, w3, sxtb #4
 *[0-9a-f]+:	0b23a041 	add	w1, w2, w3, sxth
 *[0-9a-f]+:	0b23a441 	add	w1, w2, w3, sxth #1
 *[0-9a-f]+:	0b23a841 	add	w1, w2, w3, sxth #2
 *[0-9a-f]+:	0b23ac41 	add	w1, w2, w3, sxth #3
 *[0-9a-f]+:	0b23b041 	add	w1, w2, w3, sxth #4
 *[0-9a-f]+:	cb030041 	sub	x1, x2, x3
 *[0-9a-f]+:	cb030441 	sub	x1, x2, x3, lsl #1
 *[0-9a-f]+:	cb030c41 	sub	x1, x2, x3, lsl #3
 *[0-9a-f]+:	cb031c41 	sub	x1, x2, x3, lsl #7
 *[0-9a-f]+:	cb033c41 	sub	x1, x2, x3, lsl #15
 *[0-9a-f]+:	cb037c41 	sub	x1, x2, x3, lsl #31
 *[0-9a-f]+:	cb03fc41 	sub	x1, x2, x3, lsl #63
 *[0-9a-f]+:	cb430041 	sub	x1, x2, x3, lsr #0
 *[0-9a-f]+:	cb430441 	sub	x1, x2, x3, lsr #1
 *[0-9a-f]+:	cb430c41 	sub	x1, x2, x3, lsr #3
 *[0-9a-f]+:	cb431c41 	sub	x1, x2, x3, lsr #7
 *[0-9a-f]+:	cb433c41 	sub	x1, x2, x3, lsr #15
 *[0-9a-f]+:	cb437c41 	sub	x1, x2, x3, lsr #31
 *[0-9a-f]+:	cb43fc41 	sub	x1, x2, x3, lsr #63
 *[0-9a-f]+:	cb830041 	sub	x1, x2, x3, asr #0
 *[0-9a-f]+:	cb830441 	sub	x1, x2, x3, asr #1
 *[0-9a-f]+:	cb830c41 	sub	x1, x2, x3, asr #3
 *[0-9a-f]+:	cb831c41 	sub	x1, x2, x3, asr #7
 *[0-9a-f]+:	cb833c41 	sub	x1, x2, x3, asr #15
 *[0-9a-f]+:	cb837c41 	sub	x1, x2, x3, asr #31
 *[0-9a-f]+:	cb83fc41 	sub	x1, x2, x3, asr #63
 *[0-9a-f]+:	cb230041 	sub	x1, x2, w3, uxtb
 *[0-9a-f]+:	cb230441 	sub	x1, x2, w3, uxtb #1
 *[0-9a-f]+:	cb230841 	sub	x1, x2, w3, uxtb #2
 *[0-9a-f]+:	cb230c41 	sub	x1, x2, w3, uxtb #3
 *[0-9a-f]+:	cb231041 	sub	x1, x2, w3, uxtb #4
 *[0-9a-f]+:	cb232041 	sub	x1, x2, w3, uxth
 *[0-9a-f]+:	cb232441 	sub	x1, x2, w3, uxth #1
 *[0-9a-f]+:	cb232841 	sub	x1, x2, w3, uxth #2
 *[0-9a-f]+:	cb232c41 	sub	x1, x2, w3, uxth #3
 *[0-9a-f]+:	cb233041 	sub	x1, x2, w3, uxth #4
 *[0-9a-f]+:	cb234041 	sub	x1, x2, w3, uxtw
 *[0-9a-f]+:	cb234441 	sub	x1, x2, w3, uxtw #1
 *[0-9a-f]+:	cb234841 	sub	x1, x2, w3, uxtw #2
 *[0-9a-f]+:	cb234c41 	sub	x1, x2, w3, uxtw #3
 *[0-9a-f]+:	cb235041 	sub	x1, x2, w3, uxtw #4
 *[0-9a-f]+:	cb236041 	sub	x1, x2, x3, uxtx
 *[0-9a-f]+:	cb236441 	sub	x1, x2, x3, uxtx #1
 *[0-9a-f]+:	cb236841 	sub	x1, x2, x3, uxtx #2
 *[0-9a-f]+:	cb236c41 	sub	x1, x2, x3, uxtx #3
 *[0-9a-f]+:	cb237041 	sub	x1, x2, x3, uxtx #4
 *[0-9a-f]+:	cb238041 	sub	x1, x2, w3, sxtb
 *[0-9a-f]+:	cb238441 	sub	x1, x2, w3, sxtb #1
 *[0-9a-f]+:	cb238841 	sub	x1, x2, w3, sxtb #2
 *[0-9a-f]+:	cb238c41 	sub	x1, x2, w3, sxtb #3
 *[0-9a-f]+:	cb239041 	sub	x1, x2, w3, sxtb #4
 *[0-9a-f]+:	cb23a041 	sub	x1, x2, w3, sxth
 *[0-9a-f]+:	cb23a441 	sub	x1, x2, w3, sxth #1
 *[0-9a-f]+:	cb23a841 	sub	x1, x2, w3, sxth #2
 *[0-9a-f]+:	cb23ac41 	sub	x1, x2, w3, sxth #3
 *[0-9a-f]+:	cb23b041 	sub	x1, x2, w3, sxth #4
 *[0-9a-f]+:	cb23c041 	sub	x1, x2, w3, sxtw
 *[0-9a-f]+:	cb23c441 	sub	x1, x2, w3, sxtw #1
 *[0-9a-f]+:	cb23c841 	sub	x1, x2, w3, sxtw #2
 *[0-9a-f]+:	cb23cc41 	sub	x1, x2, w3, sxtw #3
 *[0-9a-f]+:	cb23d041 	sub	x1, x2, w3, sxtw #4
 *[0-9a-f]+:	cb23e041 	sub	x1, x2, x3, sxtx
 *[0-9a-f]+:	cb23e441 	sub	x1, x2, x3, sxtx #1
 *[0-9a-f]+:	cb23e841 	sub	x1, x2, x3, sxtx #2
 *[0-9a-f]+:	cb23ec41 	sub	x1, x2, x3, sxtx #3
 *[0-9a-f]+:	cb23f041 	sub	x1, x2, x3, sxtx #4
 *[0-9a-f]+:	4b030041 	sub	w1, w2, w3
 *[0-9a-f]+:	4b030441 	sub	w1, w2, w3, lsl #1
 *[0-9a-f]+:	4b030c41 	sub	w1, w2, w3, lsl #3
 *[0-9a-f]+:	4b031c41 	sub	w1, w2, w3, lsl #7
 *[0-9a-f]+:	4b033c41 	sub	w1, w2, w3, lsl #15
 *[0-9a-f]+:	4b037c41 	sub	w1, w2, w3, lsl #31
 *[0-9a-f]+:	4b430041 	sub	w1, w2, w3, lsr #0
 *[0-9a-f]+:	4b430441 	sub	w1, w2, w3, lsr #1
 *[0-9a-f]+:	4b430c41 	sub	w1, w2, w3, lsr #3
 *[0-9a-f]+:	4b431c41 	sub	w1, w2, w3, lsr #7
 *[0-9a-f]+:	4b433c41 	sub	w1, w2, w3, lsr #15
 *[0-9a-f]+:	4b437c41 	sub	w1, w2, w3, lsr #31
 *[0-9a-f]+:	4b830041 	sub	w1, w2, w3, asr #0
 *[0-9a-f]+:	4b830441 	sub	w1, w2, w3, asr #1
 *[0-9a-f]+:	4b830c41 	sub	w1, w2, w3, asr #3
 *[0-9a-f]+:	4b831c41 	sub	w1, w2, w3, asr #7
 *[0-9a-f]+:	4b833c41 	sub	w1, w2, w3, asr #15
 *[0-9a-f]+:	4b837c41 	sub	w1, w2, w3, asr #31
 *[0-9a-f]+:	4b230041 	sub	w1, w2, w3, uxtb
 *[0-9a-f]+:	4b230441 	sub	w1, w2, w3, uxtb #1
 *[0-9a-f]+:	4b230841 	sub	w1, w2, w3, uxtb #2
 *[0-9a-f]+:	4b230c41 	sub	w1, w2, w3, uxtb #3
 *[0-9a-f]+:	4b231041 	sub	w1, w2, w3, uxtb #4
 *[0-9a-f]+:	4b232041 	sub	w1, w2, w3, uxth
 *[0-9a-f]+:	4b232441 	sub	w1, w2, w3, uxth #1
 *[0-9a-f]+:	4b232841 	sub	w1, w2, w3, uxth #2
 *[0-9a-f]+:	4b232c41 	sub	w1, w2, w3, uxth #3
 *[0-9a-f]+:	4b233041 	sub	w1, w2, w3, uxth #4
 *[0-9a-f]+:	4b238041 	sub	w1, w2, w3, sxtb
 *[0-9a-f]+:	4b238441 	sub	w1, w2, w3, sxtb #1
 *[0-9a-f]+:	4b238841 	sub	w1, w2, w3, sxtb #2
 *[0-9a-f]+:	4b238c41 	sub	w1, w2, w3, sxtb #3
 *[0-9a-f]+:	4b239041 	sub	w1, w2, w3, sxtb #4
 *[0-9a-f]+:	4b23a041 	sub	w1, w2, w3, sxth
 *[0-9a-f]+:	4b23a441 	sub	w1, w2, w3, sxth #1
 *[0-9a-f]+:	4b23a841 	sub	w1, w2, w3, sxth #2
 *[0-9a-f]+:	4b23ac41 	sub	w1, w2, w3, sxth #3
 *[0-9a-f]+:	4b23b041 	sub	w1, w2, w3, sxth #4
 *[0-9a-f]+:	cb0303e2 	neg	x2, x3
 *[0-9a-f]+:	cb0307e2 	neg	x2, x3, lsl #1
 *[0-9a-f]+:	cb030fe2 	neg	x2, x3, lsl #3
 *[0-9a-f]+:	cb031fe2 	neg	x2, x3, lsl #7
 *[0-9a-f]+:	cb033fe2 	neg	x2, x3, lsl #15
 *[0-9a-f]+:	cb037fe2 	neg	x2, x3, lsl #31
 *[0-9a-f]+:	cb03ffe2 	neg	x2, x3, lsl #63
 *[0-9a-f]+:	cb4303e2 	neg	x2, x3, lsr #0
 *[0-9a-f]+:	cb4307e2 	neg	x2, x3, lsr #1
 *[0-9a-f]+:	cb430fe2 	neg	x2, x3, lsr #3
 *[0-9a-f]+:	cb431fe2 	neg	x2, x3, lsr #7
 *[0-9a-f]+:	cb433fe2 	neg	x2, x3, lsr #15
 *[0-9a-f]+:	cb437fe2 	neg	x2, x3, lsr #31
 *[0-9a-f]+:	cb43ffe2 	neg	x2, x3, lsr #63
 *[0-9a-f]+:	cb8303e2 	neg	x2, x3, asr #0
 *[0-9a-f]+:	cb8307e2 	neg	x2, x3, asr #1
 *[0-9a-f]+:	cb830fe2 	neg	x2, x3, asr #3
 *[0-9a-f]+:	cb831fe2 	neg	x2, x3, asr #7
 *[0-9a-f]+:	cb833fe2 	neg	x2, x3, asr #15
 *[0-9a-f]+:	cb837fe2 	neg	x2, x3, asr #31
 *[0-9a-f]+:	cb83ffe2 	neg	x2, x3, asr #63
 *[0-9a-f]+:	4b0303e2 	neg	w2, w3
 *[0-9a-f]+:	4b0307e2 	neg	w2, w3, lsl #1
 *[0-9a-f]+:	4b030fe2 	neg	w2, w3, lsl #3
 *[0-9a-f]+:	4b031fe2 	neg	w2, w3, lsl #7
 *[0-9a-f]+:	4b033fe2 	neg	w2, w3, lsl #15
 *[0-9a-f]+:	4b037fe2 	neg	w2, w3, lsl #31
 *[0-9a-f]+:	4b4303e2 	neg	w2, w3, lsr #0
 *[0-9a-f]+:	4b4307e2 	neg	w2, w3, lsr #1
 *[0-9a-f]+:	4b430fe2 	neg	w2, w3, lsr #3
 *[0-9a-f]+:	4b431fe2 	neg	w2, w3, lsr #7
 *[0-9a-f]+:	4b433fe2 	neg	w2, w3, lsr #15
 *[0-9a-f]+:	4b437fe2 	neg	w2, w3, lsr #31
 *[0-9a-f]+:	4b8303e2 	neg	w2, w3, asr #0
 *[0-9a-f]+:	4b8307e2 	neg	w2, w3, asr #1
 *[0-9a-f]+:	4b830fe2 	neg	w2, w3, asr #3
 *[0-9a-f]+:	4b831fe2 	neg	w2, w3, asr #7
 *[0-9a-f]+:	4b833fe2 	neg	w2, w3, asr #15
 *[0-9a-f]+:	4b837fe2 	neg	w2, w3, asr #31
 *[0-9a-f]+:	eb03005f 	cmp	x2, x3
 *[0-9a-f]+:	eb03045f 	cmp	x2, x3, lsl #1
 *[0-9a-f]+:	eb030c5f 	cmp	x2, x3, lsl #3
 *[0-9a-f]+:	eb031c5f 	cmp	x2, x3, lsl #7
 *[0-9a-f]+:	eb033c5f 	cmp	x2, x3, lsl #15
 *[0-9a-f]+:	eb037c5f 	cmp	x2, x3, lsl #31
 *[0-9a-f]+:	eb03fc5f 	cmp	x2, x3, lsl #63
 *[0-9a-f]+:	eb43005f 	cmp	x2, x3, lsr #0
 *[0-9a-f]+:	eb43045f 	cmp	x2, x3, lsr #1
 *[0-9a-f]+:	eb430c5f 	cmp	x2, x3, lsr #3
 *[0-9a-f]+:	eb431c5f 	cmp	x2, x3, lsr #7
 *[0-9a-f]+:	eb433c5f 	cmp	x2, x3, lsr #15
 *[0-9a-f]+:	eb437c5f 	cmp	x2, x3, lsr #31
 *[0-9a-f]+:	eb43fc5f 	cmp	x2, x3, lsr #63
 *[0-9a-f]+:	eb83005f 	cmp	x2, x3, asr #0
 *[0-9a-f]+:	eb83045f 	cmp	x2, x3, asr #1
 *[0-9a-f]+:	eb830c5f 	cmp	x2, x3, asr #3
 *[0-9a-f]+:	eb831c5f 	cmp	x2, x3, asr #7
 *[0-9a-f]+:	eb833c5f 	cmp	x2, x3, asr #15
 *[0-9a-f]+:	eb837c5f 	cmp	x2, x3, asr #31
 *[0-9a-f]+:	eb83fc5f 	cmp	x2, x3, asr #63
 *[0-9a-f]+:	eb23005f 	cmp	x2, w3, uxtb
 *[0-9a-f]+:	eb23045f 	cmp	x2, w3, uxtb #1
 *[0-9a-f]+:	eb23085f 	cmp	x2, w3, uxtb #2
 *[0-9a-f]+:	eb230c5f 	cmp	x2, w3, uxtb #3
 *[0-9a-f]+:	eb23105f 	cmp	x2, w3, uxtb #4
 *[0-9a-f]+:	eb23205f 	cmp	x2, w3, uxth
 *[0-9a-f]+:	eb23245f 	cmp	x2, w3, uxth #1
 *[0-9a-f]+:	eb23285f 	cmp	x2, w3, uxth #2
 *[0-9a-f]+:	eb232c5f 	cmp	x2, w3, uxth #3
 *[0-9a-f]+:	eb23305f 	cmp	x2, w3, uxth #4
 *[0-9a-f]+:	eb23405f 	cmp	x2, w3, uxtw
 *[0-9a-f]+:	eb23445f 	cmp	x2, w3, uxtw #1
 *[0-9a-f]+:	eb23485f 	cmp	x2, w3, uxtw #2
 *[0-9a-f]+:	eb234c5f 	cmp	x2, w3, uxtw #3
 *[0-9a-f]+:	eb23505f 	cmp	x2, w3, uxtw #4
 *[0-9a-f]+:	eb23805f 	cmp	x2, w3, sxtb
 *[0-9a-f]+:	eb23845f 	cmp	x2, w3, sxtb #1
 *[0-9a-f]+:	eb23885f 	cmp	x2, w3, sxtb #2
 *[0-9a-f]+:	eb238c5f 	cmp	x2, w3, sxtb #3
 *[0-9a-f]+:	eb23905f 	cmp	x2, w3, sxtb #4
 *[0-9a-f]+:	eb23a05f 	cmp	x2, w3, sxth
 *[0-9a-f]+:	eb23a45f 	cmp	x2, w3, sxth #1
 *[0-9a-f]+:	eb23a85f 	cmp	x2, w3, sxth #2
 *[0-9a-f]+:	eb23ac5f 	cmp	x2, w3, sxth #3
 *[0-9a-f]+:	eb23b05f 	cmp	x2, w3, sxth #4
 *[0-9a-f]+:	eb23c05f 	cmp	x2, w3, sxtw
 *[0-9a-f]+:	eb23c45f 	cmp	x2, w3, sxtw #1
 *[0-9a-f]+:	eb23c85f 	cmp	x2, w3, sxtw #2
 *[0-9a-f]+:	eb23cc5f 	cmp	x2, w3, sxtw #3
 *[0-9a-f]+:	eb23d05f 	cmp	x2, w3, sxtw #4
 *[0-9a-f]+:	6b03005f 	cmp	w2, w3
 *[0-9a-f]+:	6b03045f 	cmp	w2, w3, lsl #1
 *[0-9a-f]+:	6b030c5f 	cmp	w2, w3, lsl #3
 *[0-9a-f]+:	6b031c5f 	cmp	w2, w3, lsl #7
 *[0-9a-f]+:	6b033c5f 	cmp	w2, w3, lsl #15
 *[0-9a-f]+:	6b037c5f 	cmp	w2, w3, lsl #31
 *[0-9a-f]+:	6b43005f 	cmp	w2, w3, lsr #0
 *[0-9a-f]+:	6b43045f 	cmp	w2, w3, lsr #1
 *[0-9a-f]+:	6b430c5f 	cmp	w2, w3, lsr #3
 *[0-9a-f]+:	6b431c5f 	cmp	w2, w3, lsr #7
 *[0-9a-f]+:	6b433c5f 	cmp	w2, w3, lsr #15
 *[0-9a-f]+:	6b437c5f 	cmp	w2, w3, lsr #31
 *[0-9a-f]+:	6b83005f 	cmp	w2, w3, asr #0
 *[0-9a-f]+:	6b83045f 	cmp	w2, w3, asr #1
 *[0-9a-f]+:	6b830c5f 	cmp	w2, w3, asr #3
 *[0-9a-f]+:	6b831c5f 	cmp	w2, w3, asr #7
 *[0-9a-f]+:	6b833c5f 	cmp	w2, w3, asr #15
 *[0-9a-f]+:	6b837c5f 	cmp	w2, w3, asr #31
 *[0-9a-f]+:	6b23005f 	cmp	w2, w3, uxtb
 *[0-9a-f]+:	6b23045f 	cmp	w2, w3, uxtb #1
 *[0-9a-f]+:	6b23085f 	cmp	w2, w3, uxtb #2
 *[0-9a-f]+:	6b230c5f 	cmp	w2, w3, uxtb #3
 *[0-9a-f]+:	6b23105f 	cmp	w2, w3, uxtb #4
 *[0-9a-f]+:	6b23205f 	cmp	w2, w3, uxth
 *[0-9a-f]+:	6b23245f 	cmp	w2, w3, uxth #1
 *[0-9a-f]+:	6b23285f 	cmp	w2, w3, uxth #2
 *[0-9a-f]+:	6b232c5f 	cmp	w2, w3, uxth #3
 *[0-9a-f]+:	6b23305f 	cmp	w2, w3, uxth #4
 *[0-9a-f]+:	6b23805f 	cmp	w2, w3, sxtb
 *[0-9a-f]+:	6b23845f 	cmp	w2, w3, sxtb #1
 *[0-9a-f]+:	6b23885f 	cmp	w2, w3, sxtb #2
 *[0-9a-f]+:	6b238c5f 	cmp	w2, w3, sxtb #3
 *[0-9a-f]+:	6b23905f 	cmp	w2, w3, sxtb #4
 *[0-9a-f]+:	6b23a05f 	cmp	w2, w3, sxth
 *[0-9a-f]+:	6b23a45f 	cmp	w2, w3, sxth #1
 *[0-9a-f]+:	6b23a85f 	cmp	w2, w3, sxth #2
 *[0-9a-f]+:	6b23ac5f 	cmp	w2, w3, sxth #3
 *[0-9a-f]+:	6b23b05f 	cmp	w2, w3, sxth #4
 *[0-9a-f]+:	ab03005f 	cmn	x2, x3
 *[0-9a-f]+:	ab03045f 	cmn	x2, x3, lsl #1
 *[0-9a-f]+:	ab030c5f 	cmn	x2, x3, lsl #3
 *[0-9a-f]+:	ab031c5f 	cmn	x2, x3, lsl #7
 *[0-9a-f]+:	ab033c5f 	cmn	x2, x3, lsl #15
 *[0-9a-f]+:	ab037c5f 	cmn	x2, x3, lsl #31
 *[0-9a-f]+:	ab03fc5f 	cmn	x2, x3, lsl #63
 *[0-9a-f]+:	ab43005f 	cmn	x2, x3, lsr #0
 *[0-9a-f]+:	ab43045f 	cmn	x2, x3, lsr #1
 *[0-9a-f]+:	ab430c5f 	cmn	x2, x3, lsr #3
 *[0-9a-f]+:	ab431c5f 	cmn	x2, x3, lsr #7
 *[0-9a-f]+:	ab433c5f 	cmn	x2, x3, lsr #15
 *[0-9a-f]+:	ab437c5f 	cmn	x2, x3, lsr #31
 *[0-9a-f]+:	ab43fc5f 	cmn	x2, x3, lsr #63
 *[0-9a-f]+:	ab83005f 	cmn	x2, x3, asr #0
 *[0-9a-f]+:	ab83045f 	cmn	x2, x3, asr #1
 *[0-9a-f]+:	ab830c5f 	cmn	x2, x3, asr #3
 *[0-9a-f]+:	ab831c5f 	cmn	x2, x3, asr #7
 *[0-9a-f]+:	ab833c5f 	cmn	x2, x3, asr #15
 *[0-9a-f]+:	ab837c5f 	cmn	x2, x3, asr #31
 *[0-9a-f]+:	ab83fc5f 	cmn	x2, x3, asr #63
 *[0-9a-f]+:	ab23005f 	cmn	x2, w3, uxtb
 *[0-9a-f]+:	ab23045f 	cmn	x2, w3, uxtb #1
 *[0-9a-f]+:	ab23085f 	cmn	x2, w3, uxtb #2
 *[0-9a-f]+:	ab230c5f 	cmn	x2, w3, uxtb #3
 *[0-9a-f]+:	ab23105f 	cmn	x2, w3, uxtb #4
 *[0-9a-f]+:	ab23205f 	cmn	x2, w3, uxth
 *[0-9a-f]+:	ab23245f 	cmn	x2, w3, uxth #1
 *[0-9a-f]+:	ab23285f 	cmn	x2, w3, uxth #2
 *[0-9a-f]+:	ab232c5f 	cmn	x2, w3, uxth #3
 *[0-9a-f]+:	ab23305f 	cmn	x2, w3, uxth #4
 *[0-9a-f]+:	ab23405f 	cmn	x2, w3, uxtw
 *[0-9a-f]+:	ab23445f 	cmn	x2, w3, uxtw #1
 *[0-9a-f]+:	ab23485f 	cmn	x2, w3, uxtw #2
 *[0-9a-f]+:	ab234c5f 	cmn	x2, w3, uxtw #3
 *[0-9a-f]+:	ab23505f 	cmn	x2, w3, uxtw #4
 *[0-9a-f]+:	ab23805f 	cmn	x2, w3, sxtb
 *[0-9a-f]+:	ab23845f 	cmn	x2, w3, sxtb #1
 *[0-9a-f]+:	ab23885f 	cmn	x2, w3, sxtb #2
 *[0-9a-f]+:	ab238c5f 	cmn	x2, w3, sxtb #3
 *[0-9a-f]+:	ab23905f 	cmn	x2, w3, sxtb #4
 *[0-9a-f]+:	ab23a05f 	cmn	x2, w3, sxth
 *[0-9a-f]+:	ab23a45f 	cmn	x2, w3, sxth #1
 *[0-9a-f]+:	ab23a85f 	cmn	x2, w3, sxth #2
 *[0-9a-f]+:	ab23ac5f 	cmn	x2, w3, sxth #3
 *[0-9a-f]+:	ab23b05f 	cmn	x2, w3, sxth #4
 *[0-9a-f]+:	ab23c05f 	cmn	x2, w3, sxtw
 *[0-9a-f]+:	ab23c45f 	cmn	x2, w3, sxtw #1
 *[0-9a-f]+:	ab23c85f 	cmn	x2, w3, sxtw #2
 *[0-9a-f]+:	ab23cc5f 	cmn	x2, w3, sxtw #3
 *[0-9a-f]+:	ab23d05f 	cmn	x2, w3, sxtw #4
 *[0-9a-f]+:	2b03005f 	cmn	w2, w3
 *[0-9a-f]+:	2b03045f 	cmn	w2, w3, lsl #1
 *[0-9a-f]+:	2b030c5f 	cmn	w2, w3, lsl #3
 *[0-9a-f]+:	2b031c5f 	cmn	w2, w3, lsl #7
 *[0-9a-f]+:	2b033c5f 	cmn	w2, w3, lsl #15
 *[0-9a-f]+:	2b037c5f 	cmn	w2, w3, lsl #31
 *[0-9a-f]+:	2b43005f 	cmn	w2, w3, lsr #0
 *[0-9a-f]+:	2b43045f 	cmn	w2, w3, lsr #1
 *[0-9a-f]+:	2b430c5f 	cmn	w2, w3, lsr #3
 *[0-9a-f]+:	2b431c5f 	cmn	w2, w3, lsr #7
 *[0-9a-f]+:	2b433c5f 	cmn	w2, w3, lsr #15
 *[0-9a-f]+:	2b437c5f 	cmn	w2, w3, lsr #31
 *[0-9a-f]+:	2b83005f 	cmn	w2, w3, asr #0
 *[0-9a-f]+:	2b83045f 	cmn	w2, w3, asr #1
 *[0-9a-f]+:	2b830c5f 	cmn	w2, w3, asr #3
 *[0-9a-f]+:	2b831c5f 	cmn	w2, w3, asr #7
 *[0-9a-f]+:	2b833c5f 	cmn	w2, w3, asr #15
 *[0-9a-f]+:	2b837c5f 	cmn	w2, w3, asr #31
 *[0-9a-f]+:	2b23005f 	cmn	w2, w3, uxtb
 *[0-9a-f]+:	2b23045f 	cmn	w2, w3, uxtb #1
 *[0-9a-f]+:	2b23085f 	cmn	w2, w3, uxtb #2
 *[0-9a-f]+:	2b230c5f 	cmn	w2, w3, uxtb #3
 *[0-9a-f]+:	2b23105f 	cmn	w2, w3, uxtb #4
 *[0-9a-f]+:	2b23205f 	cmn	w2, w3, uxth
 *[0-9a-f]+:	2b23245f 	cmn	w2, w3, uxth #1
 *[0-9a-f]+:	2b23285f 	cmn	w2, w3, uxth #2
 *[0-9a-f]+:	2b232c5f 	cmn	w2, w3, uxth #3
 *[0-9a-f]+:	2b23305f 	cmn	w2, w3, uxth #4
 *[0-9a-f]+:	2b23805f 	cmn	w2, w3, sxtb
 *[0-9a-f]+:	2b23845f 	cmn	w2, w3, sxtb #1
 *[0-9a-f]+:	2b23885f 	cmn	w2, w3, sxtb #2
 *[0-9a-f]+:	2b238c5f 	cmn	w2, w3, sxtb #3
 *[0-9a-f]+:	2b23905f 	cmn	w2, w3, sxtb #4
 *[0-9a-f]+:	2b23a05f 	cmn	w2, w3, sxth
 *[0-9a-f]+:	2b23a45f 	cmn	w2, w3, sxth #1
 *[0-9a-f]+:	2b23a85f 	cmn	w2, w3, sxth #2
 *[0-9a-f]+:	2b23ac5f 	cmn	w2, w3, sxth #3
 *[0-9a-f]+:	2b23b05f 	cmn	w2, w3, sxth #4
