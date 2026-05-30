	sshr	d0, d0, #64
	sshr	d31, d0, #64
	sshr	d0, d31, #64
	sshr	d0, d0, #1

	ssra	d0, d0, #64
	ssra	d31, d0, #64
	ssra	d0, d31, #64
	ssra	d0, d0, #1

	srshr	d0, d0, #64
	srshr	d31, d0, #64
	srshr	d0, d31, #64
	srshr	d0, d0, #1

	srsra	d0, d0, #64
	srsra	d31, d0, #64
	srsra	d0, d31, #64
	srsra	d0, d0, #1

	shl	d0, d0, #0
	shl	d31, d0, #0
	shl	d0, d31, #0
	shl	d0, d0, #63

	sqshl	b0, b0, #0
	sqshl	b31, b0, #0
	sqshl	b0, b31, #0
	sqshl	b0, b0, #7
	sqshl	h0, h0, #0
	sqshl	h31, h0, #0
	sqshl	h0, h31, #0
	sqshl	h0, h0, #15
	sqshl	s0, s0, #0
	sqshl	s31, s0, #0
	sqshl	s0, s31, #0
	sqshl	s0, s0, #31
	sqshl	d0, d0, #0
	sqshl	d31, d0, #0
	sqshl	d0, d31, #0
	sqshl	d0, d0, #63

	sqshrn	b0, h0, #8
	sqshrn	b31, h0, #8
	sqshrn	b0, h31, #8
	sqshrn	b0, h0, #1
	sqshrn	h0, s0, #16
	sqshrn	h31, s0, #16
	sqshrn	h0, s31, #16
	sqshrn	h0, s0, #1
	sqshrn	s0, d0, #32
	sqshrn	s31, d0, #32
	sqshrn	s0, d31, #32
	sqshrn	s0, d0, #1

	sqrshrn	b0, h0, #8
	sqrshrn	b31, h0, #8
	sqrshrn	b0, h31, #8
	sqrshrn	b0, h0, #1
	sqrshrn	h0, s0, #16
	sqrshrn	h31, s0, #16
	sqrshrn	h0, s31, #16
	sqrshrn	h0, s0, #1
	sqrshrn	s0, d0, #32
	sqrshrn	s31, d0, #32
	sqrshrn	s0, d31, #32
	sqrshrn	s0, d0, #1

	ushr	d0, d0, #64
	ushr	d31, d0, #64
	ushr	d0, d31, #64
	ushr	d0, d0, #1

	usra	d0, d0, #64
	usra	d31, d0, #64
	usra	d0, d31, #64
	usra	d0, d0, #1

	urshr	d0, d0, #64
	urshr	d31, d0, #64
	urshr	d0, d31, #64
	urshr	d0, d0, #1

	ursra	d0, d0, #64
	ursra	d31, d0, #64
	ursra	d0, d31, #64
	ursra	d0, d0, #1

	sri	d0, d0, #64
	sri	d31, d0, #64
	sri	d0, d31, #64
	sri	d0, d0, #1

	sli	d0, d0, #0
	sli	d31, d0, #0
	sli	d0, d31, #0
	sli	d0, d0, #63

	sqshlu	b0, b0, #0
	sqshlu	b31, b0, #0
	sqshlu	b0, b31, #0
	sqshlu	b0, b0, #7
	sqshlu	h0, h0, #0
	sqshlu	h31, h0, #0
	sqshlu	h0, h31, #0
	sqshlu	h0, h0, #15
	sqshlu	s0, s0, #0
	sqshlu	s31, s0, #0
	sqshlu	s0, s31, #0
	sqshlu	s0, s0, #31
	sqshlu	d0, d0, #0
	sqshlu	d31, d0, #0
	sqshlu	d0, d31, #0
	sqshlu	d0, d0, #63

	uqshl	b0, b0, #0
	uqshl	b31, b0, #0
	uqshl	b0, b31, #0
	uqshl	b0, b0, #7
	uqshl	h0, h0, #0
	uqshl	h31, h0, #0
	uqshl	h0, h31, #0
	uqshl	h0, h0, #15
	uqshl	s0, s0, #0
	uqshl	s31, s0, #0
	uqshl	s0, s31, #0
	uqshl	s0, s0, #31
	uqshl	d0, d0, #0
	uqshl	d31, d0, #0
	uqshl	d0, d31, #0
	uqshl	d0, d0, #63

	sqshrun	b0, h0, #8
	sqshrun	b31, h0, #8
	sqshrun	b0, h31, #8
	sqshrun	b0, h0, #1
	sqshrun	h0, s0, #16
	sqshrun	h31, s0, #16
	sqshrun	h0, s31, #16
	sqshrun	h0, s0, #1
	sqshrun	s0, d0, #32
	sqshrun	s31, d0, #32
	sqshrun	s0, d31, #32
	sqshrun	s0, d0, #1

	sqrshrun	b0, h0, #8
	sqrshrun	b31, h0, #8
	sqrshrun	b0, h31, #8
	sqrshrun	b0, h0, #1
	sqrshrun	h0, s0, #16
	sqrshrun	h31, s0, #16
	sqrshrun	h0, s31, #16
	sqrshrun	h0, s0, #1
	sqrshrun	s0, d0, #32
	sqrshrun	s31, d0, #32
	sqrshrun	s0, d31, #32
	sqrshrun	s0, d0, #1

	uqshrn	b0, h0, #8
	uqshrn	b31, h0, #8
	uqshrn	b0, h31, #8
	uqshrn	b0, h0, #1
	uqshrn	h0, s0, #16
	uqshrn	h31, s0, #16
	uqshrn	h0, s31, #16
	uqshrn	h0, s0, #1
	uqshrn	s0, d0, #32
	uqshrn	s31, d0, #32
	uqshrn	s0, d31, #32
	uqshrn	s0, d0, #1

	uqrshrn	b0, h0, #8
	uqrshrn	b31, h0, #8
	uqrshrn	b0, h31, #8
	uqrshrn	b0, h0, #1
	uqrshrn	h0, s0, #16
	uqrshrn	h31, s0, #16
	uqrshrn	h0, s31, #16
	uqrshrn	h0, s0, #1
	uqrshrn	s0, d0, #32
	uqrshrn	s31, d0, #32
	uqrshrn	s0, d31, #32
	uqrshrn	s0, d0, #1
