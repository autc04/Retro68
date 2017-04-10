/* Test file for ARMv8.3 complex arithmetics instructions.  */
	.text

	/* Three-same operands FCMLA.  */
	fcmla	v1.2d, v2.2d, v3.2d, #0
	fcmla	v1.2d, v2.2d, v3.2d, #90
	fcmla	v1.2d, v2.2d, v3.2d, #180
	fcmla	v1.2d, v2.2d, v3.2d, #270

	fcmla	v1.2s, v2.2s, v3.2s, #90
	fcmla	v1.4s, v2.4s, v3.4s, #90
	fcmla	v1.4h, v2.4h, v3.4h, #90
	fcmla	v1.8h, v2.8h, v3.8h, #90

	/* Indexed element FCMLA.  */
	fcmla	v1.4s, v2.4s, v3.s[0], #0
	fcmla	v1.4s, v2.4s, v3.s[0], #90
	fcmla	v1.4s, v2.4s, v3.s[0], #180
	fcmla	v1.4s, v2.4s, v3.s[0], #270
	fcmla	v1.4s, v2.4s, v3.s[1], #90

	fcmla	v1.4h, v2.4h, v3.h[0], #90
	fcmla	v1.4h, v2.4h, v3.h[1], #90
	fcmla	v1.8h, v2.8h, v3.h[0], #90
	fcmla	v1.8h, v2.8h, v3.h[1], #90
	fcmla	v1.8h, v2.8h, v3.h[2], #90
	fcmla	v1.8h, v2.8h, v3.h[3], #90

	/* Three-same operands FADD.  */
	fcadd	v1.2d, v2.2d, v3.2d, #90
	fcadd	v1.2d, v2.2d, v3.2d, #270

	fcadd	v1.2s, v2.2s, v3.2s, #90
	fcadd	v1.4s, v2.4s, v3.4s, #90
	fcadd	v1.4h, v2.4h, v3.4h, #90
	fcadd	v1.8h, v2.8h, v3.8h, #90
