sttxr:
	sttxr	w0, w1, [x0]
	sttxr	w0, w0, [x1]
	sttxr	w0, x1, [x0]
	sttxr	w0, x0, [x1]

stltxr:
	stltxr	w0, w1, [x0]
	stltxr	w0, w0, [x1]
	stltxr	w0, x1, [x0]
	stltxr	w0, x0, [x1]

caspt:
	caspt	x0, x0, x2, x3, [x0]
	caspt	x0, x1, x3, x4, [x0]
	caspt	x0, x1, x2, x3, [x0, #0x8]

ldtnp:
	ldtnp	x0, x0, [x0]
	ldtnp	q0, q1, [x0]
	ldtnp	x0, x1, [x0, #508]
	ldtnp	x0, x1, [x0, #504]!

ldtp:
	ldtp	x0, x0, [x1]
	ldtp	x0, x1, [x0, #504]!
	ldtp	x0, x1, [x0], #504
	ldtp	q0, q0, [x1]

sttp:
	sttp	x0, x1, [x0, #504]!
	sttp	x0, x1, [x0], #504
