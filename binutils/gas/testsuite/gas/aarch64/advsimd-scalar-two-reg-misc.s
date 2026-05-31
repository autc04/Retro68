	suqadd	b0, b0
	suqadd	b31, b0
	suqadd	b0, b31
	suqadd	h0, h0
	suqadd	h31, h0
	suqadd	h0, h31
	suqadd	s0, s0
	suqadd	s31, s0
	suqadd	s0, s31
	suqadd	d0, d0
	suqadd	d31, d0
	suqadd	d0, d31

	sqabs	b0, b0
	sqabs	b31, b0
	sqabs	b0, b31
	sqabs	h0, h0
	sqabs	h31, h0
	sqabs	h0, h31
	sqabs	s0, s0
	sqabs	s31, s0
	sqabs	s0, s31
	sqabs	d0, d0
	sqabs	d31, d0
	sqabs	d0, d31

	cmgt	d0, d0, #0
	cmgt	d31, d0, #0
	cmgt	d0, d31, #0

	cmeq	d0, d0, #0
	cmeq	d31, d0, #0
	cmeq	d0, d31, #0

	cmlt	d0, d0, #0
	cmlt	d31, d0, #0
	cmlt	d0, d31, #0

	abs	d0, d0
	abs	d31, d0
	abs	d0, d31

	sqxtn	b0, h0
	sqxtn	b31, h0
	sqxtn	b0, h31
	sqxtn	h0, s0
	sqxtn	h31, s0
	sqxtn	h0, s31
	sqxtn	s0, d0
	sqxtn	s31, d0
	sqxtn	s0, d31

	usqadd	b0, b0
	usqadd	b31, b0
	usqadd	b0, b31
	usqadd	h0, h0
	usqadd	h31, h0
	usqadd	h0, h31
	usqadd	s0, s0
	usqadd	s31, s0
	usqadd	s0, s31
	usqadd	d0, d0
	usqadd	d31, d0
	usqadd	d0, d31

	sqneg	b0, b0
	sqneg	b31, b0
	sqneg	b0, b31
	sqneg	h0, h0
	sqneg	h31, h0
	sqneg	h0, h31
	sqneg	s0, s0
	sqneg	s31, s0
	sqneg	s0, s31
	sqneg	d0, d0
	sqneg	d31, d0
	sqneg	d0, d31

	cmge	d0, d0, #0
	cmge	d31, d0, #0
	cmge	d0, d31, #0

	cmle	d0, d0, #0
	cmle	d31, d0, #0
	cmle	d0, d31, #0

	neg	d0, d0
	neg	d31, d0
	neg	d0, d31

	sqxtun	b0, h0
	sqxtun	b31, h0
	sqxtun	b0, h31
	sqxtun	h0, s0
	sqxtun	h31, s0
	sqxtun	h0, s31
	sqxtun	s0, d0
	sqxtun	s31, d0
	sqxtun	s0, d31

	uqxtn	b0, h0
	uqxtn	b31, h0
	uqxtn	b0, h31
	uqxtn	h0, s0
	uqxtn	h31, s0
	uqxtn	h0, s31
	uqxtn	s0, d0
	uqxtn	s31, d0
	uqxtn	s0, d31

	fcvtxn	s0, d0
	fcvtxn	s31, d0
	fcvtxn	s0, d31
