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

#define _RESETCODE

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include <mips/cm3.h>
#include "predef.h"

MIPS_NOMIPS16

/* Config 0 has some RO fields. */
#if defined (C0_CONFIG0_VALUE)
#define C0_CONFIG0_RO	(CFG0_M | CFG0_AT_MASK | CFG0_AR_MASK | \
			CFG0_MT_MASK | CFG0_VI)
#define C0_CONFIG0_EXP	(C0_CONFIG0_RO & C0_CONFIG0_VALUE)
#endif

/* Config 1 has no RW fields. */
#if defined(C0_CONFIG1_VALUE)
#define C0_CONFIG1_RO (0xffffffff)
#define C0_CONFIG1_EXP	(C0_CONFIG1_RO & C0_CONFIG1_VALUE)
#endif

/* Config 2 has 2 RW fields. */
#if defined(C0_CONFIG2_VALUE)
#define C0_CONFIG2_RO ~(CFG2_TU_MASK | CFG2_SU_MASK)
#define C0_CONFIG2_EXP	(C0_CONFIG2_RO & C0_CONFIG2_VALUE)
#endif

/* Config 3 has only 1 R/W bit (microMIPS on exception) */
#if defined(C0_CONFIG3_VALUE)
#define C0_CONFIG3_RO	(~CFG3_IOE)
#define C0_CONFIG3_EXP	(C0_CONFIG3_RO & C0_CONFIG3_VALUE)
#endif


/* Config 4 has only 1 field R/W (FTLB page size) */
#if defined(C0_CONFIG4_VALUE)
#define C0_CONFIG4_RO	(~CFG4_FTLBPS_MASK)
#define C0_CONFIG4_EXP	(C0_CONFIG4_RO & C0_CONFIG4_VALUE)
#endif

/* Config 5 has only a few fields and some of them are RO. */
#if defined(C0_CONFIG5_VALUE)
#define C0_CONFIG5_RO	(CFG5_MVH | CFG5_LLB | CFG5_MRP | CFG5_NF)
#define C0_CONFIG5_EXP	(C0_CONFIG5_RO & C0_CONFIG5_VALUE)
#endif

#if defined(C0_CMGCRBASE_VALUE)
#define C0_CMGCRBASE_ADDR ((C0_CMGCRBASE_VALUE << 4) | (0xb << 28))
#define C0_CMGCRBASE_RO	(0xffffffff)
#define C0_CMGCRBASE_EXP C0_CMGCRBASE_VALUE
#endif

/* GCR L2 config has REG_EXISTS and L2 config as readonly nozero fields. */
#if defined(GCR_L2_CONFIG)
#define GCR_L2_CONFIG_RO ((1<<31) | ((1<<16) - 1))
#define GCR_L2_CONFIG_EXP GCR_L2_CONFIG_VALUE
#endif

LEAF(__core_check)
	/*
	 * Compare the expected value to the RO fields
	 * of the config register
	 */
#if defined(C0_CONFIG0_VALUE)
	li	t0, C0_CONFIG0_EXP
	li	t1, C0_CONFIG0_RO
	mfc0	t3, C0_CONFIG
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif

#if defined(C0_CONFIG1_VALUE)
	li	t0, C0_CONFIG1_EXP
	li	t1, C0_CONFIG1_RO
	mfc0	t3, C0_CONFIG1
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif

#if defined(C0_CONFIG2_VALUE)
	li	t0, C0_CONFIG2_EXP
	li	t1, C0_CONFIG2_RO
	mfc0	t3, C0_CONFIG2
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif

#if defined(C0_CONFIG3_VALUE)
	li	t0, C0_CONFIG3_EXP
	li	t1, C0_CONFIG3_RO
	mfc0	t3, C0_CONFIG3
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif

#if defined(C0_CONFIG4_VALUE)
	li	t0, C0_CONFIG4_EXP
	li	t1, C0_CONFIG4_RO
	mfc0	t3, C0_CONFIG4
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif

#if defined(C0_CONFIG5_VALUE)
	li	t0, C0_CONFIG5_EXP
	li	t1, C0_CONFIG5_RO
	mfc0	t3, C0_CONFIG5
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif

#if defined(C0_CMGCRBASE_VALUE)
	li	t0, C0_CMGCRBASE_EXP
	li	t1, C0_CMGCRBASE_RO
	mfc0	t3, C0_CMGCRBASE
	and	t2, t1, t3
	bne	t2, t0, 1f
#if defined(GCR_L2_CONFIG_VALUE)
	li	t0, GCR_L2_CONFIG_EXP
	li	t1, GCR_L2_CONFIG_RO
	li	t2, C0_CMGCRBASE_ADDR
	lw	t3, GCR_L2_CONFIG(t2)
	and	t2, t1, t3
	bne	t2, t0, 1f
#endif
#endif

#if defined(C0_WATCHHI_VALUE)
	mfc0	t0, C0_WATCHHI, 0
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

#if defined(C0_WATCHHI1_VALUE)
	mfc0	t0, C0_WATCHHI, 1
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI1_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

#if defined(C0_WATCHHI2_VALUE)
	mfc0	t0, C0_WATCHHI, 2
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI2_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

#if defined(C0_WATCHHI3_VALUE)
	mfc0	t0, C0_WATCHHI, 3
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI3_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

#if defined(C0_WATCHHI4_VALUE)
	mfc0	t0, C0_WATCHHI, 4
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI4_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

#if defined(C0_WATCHHI5_VALUE)
	mfc0	t0, C0_WATCHHI, 5
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI5_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

#if defined(C0_WATCHHI6_VALUE)
	mfc0	t0, C0_WATCHHI, 6
	ext	t0, t0, WATCHHI_M_SHIFT, 1

	li	t1, ((C0_WATCHHI6_VALUE & WATCHHI_M) >> WATCHHI_M_SHIFT)
	bne	t0, t1, 1f
#endif

	b	2f
1:
	/* Incorrect config supplied, report a boot failure through UHI */
	li	t9, 23
	/* Reason - Predef config incorrect */
	li	a0, 2
	/* Trigger the UHI operation */
	sdbbp	1
	/* In case a debugger corrects this failure */

2:
	jr	ra

END(__core_check)
