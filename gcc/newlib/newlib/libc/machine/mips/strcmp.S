/*
 * Copyright (C) 2014-2018 MIPS Tech, LLC
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * 3. Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from this
 * software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
*/

#ifdef ANDROID_CHANGES
# include "machine/asm.h"
# include "machine/regdef.h"
#elif _LIBC
# include "machine/asm.h"
# include "machine/regdef.h"
#else
# include <regdef.h>
# include <sys/asm.h>
#endif

/* Testing on a little endian machine showed using CLZ was a
   performance loss, so we are not turning it on by default.  */
#if defined(ENABLE_CLZ) && (__mips_isa_rev > 1)
# define USE_CLZ
#elif (__mips_isa_rev >= 2)
# define USE_EXT 1
#else
# define USE_EXT 0
#endif

/* Some asm.h files do not have the L macro definition.  */
#ifndef L
# if _MIPS_SIM == _ABIO32
#  define L(label) $L ## label
# else
#  define L(label) .L ## label
# endif
#endif

/* Some asm.h files do not have the PTR_ADDIU macro definition.  */
#ifndef PTR_ADDIU
# ifdef USE_DOUBLE
#  define PTR_ADDIU       daddiu
# else
#  define PTR_ADDIU       addiu
# endif
#endif

/* Haven't yet found a configuration where DSP code outperforms
   normal assembly.  */
#define __mips_using_dsp 0

/* Allow the routine to be named something else if desired.  */
#ifndef STRCMP_NAME
# define STRCMP_NAME strcmp
#endif

#ifdef ANDROID_CHANGES
LEAF(STRCMP_NAME, 0)
#else
LEAF(STRCMP_NAME)
#endif
	.set	nomips16
	or	t0, a0, a1
	andi	t0, t0, 0x3
	bne	t0, zero, L(byteloop)

/* Both strings are 4 byte aligned at this point.  */

	li	t8, 0x01010101
#if !__mips_using_dsp
	li	t9, 0x7f7f7f7f
#endif

#if __mips_using_dsp
# define STRCMP32(OFFSET)	\
	lw	a2, OFFSET(a0); \
	lw	a3, OFFSET(a1); \
	subu_s.qb t0, t8, a2;	\
	bne	a2, a3, L(worddiff); \
	bne	t0, zero, L(returnzero)
#else  /* !__mips_using_dsp */
# define STRCMP32(OFFSET)	\
	lw	a2, OFFSET(a0); \
	lw	a3, OFFSET(a1); \
	subu	t0, a2, t8;	\
	nor	t1, a2, t9;	\
	bne	a2, a3, L(worddiff); \
	and	t1, t0, t1;	\
	bne	t1, zero, L(returnzero)
#endif /* __mips_using_dsp */

	.align 2
L(wordloop):
	STRCMP32(0)
	STRCMP32(4)
	STRCMP32(8)
	STRCMP32(12)
	STRCMP32(16)
	STRCMP32(20)
	STRCMP32(24)
	lw	a2, 28(a0)
	lw	a3, 28(a1)
#if __mips_using_dsp
	subu_s.qb t0, t8, a2
#else
	subu	t0, a2, t8
	nor	t1, a2, t9
	and	t1, t0, t1
#endif

	PTR_ADDIU a0, a0, 32
	bne	a2, a3, L(worddiff)
	PTR_ADDIU a1, a1, 32
	beq	t1, zero, L(wordloop)

L(returnzero):
	move	va0, zero
	jr	ra

	.align 2
L(worddiff):
#ifdef USE_CLZ
	xor	t0, a2, a3
	or	t0, t0, t1
# if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
	wsbh	t0, t0
	rotr	t0, t0, 16
# endif /* LITTLE_ENDIAN */
	clz	t1, t0
	or	t0, t1, 24	/* Only care about multiples of 8.  */
	xor	t1, t1, t0	/* {0,8,16,24} => {24,16,8,0}  */
# if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
	sllv	a2,a2,t1
	sllv	a3,a3,t1
# else
	srlv	a2,a2,t1
	srlv	a3,a3,t1
# endif
	subu	va0, a2, a3
	jr	ra
#else /* USE_CLZ */
# if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
	andi	a0, a2, 0xff	/* abcd => d */
	andi	a1, a3, 0xff
	beq	a0, zero, L(wexit01)
#  if USE_EXT
	ext	t8, a2, 8, 8
	bne	a0, a1, L(wexit01)
	ext	t9, a3, 8, 8
	beq	t8, zero, L(wexit89)
	ext	a0, a2, 16, 8
	bne	t8, t9, L(wexit89)
	ext	a1, a3, 16, 8
#  else  /* !USE_EXT */
	srl	t8, a2, 8
	bne	a0, a1, L(wexit01)
	srl	t9, a3, 8
	andi	t8, t8, 0xff
	andi	t9, t9, 0xff
	beq	t8, zero, L(wexit89)
	srl	a0, a2, 16
	bne	t8, t9, L(wexit89)
	srl	a1, a3, 16
	andi	a0, a0, 0xff
	andi	a1, a1, 0xff
#  endif  /* !USE_EXT */

# else /* __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ */
	srl	a0, a2, 24	/* abcd => a */
	srl	a1, a3, 24
	beq	a0, zero, L(wexit01)

#  if USE_EXT
	ext	t8, a2, 16, 8
	bne	a0, a1, L(wexit01)
	ext	t9, a3, 16, 8
	beq	t8, zero, L(wexit89)
	ext	a0, a2, 8, 8
	bne	t8, t9, L(wexit89)
	ext	a1, a3, 8, 8
#  else /* ! USE_EXT */
	srl	t8, a2, 16
	bne	a0, a1, L(wexit01)
	srl	t9, a3, 16
	andi	t8, t8, 0xff
	andi	t9, t9, 0xff
	beq	t8, zero, L(wexit89)
	srl	a0, a2, 8
	bne	t8, t9, L(wexit89)
	srl	a1, a3, 8
	andi	a0, a0, 0xff
	andi	a1, a1, 0xff
#  endif  /* USE_EXT */

# endif /* __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ */

	beq	a0, zero, L(wexit01)
	bne	a0, a1, L(wexit01)

# if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
	srl a0, a2, 24
	srl a1, a3, 24
# else /* __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ */
	move a0, a2
	move a1, a3
# endif /* __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ */

L(wexit01):
	subu	va0, a0, a1
	jr	ra

L(wexit89):
	subu	va0, t8, t9
	jr	ra

#endif /* USE_CLZ */

#define DELAY_NOP nop

/* It might seem better to do the 'beq' instruction between the two 'lbu'
   instructions so that the nop is not needed but testing showed that this
   code is actually faster (based on glibc strcmp test).  */

#define BYTECMP01(OFFSET) \
	lbu	a3, OFFSET(a1); \
	DELAY_NOP; \
	beq	a2, zero, L(bexit01); \
	lbu	t8, OFFSET+1(a0); \
	bne	a2, a3, L(bexit01)

#define BYTECMP89(OFFSET) \
	lbu	t9, OFFSET(a1); \
	DELAY_NOP; \
	beq	t8, zero, L(bexit89); \
	lbu	a2, OFFSET+1(a0); \
	bne	t8, t9, L(bexit89)

	.align 2
L(byteloop):
	lbu	a2, 0(a0)
	BYTECMP01(0)
	BYTECMP89(1)
	BYTECMP01(2)
	BYTECMP89(3)
	BYTECMP01(4)
	BYTECMP89(5)
	BYTECMP01(6)
	lbu	t9, 7(a1)

	PTR_ADDIU a0, a0, 8
	beq	t8, zero, L(bexit89)
	PTR_ADDIU a1, a1, 8
	beq	t8, t9, L(byteloop)

L(bexit89):
	subu	va0, t8, t9
	jr	ra

L(bexit01):
	subu	va0, a2, a3
	jr	ra

	.set	at

END(STRCMP_NAME)
