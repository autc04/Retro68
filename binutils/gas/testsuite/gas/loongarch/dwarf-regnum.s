# Check whether CFI directives can access all register names.
	.text
	.globl _start
_start:
	.cfi_startproc
	nop
	# dwarf 0-31
	.cfi_offset 0, 8
	.cfi_offset 1, 16
	.cfi_offset 2, 24
	.cfi_offset 3, 32
	.cfi_offset 4, 40
	.cfi_offset 5, 48
	.cfi_offset 6, 56
	.cfi_offset 7, 64
	.cfi_offset 8, 72
	.cfi_offset 9, 80
	.cfi_offset 10,88
	.cfi_offset 11,96
	.cfi_offset 12,104
	.cfi_offset 13,112
	.cfi_offset 14,120
	.cfi_offset 15,128
	.cfi_offset 16,136
	.cfi_offset 17,144
	.cfi_offset 18,152
	.cfi_offset 19,160
	.cfi_offset 20,168
	.cfi_offset 21,176
	.cfi_offset 22,184
	.cfi_offset 23,192
	.cfi_offset 24,200
	.cfi_offset 25,208
	.cfi_offset 26,216
	.cfi_offset 27,224
	.cfi_offset 28,232
	.cfi_offset 29,240
	.cfi_offset 30,248
	.cfi_offset 31,256

	# ABI GPRs name
	.cfi_offset $r0, 8
	.cfi_offset $r1, 16
	.cfi_offset $r2, 24
	.cfi_offset $r3, 32
	.cfi_offset $r4, 40
	.cfi_offset $r5, 48
	.cfi_offset $r6, 56
	.cfi_offset $r7, 64
	.cfi_offset $r8, 72
	.cfi_offset $r9, 80
	.cfi_offset $r10,88
	.cfi_offset $r11,96
	.cfi_offset $r12,104
	.cfi_offset $r13,112
	.cfi_offset $r14,120
	.cfi_offset $r15,128
	.cfi_offset $r16,136
	.cfi_offset $r17,144
	.cfi_offset $r18,152
	.cfi_offset $r19,160
	.cfi_offset $r20,168
	.cfi_offset $r21,176
	.cfi_offset $r22,184
	.cfi_offset $r23,192
	.cfi_offset $r24,200
	.cfi_offset $r25,208
	.cfi_offset $r26,216
	.cfi_offset $r27,224
	.cfi_offset $r28,232
	.cfi_offset $r29,240
	.cfi_offset $r30,248
	.cfi_offset $r31,256

	# ABI GPRs alias
	.cfi_offset $zero,8
	.cfi_offset $ra,  16
	.cfi_offset $tp,  24
	.cfi_offset $sp,  32
	.cfi_offset $a0,  40
	.cfi_offset $a1,  48
	.cfi_offset $a2,  56
	.cfi_offset $a3,  64
	.cfi_offset $a4,  72
	.cfi_offset $a5,  80
	.cfi_offset $a6,  88
	.cfi_offset $a7,  96
	.cfi_offset $t0,  104
	.cfi_offset $t1,  112
	.cfi_offset $t2,  120
	.cfi_offset $t3,  128
	.cfi_offset $t4,  136
	.cfi_offset $t5,  144
	.cfi_offset $t6,  152
	.cfi_offset $t7,  160
	.cfi_offset $t8,  168
	.cfi_offset $r21, 176
	.cfi_offset $fp,  184
	.cfi_offset $s0,  192
	.cfi_offset $s1,  200
	.cfi_offset $s2,  208
	.cfi_offset $s3,  216
	.cfi_offset $s4,  224
	.cfi_offset $s5,  232
	.cfi_offset $s6,  240
	.cfi_offset $s7,  248
	.cfi_offset $s8,  256

	# numeric GPRs alias
	.cfi_offset r0, 8
	.cfi_offset r1, 16
	.cfi_offset r2, 24
	.cfi_offset r3, 32
	.cfi_offset r4, 40
	.cfi_offset r5, 48
	.cfi_offset r6, 56
	.cfi_offset r7, 64
	.cfi_offset r8, 72
	.cfi_offset r9, 80
	.cfi_offset r10,88
	.cfi_offset r11,96
	.cfi_offset r12,104
	.cfi_offset r13,112
	.cfi_offset r14,120
	.cfi_offset r15,128
	.cfi_offset r16,136
	.cfi_offset r17,144
	.cfi_offset r18,152
	.cfi_offset r19,160
	.cfi_offset r20,168
	.cfi_offset r21,176
	.cfi_offset r22,184
	.cfi_offset r23,192
	.cfi_offset r24,200
	.cfi_offset r25,208
	.cfi_offset r26,216
	.cfi_offset r27,224
	.cfi_offset r28,232
	.cfi_offset r29,240
	.cfi_offset r30,248
	.cfi_offset r31,256

	# without "$" GPRs alias
	.cfi_offset zero,8
	.cfi_offset ra,  16
	.cfi_offset tp,  24
	.cfi_offset sp,  32
	.cfi_offset a0,  40
	.cfi_offset a1,  48
	.cfi_offset a2,  56
	.cfi_offset a3,  64
	.cfi_offset a4,  72
	.cfi_offset a5,  80
	.cfi_offset a6,  88
	.cfi_offset a7,  96
	.cfi_offset t0,  104
	.cfi_offset t1,  112
	.cfi_offset t2,  120
	.cfi_offset t3,  128
	.cfi_offset t4,  136
	.cfi_offset t5,  144
	.cfi_offset t6,  152
	.cfi_offset t7,  160
	.cfi_offset t8,  168
	.cfi_offset r21, 176
	.cfi_offset fp,  184
	.cfi_offset s0,  192
	.cfi_offset s1,  200
	.cfi_offset s2,  208
	.cfi_offset s3,  216
	.cfi_offset s4,  224
	.cfi_offset s5,  232
	.cfi_offset s6,  240
	.cfi_offset s7,  248
	.cfi_offset s8,  256

	# dwarf 32-63
	.cfi_offset 32,264
	.cfi_offset 33,272
	.cfi_offset 34,280
	.cfi_offset 35,288
	.cfi_offset 36,296
	.cfi_offset 37,304
	.cfi_offset 38,312
	.cfi_offset 39,320
	.cfi_offset 40,328
	.cfi_offset 41,336
	.cfi_offset 42,344
	.cfi_offset 43,352
	.cfi_offset 44,360
	.cfi_offset 45,368
	.cfi_offset 46,376
	.cfi_offset 47,384
	.cfi_offset 48,392
	.cfi_offset 49,400
	.cfi_offset 50,408
	.cfi_offset 51,416
	.cfi_offset 52,424
	.cfi_offset 53,432
	.cfi_offset 54,440
	.cfi_offset 55,448
	.cfi_offset 56,456
	.cfi_offset 57,464
	.cfi_offset 58,472
	.cfi_offset 59,480
	.cfi_offset 60,488
	.cfi_offset 61,496
	.cfi_offset 62,504
	.cfi_offset 63,512

	# ABI FPRs names
	.cfi_offset $f0, 264
	.cfi_offset $f1, 272
	.cfi_offset $f2, 280
	.cfi_offset $f3, 288
	.cfi_offset $f4, 296
	.cfi_offset $f5, 304
	.cfi_offset $f6, 312
	.cfi_offset $f7, 320
	.cfi_offset $f8, 328
	.cfi_offset $f9, 336
	.cfi_offset $f10,344
	.cfi_offset $f11,352
	.cfi_offset $f12,360
	.cfi_offset $f13,368
	.cfi_offset $f14,376
	.cfi_offset $f15,384
	.cfi_offset $f16,392
	.cfi_offset $f17,400
	.cfi_offset $f18,408
	.cfi_offset $f19,416
	.cfi_offset $f20,424
	.cfi_offset $f21,432
	.cfi_offset $f22,440
	.cfi_offset $f23,448
	.cfi_offset $f24,456
	.cfi_offset $f25,464
	.cfi_offset $f26,472
	.cfi_offset $f27,480
	.cfi_offset $f28,488
	.cfi_offset $f29,496
	.cfi_offset $f30,504
	.cfi_offset $f31,512

	# ABI FPRs alias
	.cfi_offset $fa0, 264
	.cfi_offset $fa1, 272
	.cfi_offset $fa2, 280
	.cfi_offset $fa3, 288
	.cfi_offset $fa4, 296
	.cfi_offset $fa5, 304
	.cfi_offset $fa6, 312
	.cfi_offset $fa7, 320
	.cfi_offset $ft0, 328
	.cfi_offset $ft1, 336
	.cfi_offset $ft2,344
	.cfi_offset $ft3,352
	.cfi_offset $ft4,360
	.cfi_offset $ft5,368
	.cfi_offset $ft6,376
	.cfi_offset $ft7,384
	.cfi_offset $ft8,392
	.cfi_offset $ft9,400
	.cfi_offset $ft10,408
	.cfi_offset $ft11,416
	.cfi_offset $ft12,424
	.cfi_offset $ft13,432
	.cfi_offset $ft14,440
	.cfi_offset $ft15,448
	.cfi_offset $fs0,456
	.cfi_offset $fs1,464
	.cfi_offset $fs2,472
	.cfi_offset $fs3,480
	.cfi_offset $fs4,488
	.cfi_offset $fs5,496
	.cfi_offset $fs6,504
	.cfi_offset $fs7,512

	# numeric FPRs names
	.cfi_offset f0, 264
	.cfi_offset f1, 272
	.cfi_offset f2, 280
	.cfi_offset f3, 288
	.cfi_offset f4, 296
	.cfi_offset f5, 304
	.cfi_offset f6, 312
	.cfi_offset f7, 320
	.cfi_offset f8, 328
	.cfi_offset f9, 336
	.cfi_offset f10,344
	.cfi_offset f11,352
	.cfi_offset f12,360
	.cfi_offset f13,368
	.cfi_offset f14,376
	.cfi_offset f15,384
	.cfi_offset f16,392
	.cfi_offset f17,400
	.cfi_offset f18,408
	.cfi_offset f19,416
	.cfi_offset f20,424
	.cfi_offset f21,432
	.cfi_offset f22,440
	.cfi_offset f23,448
	.cfi_offset f24,456
	.cfi_offset f25,464
	.cfi_offset f26,472
	.cfi_offset f27,480
	.cfi_offset f28,488
	.cfi_offset f29,496
	.cfi_offset f30,504
	.cfi_offset f31,512

	# without "$" FPRs alias
	.cfi_offset fa0, 264
	.cfi_offset fa1, 272
	.cfi_offset fa2, 280
	.cfi_offset fa3, 288
	.cfi_offset fa4, 296
	.cfi_offset fa5, 304
	.cfi_offset fa6, 312
	.cfi_offset fa7, 320
	.cfi_offset ft0, 328
	.cfi_offset ft1, 336
	.cfi_offset ft2,344
	.cfi_offset ft3,352
	.cfi_offset ft4,360
	.cfi_offset ft5,368
	.cfi_offset ft6,376
	.cfi_offset ft7,384
	.cfi_offset ft8,392
	.cfi_offset ft9,400
	.cfi_offset ft10,408
	.cfi_offset ft11,416
	.cfi_offset ft12,424
	.cfi_offset ft13,432
	.cfi_offset ft14,440
	.cfi_offset ft15,448
	.cfi_offset fs0,456
	.cfi_offset fs1,464
	.cfi_offset fs2,472
	.cfi_offset fs3,480
	.cfi_offset fs4,488
	.cfi_offset fs5,496
	.cfi_offset fs6,504
	.cfi_offset fs7,512

	nop
	.cfi_endproc
