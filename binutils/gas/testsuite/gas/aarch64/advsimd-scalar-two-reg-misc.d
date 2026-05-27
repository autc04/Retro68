#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	5e203800 	suqadd	b0, b0
 *[0-9a-f]+:	5e20381f 	suqadd	b31, b0
 *[0-9a-f]+:	5e203be0 	suqadd	b0, b31
 *[0-9a-f]+:	5e603800 	suqadd	h0, h0
 *[0-9a-f]+:	5e60381f 	suqadd	h31, h0
 *[0-9a-f]+:	5e603be0 	suqadd	h0, h31
 *[0-9a-f]+:	5ea03800 	suqadd	s0, s0
 *[0-9a-f]+:	5ea0381f 	suqadd	s31, s0
 *[0-9a-f]+:	5ea03be0 	suqadd	s0, s31
 *[0-9a-f]+:	5ee03800 	suqadd	d0, d0
 *[0-9a-f]+:	5ee0381f 	suqadd	d31, d0
 *[0-9a-f]+:	5ee03be0 	suqadd	d0, d31
 *[0-9a-f]+:	5e207800 	sqabs	b0, b0
 *[0-9a-f]+:	5e20781f 	sqabs	b31, b0
 *[0-9a-f]+:	5e207be0 	sqabs	b0, b31
 *[0-9a-f]+:	5e607800 	sqabs	h0, h0
 *[0-9a-f]+:	5e60781f 	sqabs	h31, h0
 *[0-9a-f]+:	5e607be0 	sqabs	h0, h31
 *[0-9a-f]+:	5ea07800 	sqabs	s0, s0
 *[0-9a-f]+:	5ea0781f 	sqabs	s31, s0
 *[0-9a-f]+:	5ea07be0 	sqabs	s0, s31
 *[0-9a-f]+:	5ee07800 	sqabs	d0, d0
 *[0-9a-f]+:	5ee0781f 	sqabs	d31, d0
 *[0-9a-f]+:	5ee07be0 	sqabs	d0, d31
 *[0-9a-f]+:	5ee08800 	cmgt	d0, d0, #0
 *[0-9a-f]+:	5ee0881f 	cmgt	d31, d0, #0
 *[0-9a-f]+:	5ee08be0 	cmgt	d0, d31, #0
 *[0-9a-f]+:	5ee09800 	cmeq	d0, d0, #0
 *[0-9a-f]+:	5ee0981f 	cmeq	d31, d0, #0
 *[0-9a-f]+:	5ee09be0 	cmeq	d0, d31, #0
 *[0-9a-f]+:	5ee0a800 	cmlt	d0, d0, #0
 *[0-9a-f]+:	5ee0a81f 	cmlt	d31, d0, #0
 *[0-9a-f]+:	5ee0abe0 	cmlt	d0, d31, #0
 *[0-9a-f]+:	5ee0b800 	abs	d0, d0
 *[0-9a-f]+:	5ee0b81f 	abs	d31, d0
 *[0-9a-f]+:	5ee0bbe0 	abs	d0, d31
 *[0-9a-f]+:	5e214800 	sqxtn	b0, h0
 *[0-9a-f]+:	5e21481f 	sqxtn	b31, h0
 *[0-9a-f]+:	5e214be0 	sqxtn	b0, h31
 *[0-9a-f]+:	5e614800 	sqxtn	h0, s0
 *[0-9a-f]+:	5e61481f 	sqxtn	h31, s0
 *[0-9a-f]+:	5e614be0 	sqxtn	h0, s31
 *[0-9a-f]+:	5ea14800 	sqxtn	s0, d0
 *[0-9a-f]+:	5ea1481f 	sqxtn	s31, d0
 *[0-9a-f]+:	5ea14be0 	sqxtn	s0, d31
 *[0-9a-f]+:	7e203800 	usqadd	b0, b0
 *[0-9a-f]+:	7e20381f 	usqadd	b31, b0
 *[0-9a-f]+:	7e203be0 	usqadd	b0, b31
 *[0-9a-f]+:	7e603800 	usqadd	h0, h0
 *[0-9a-f]+:	7e60381f 	usqadd	h31, h0
 *[0-9a-f]+:	7e603be0 	usqadd	h0, h31
 *[0-9a-f]+:	7ea03800 	usqadd	s0, s0
 *[0-9a-f]+:	7ea0381f 	usqadd	s31, s0
 *[0-9a-f]+:	7ea03be0 	usqadd	s0, s31
 *[0-9a-f]+:	7ee03800 	usqadd	d0, d0
 *[0-9a-f]+:	7ee0381f 	usqadd	d31, d0
 *[0-9a-f]+:	7ee03be0 	usqadd	d0, d31
 *[0-9a-f]+:	7e207800 	sqneg	b0, b0
 *[0-9a-f]+:	7e20781f 	sqneg	b31, b0
 *[0-9a-f]+:	7e207be0 	sqneg	b0, b31
 *[0-9a-f]+:	7e607800 	sqneg	h0, h0
 *[0-9a-f]+:	7e60781f 	sqneg	h31, h0
 *[0-9a-f]+:	7e607be0 	sqneg	h0, h31
 *[0-9a-f]+:	7ea07800 	sqneg	s0, s0
 *[0-9a-f]+:	7ea0781f 	sqneg	s31, s0
 *[0-9a-f]+:	7ea07be0 	sqneg	s0, s31
 *[0-9a-f]+:	7ee07800 	sqneg	d0, d0
 *[0-9a-f]+:	7ee0781f 	sqneg	d31, d0
 *[0-9a-f]+:	7ee07be0 	sqneg	d0, d31
 *[0-9a-f]+:	7ee08800 	cmge	d0, d0, #0
 *[0-9a-f]+:	7ee0881f 	cmge	d31, d0, #0
 *[0-9a-f]+:	7ee08be0 	cmge	d0, d31, #0
 *[0-9a-f]+:	7ee09800 	cmle	d0, d0, #0
 *[0-9a-f]+:	7ee0981f 	cmle	d31, d0, #0
 *[0-9a-f]+:	7ee09be0 	cmle	d0, d31, #0
 *[0-9a-f]+:	7ee0b800 	neg	d0, d0
 *[0-9a-f]+:	7ee0b81f 	neg	d31, d0
 *[0-9a-f]+:	7ee0bbe0 	neg	d0, d31
 *[0-9a-f]+:	7e212800 	sqxtun	b0, h0
 *[0-9a-f]+:	7e21281f 	sqxtun	b31, h0
 *[0-9a-f]+:	7e212be0 	sqxtun	b0, h31
 *[0-9a-f]+:	7e612800 	sqxtun	h0, s0
 *[0-9a-f]+:	7e61281f 	sqxtun	h31, s0
 *[0-9a-f]+:	7e612be0 	sqxtun	h0, s31
 *[0-9a-f]+:	7ea12800 	sqxtun	s0, d0
 *[0-9a-f]+:	7ea1281f 	sqxtun	s31, d0
 *[0-9a-f]+:	7ea12be0 	sqxtun	s0, d31
 *[0-9a-f]+:	7e214800 	uqxtn	b0, h0
 *[0-9a-f]+:	7e21481f 	uqxtn	b31, h0
 *[0-9a-f]+:	7e214be0 	uqxtn	b0, h31
 *[0-9a-f]+:	7e614800 	uqxtn	h0, s0
 *[0-9a-f]+:	7e61481f 	uqxtn	h31, s0
 *[0-9a-f]+:	7e614be0 	uqxtn	h0, s31
 *[0-9a-f]+:	7ea14800 	uqxtn	s0, d0
 *[0-9a-f]+:	7ea1481f 	uqxtn	s31, d0
 *[0-9a-f]+:	7ea14be0 	uqxtn	s0, d31
 *[0-9a-f]+:	7e616800 	fcvtxn	s0, d0
 *[0-9a-f]+:	7e61681f 	fcvtxn	s31, d0
 *[0-9a-f]+:	7e616be0 	fcvtxn	s0, d31
