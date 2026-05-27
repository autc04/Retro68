/*
 * Copyright (C) 2015-2018 MIPS Tech, LLC
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

#if __mips_isa_rev < 6 || !defined(__mips_micromips)
.module hardfloat
.module doublefloat
#undef fp
.module fp=64
.module msa

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include <mips/hal.h>

MIPS_NOMIPS16

/*
 * FUNCTION:	_msactx_save
 * DESCRIPTION:	save MSA registers to memory starting at a0
 * RETURNS:	int
 *		0:	No context saved
 *		CTX_*:	Type of context stored
 */
LEAF(_msactx_save)
	move	a1, a0
	PTR_S	zero, LINKCTX_NEXT(a1)
	mfc0	t0, C0_CONFIG5
	ext	t0, t0, CFG5_MSAEN_SHIFT, 1
	bnez	t0, 1f
	/* MSA not enabled, bail out */
	move	va0, zero
	jr	ra

	/* Save FCSR if necessary */
1:	mfc0	t0, C0_STATUS
	ext	t1, t0, SR_CU1_SHIFT, 1
	lui	va0, %hi(LINKCTX_TYPE_MSA)
	beqz	t1, 2f
	lui	va0, %hi(LINKCTX_TYPE_FMSA)
	cfc1	t2, $31
	REG_S	t2, MSACTX_FCSR(a1)
	/* Save MSA */
2:	ori	va0, va0, %lo(LINKCTX_TYPE_MSA)
	cfcmsa	t0, $1
	REG_S	t0, MSACTX_MSACSR(a1)
	st.d	 $w0, MSACTX_0(a1)
	st.d	 $w1, MSACTX_1(a1)
	st.d	 $w2, MSACTX_2(a1)
	st.d	 $w3, MSACTX_3(a1)
	st.d	 $w4, MSACTX_4(a1)
	st.d	 $w5, MSACTX_5(a1)
	st.d	 $w6, MSACTX_6(a1)
	st.d	 $w7, MSACTX_7(a1)
	st.d	 $w8, MSACTX_8(a1)
	st.d	 $w9, MSACTX_9(a1)
	st.d	$w10, MSACTX_10(a1)
	st.d	$w11, MSACTX_11(a1)
	st.d	$w12, MSACTX_12(a1)
	st.d	$w13, MSACTX_13(a1)
	st.d	$w14, MSACTX_14(a1)
	st.d	$w15, MSACTX_15(a1)
	st.d	$w16, MSACTX_16(a1)
	st.d	$w17, MSACTX_17(a1)
	st.d	$w18, MSACTX_18(a1)
	st.d	$w19, MSACTX_19(a1)
	st.d	$w20, MSACTX_20(a1)
	st.d	$w21, MSACTX_21(a1)
	st.d	$w22, MSACTX_22(a1)
	st.d	$w23, MSACTX_23(a1)
	st.d	$w24, MSACTX_24(a1)
	st.d	$w25, MSACTX_25(a1)
	st.d	$w26, MSACTX_26(a1)
	st.d	$w27, MSACTX_27(a1)
	st.d	$w28, MSACTX_28(a1)
	st.d	$w29, MSACTX_29(a1)
	st.d	$w30, MSACTX_30(a1)
	st.d	$w31, MSACTX_31(a1)
	REG_S	va0, LINKCTX_ID(a1)
	jr	ra
END(_msactx_save)

/*
 * FUNCTION:	_msactx_load
 * DESCRIPTION:	load MSA/floating point registers from memory starting at a0
 * RETURNS:	int
 *		0:	Unrecognised context
 *		CTX_*:	Type of context restored
 */
LEAF(_msactx_load)
	move	a1, a0
	REG_L	va0, LINKCTX_ID(a1)
	/* Detect type */
	li	t0, LINKCTX_TYPE_FMSA
	li	t1, LINKCTX_TYPE_MSA
	li	t2, SR_CU1
	beq	va0, t0, 0f
	beq	va0, t1, 1f
	/* Don't recognise this context, fail */
	move	va0, zero
	jr	ra

0:	/* FPU+MSA context - Enable CU1 */
	di	t3
	ehb
	or	t3, t3, t2
	mtc0	t3, C0_STATUS
	ehb
	REG_L	t1, MSACTX_FCSR(a1)
	ctc1	t1, $31
1:	/* MSA context - Enable MSA */
	li	t3, CFG5_MSAEN
	mfc0	t2, C0_CONFIG5
	or	t2, t3, t2
	mtc0	t2, C0_CONFIG5
	ehb
	/* Load MSA */
	lw	t3, MSACTX_MSACSR(a1)
	ctcmsa	$1, t3
	ld.d	 $w0, MSACTX_0(a1)
	ld.d	 $w1, MSACTX_1(a1)
	ld.d	 $w2, MSACTX_2(a1)
	ld.d	 $w3, MSACTX_3(a1)
	ld.d	 $w4, MSACTX_4(a1)
	ld.d	 $w5, MSACTX_5(a1)
	ld.d	 $w6, MSACTX_6(a1)
	ld.d	 $w7, MSACTX_7(a1)
	ld.d	 $w8, MSACTX_8(a1)
	ld.d	 $w9, MSACTX_9(a1)
	ld.d	$w10, MSACTX_10(a1)
	ld.d	$w11, MSACTX_11(a1)
	ld.d	$w12, MSACTX_12(a1)
	ld.d	$w13, MSACTX_13(a1)
	ld.d	$w14, MSACTX_14(a1)
	ld.d	$w15, MSACTX_15(a1)
	ld.d	$w16, MSACTX_16(a1)
	ld.d	$w17, MSACTX_17(a1)
	ld.d	$w18, MSACTX_18(a1)
	ld.d	$w19, MSACTX_19(a1)
	ld.d	$w20, MSACTX_20(a1)
	ld.d	$w21, MSACTX_21(a1)
	ld.d	$w22, MSACTX_22(a1)
	ld.d	$w23, MSACTX_23(a1)
	ld.d	$w24, MSACTX_24(a1)
	ld.d	$w25, MSACTX_25(a1)
	ld.d	$w26, MSACTX_26(a1)
	ld.d	$w27, MSACTX_27(a1)
	ld.d	$w28, MSACTX_28(a1)
	ld.d	$w29, MSACTX_29(a1)
	ld.d	$w30, MSACTX_30(a1)
	ld.w	$w31, MSACTX_31(a1)
	/* Return CTX_(F)MSA */
	jr	ra
END(_msactx_load)

#endif // __mips_isa_rev < 6 || !defined(__micromips__)
