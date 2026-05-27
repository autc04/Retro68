	sqadd	b0, b0, b0
	sqadd	b31, b0, b0
	sqadd	b0, b31, b0
	sqadd	b0, b0, b31
	sqadd	h0, h0, h0
	sqadd	h31, h0, h0
	sqadd	h0, h31, h0
	sqadd	h0, h0, h31
	sqadd	s0, s0, s0
	sqadd	s31, s0, s0
	sqadd	s0, s31, s0
	sqadd	s0, s0, s31
	sqadd	d0, d0, d0
	sqadd	d31, d0, d0
	sqadd	d0, d31, d0
	sqadd	d0, d0, d31

	sqsub	b0, b0, b0
	sqsub	b31, b0, b0
	sqsub	b0, b31, b0
	sqsub	b0, b0, b31
	sqsub	h0, h0, h0
	sqsub	h31, h0, h0
	sqsub	h0, h31, h0
	sqsub	h0, h0, h31
	sqsub	s0, s0, s0
	sqsub	s31, s0, s0
	sqsub	s0, s31, s0
	sqsub	s0, s0, s31
	sqsub	d0, d0, d0
	sqsub	d31, d0, d0
	sqsub	d0, d31, d0
	sqsub	d0, d0, d31

	sqshl	b0, b0, b0
	sqshl	b31, b0, b0
	sqshl	b0, b31, b0
	sqshl	b0, b0, b31
	sqshl	h0, h0, h0
	sqshl	h31, h0, h0
	sqshl	h0, h31, h0
	sqshl	h0, h0, h31
	sqshl	s0, s0, s0
	sqshl	s31, s0, s0
	sqshl	s0, s31, s0
	sqshl	s0, s0, s31
	sqshl	d0, d0, d0
	sqshl	d31, d0, d0
	sqshl	d0, d31, d0
	sqshl	d0, d0, d31

	sqrshl	b0, b0, b0
	sqrshl	b31, b0, b0
	sqrshl	b0, b31, b0
	sqrshl	b0, b0, b31
	sqrshl	h0, h0, h0
	sqrshl	h31, h0, h0
	sqrshl	h0, h31, h0
	sqrshl	h0, h0, h31
	sqrshl	s0, s0, s0
	sqrshl	s31, s0, s0
	sqrshl	s0, s31, s0
	sqrshl	s0, s0, s31
	sqrshl	d0, d0, d0
	sqrshl	d31, d0, d0
	sqrshl	d0, d31, d0
	sqrshl	d0, d0, d31

	sqdmulh	h0, h0, h0
	sqdmulh	h31, h0, h0
	sqdmulh	h0, h31, h0
	sqdmulh	h0, h0, h31
	sqdmulh	s0, s0, s0
	sqdmulh	s31, s0, s0
	sqdmulh	s0, s31, s0
	sqdmulh	s0, s0, s31

	cmgt	d0, d0, d0
	cmgt	d31, d0, d0
	cmgt	d0, d31, d0
	cmgt	d0, d0, d31

	cmge	d0, d0, d0
	cmge	d31, d0, d0
	cmge	d0, d31, d0
	cmge	d0, d0, d31

	sshl	d0, d0, d0
	sshl	d31, d0, d0
	sshl	d0, d31, d0
	sshl	d0, d0, d31

	srshl	d0, d0, d0
	srshl	d31, d0, d0
	srshl	d0, d31, d0
	srshl	d0, d0, d31

	add	d0, d0, d0
	add	d31, d0, d0
	add	d0, d31, d0
	add	d0, d0, d31

	cmtst	d0, d0, d0
	cmtst	d31, d0, d0
	cmtst	d0, d31, d0
	cmtst	d0, d0, d31

	uqadd	b0, b0, b0
	uqadd	b31, b0, b0
	uqadd	b0, b31, b0
	uqadd	b0, b0, b31
	uqadd	h0, h0, h0
	uqadd	h31, h0, h0
	uqadd	h0, h31, h0
	uqadd	h0, h0, h31
	uqadd	s0, s0, s0
	uqadd	s31, s0, s0
	uqadd	s0, s31, s0
	uqadd	s0, s0, s31
	uqadd	d0, d0, d0
	uqadd	d31, d0, d0
	uqadd	d0, d31, d0
	uqadd	d0, d0, d31

	uqsub	b0, b0, b0
	uqsub	b31, b0, b0
	uqsub	b0, b31, b0
	uqsub	b0, b0, b31
	uqsub	h0, h0, h0
	uqsub	h31, h0, h0
	uqsub	h0, h31, h0
	uqsub	h0, h0, h31
	uqsub	s0, s0, s0
	uqsub	s31, s0, s0
	uqsub	s0, s31, s0
	uqsub	s0, s0, s31
	uqsub	d0, d0, d0
	uqsub	d31, d0, d0
	uqsub	d0, d31, d0
	uqsub	d0, d0, d31

	uqshl	b0, b0, b0
	uqshl	b31, b0, b0
	uqshl	b0, b31, b0
	uqshl	b0, b0, b31
	uqshl	h0, h0, h0
	uqshl	h31, h0, h0
	uqshl	h0, h31, h0
	uqshl	h0, h0, h31
	uqshl	s0, s0, s0
	uqshl	s31, s0, s0
	uqshl	s0, s31, s0
	uqshl	s0, s0, s31
	uqshl	d0, d0, d0
	uqshl	d31, d0, d0
	uqshl	d0, d31, d0
	uqshl	d0, d0, d31

	uqrshl	b0, b0, b0
	uqrshl	b31, b0, b0
	uqrshl	b0, b31, b0
	uqrshl	b0, b0, b31
	uqrshl	h0, h0, h0
	uqrshl	h31, h0, h0
	uqrshl	h0, h31, h0
	uqrshl	h0, h0, h31
	uqrshl	s0, s0, s0
	uqrshl	s31, s0, s0
	uqrshl	s0, s31, s0
	uqrshl	s0, s0, s31
	uqrshl	d0, d0, d0
	uqrshl	d31, d0, d0
	uqrshl	d0, d31, d0
	uqrshl	d0, d0, d31

	sqrdmulh	h0, h0, h0
	sqrdmulh	h31, h0, h0
	sqrdmulh	h0, h31, h0
	sqrdmulh	h0, h0, h31
	sqrdmulh	s0, s0, s0
	sqrdmulh	s31, s0, s0
	sqrdmulh	s0, s31, s0
	sqrdmulh	s0, s0, s31

	cmhi	d0, d0, d0
	cmhi	d31, d0, d0
	cmhi	d0, d31, d0
	cmhi	d0, d0, d31

	cmhs	d0, d0, d0
	cmhs	d31, d0, d0
	cmhs	d0, d31, d0
	cmhs	d0, d0, d31

	ushl	d0, d0, d0
	ushl	d31, d0, d0
	ushl	d0, d31, d0
	ushl	d0, d0, d31

	urshl	d0, d0, d0
	urshl	d31, d0, d0
	urshl	d0, d31, d0
	urshl	d0, d0, d31

	sub	d0, d0, d0
	sub	d31, d0, d0
	sub	d0, d31, d0
	sub	d0, d0, d31

	cmeq	d0, d0, d0
	cmeq	d31, d0, d0
	cmeq	d0, d31, d0
	cmeq	d0, d0, d31
