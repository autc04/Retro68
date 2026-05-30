	adc	w0, w0, w0
	adc	wzr, w0, w0
	adc	w0, wzr, w0
	adc	w0, w0, wzr
	adc	x0, x0, x0
	adc	xzr, x0, x0
	adc	x0, xzr, x0
	adc	x0, x0, xzr

	adcs	w0, w0, w0
	adcs	wzr, w0, w0
	adcs	w0, wzr, w0
	adcs	w0, w0, wzr
	adcs	x0, x0, x0
	adcs	xzr, x0, x0
	adcs	x0, xzr, x0
	adcs	x0, x0, xzr

	sbc	w0, w0, w0
	sbc	wzr, w0, w0
	sbc	w0, wzr, w0
	sbc	w0, w0, wzr
	sbc	x0, x0, x0
	sbc	xzr, x0, x0
	sbc	x0, xzr, x0
	sbc	x0, x0, xzr

	sbcs	w0, w0, w0
	sbcs	wzr, w0, w0
	sbcs	w0, wzr, w0
	sbcs	w0, w0, wzr
	sbcs	x0, x0, x0
	sbcs	xzr, x0, x0
	sbcs	x0, xzr, x0
	sbcs	x0, x0, xzr

	ngc	w0, w0
	ngc	wzr, w0
	ngc	w0, wzr
	ngc	x0, x0
	ngc	xzr, x0
	ngc	x0, xzr

	ngcs	w0, w0
	ngcs	wzr, w0
	ngcs	w0, wzr
	ngcs	x0, x0
	ngcs	xzr, x0
	ngcs	x0, xzr
