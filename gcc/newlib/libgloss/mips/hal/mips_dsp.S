/*
 * Copyright (C) 2016-2018 MIPS Tech, LLC
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

.set nomips16
#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include <mips/hal.h>

#
# FUNCTION:	_dsp_save
# DESCRIPTION:	save the DSP context.
# RETURNS:	int
#		0:	No context saved
#		CTX_*:	Type of conext stored
#
LEAF(_dsp_save)
	move	a1, a0
	PTR_S	zero, LINKCTX_NEXT(a1)
	move    va0, zero

	/* Test for DSP support */
	mfc0	t0, C0_CONFIG3
	ext	t0, t0, CFG3_DSPP_SHIFT, 1
	beqz    t0, 1f

	/* Test for DSP enabled */
	mfc0	t0, C0_STATUS
	ext	t0, t0, SR_MX_SHIFT, 1
	beqz	t0, 1f

	li	va0, LINKCTX_TYPE_DSP
	.set push
	.set dsp
	rddsp	t1
	mfhi	t2, $ac1
	mflo	t3, $ac1
	mfhi	t4, $ac2
	mflo	t5, $ac2
	mfhi	t6, $ac3
	mflo	t7, $ac3
	.set pop
	sw	t1, DSPCTX_DSPC(a1)
	sw	t2, DSPCTX_HI1(a1)
	sw	t3, DSPCTX_LO1(a1)
	sw	t4, DSPCTX_HI2(a1)
	sw	t5, DSPCTX_LO2(a1)
	sw	t6, DSPCTX_HI3(a1)
	sw	t7, DSPCTX_LO3(a1)
	REG_S	va0, LINKCTX_ID(a1)
1:
	jr ra
END(_dsp_save)

#
# FUNCTION:	_dsp_load
# DESCRIPTION:	load the DSP context.
# RETURNS:	int
#		0:	Unrecognised context
#		CTX_*:	Type of context restored
#
LEAF(_dsp_load)
	move	a1, a0
	REG_L   va0, LINKCTX_ID(a1)
	li	v1, LINKCTX_TYPE_DSP
	bne	va0,v1,1f

	/* Test for DSP support */
	mfc0	t0, C0_CONFIG3
	ext	t0, t0, CFG3_DSPP_SHIFT, 1
	beqz    t0, 1f

	/* Force on DSP */
	di	t3
	ehb
	or	t3, t3, SR_MX
	mtc0	t3, C0_STATUS
	ehb

	lw	t1, DSPCTX_DSPC(a1)
	lw	t2, DSPCTX_HI1(a1)
	lw	t3, DSPCTX_LO1(a1)
	lw	t4, DSPCTX_HI2(a1)
	lw	t5, DSPCTX_LO2(a1)
	lw	t6, DSPCTX_HI3(a1)
	lw	t7, DSPCTX_LO3(a1)
	.set push
	.set dsp
	wrdsp	t1
	mthi	t2, $ac1
	mtlo	t3, $ac1
	mthi	t4, $ac2
	mtlo	t5, $ac2
	mthi	t6, $ac3
	mtlo	t7, $ac3
	.set pop
	jr ra
1:
	/* Don't recognise this context, fail */
	move	va0, zero
	jr ra
END(_dsp_load)
