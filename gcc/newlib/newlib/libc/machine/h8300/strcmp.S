#include "setarch.h"

#include "defines.h"

#if defined (__H8300SX__)
	.section .text
	.global _strcmp
_strcmp:
	mov.l	er0,er2
loop:
	mov.b	@er2+,r0l
	extu.w	r0
	beq	eos
	mov.b	@er1+,r3l
	extu.w	r3
	sub.w	r3,r0
	beq	loop
#if (__INT_MAX__ > 32767)
	exts.l	er0
#endif
	rts
eos:
	mov.b	@er1,r3l
	extu.w	r3
	sub.w	r3,r0
#if (__INT_MAX__ > 32767)
	exts.l	er0
#endif
	rts
	.end
#else
	.section .text
	.align 2
	.global _strcmp
_strcmp:
	MOVP	A0P,A2P
	MOVP	A1P,A3P
.L5:
	mov.b	@A2P+,A1L
	beq	.L3
	mov.b	@A3P+,A0L
	cmp.b	A0L,A1L
	beq	.L5
#ifdef __NORMAL_MODE__
	sub	#1,A3P
#else
	subs	#1,A3P
#endif
.L3:
	mov.b	@(-1,A2P),A0L
	mov.b	@A3P,A1L
	sub.b	A0H,A0H ; H8/300 does not have EXTU.W instruction
	sub.b	A1H,A1H ; so we just zero higher byte of the word
	sub.w	A1,A0
	; We have to sign extend the result to 32bits just in case
	; we are using 32bit integers. H8/300 does not support 32bit
	; integers (-mint32), so we can just use EXTS.L here.
#if (__INT_MAX__ > 32767)
	exts.l	er0
#endif
	rts
	.end
#endif
