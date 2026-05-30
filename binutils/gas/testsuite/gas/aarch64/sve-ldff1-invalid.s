// The fix for PR22988 accidentally allowed invalid addressing mode
//   ldff1b z1.d, p1/z, [z1.d]
// which was parsed equivalently to the valid instruction:
//   ldff1b z1.d, p1/z, [x1.d, xzr];
// and 
//   ldff1h{z1.s}, p1/z, [x1, x1]
// which was parsed as:
//   ldff1h{z1.s}, p1/z, [x1, x1, lsl #1]

	ldff1b {z1.b}, p1/z, [z1.d]
	ldff1b {z1.h}, p1/z, [z1.s]
	ldff1b {z1.s}, p1/z, [z1.d]
	ldff1b {z1.d}, p1/z, [z1.s]
	ldff1d {z1.d}, p1/z, [z1.s]
	ldff1h {z1.h}, p1/z, [z1.s]
	ldff1h {z1.s}, p1/z, [z1.d]
	ldff1h {z1.d}, p1/z, [z1.s]
	ldff1sb {z1.h}, p1/z, [z1.d]
	ldff1sb {z1.s}, p1/z, [z1.d]
	ldff1sb {z1.d}, p1/z, [z1.s]
	ldff1sh {z1.s}, p1/z, [z1.d]
	ldff1sh {z1.d}, p1/z, [z1.s]
	ldff1sw {z1.d}, p1/z, [z1.s]
	ldff1w {z1.s}, p1/z, [z1.d]
	ldff1w {z1.d}, p1/z, [z1.s]

	ldff1d {z1.d}, p1/z, [x1, x1]
	ldff1h {z1.h}, p1/z, [x1, x1]
	ldff1h {z1.s}, p1/z, [x1, x1]
	ldff1h {z1.d}, p1/z, [x1, x1]
	ldff1sh {z1.s}, p1/z, [x1, x1]
	ldff1sh {z1.d}, p1/z, [x1, x1]
	ldff1sw {z1.d}, p1/z, [x1, x1]
	ldff1w {z1.s}, p1/z, [x1, x1]
	ldff1w {z1.d}, p1/z, [x1, x1]
