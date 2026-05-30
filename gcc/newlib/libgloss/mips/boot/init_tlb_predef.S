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

#define _BOOTCODE

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include "predef.h"

MIPS_NOMIPS16

LEAF(__init_tlb)
#if HAVE_LPA && ENABLE_XPA
	mfc0	t0, C0_PAGEGRAIN
	li	t1, 1
	ins	t0, t1, PAGEGRAIN_ELPA_SHIFT, PAGEGRAIN_ELPA_BITS
	mtc0	t0, C0_PAGEGRAIN
#endif
	# Top halves of registers are cleared impicitly with mtc0
	PTR_MTC0 zero, C0_PAGEMASK
	PTR_MTC0 zero, C0_ENTRYLO0
	PTR_MTC0 zero, C0_ENTRYLO1

#if HAVE_HW_TLB_WALK
	/* TLB walk done by hardware, Config4[IE] = 3 or Config[MT] = 1 */
	mtc0	zero, C0_INDEX
	ehb
	.set	push
	.set	eva
	tlbinvf
	.set	pop
#endif

#if HAVE_SW_TLB_WALK
	/*
	 * TLB walk done by software, Config4[IE] = 2, Config[MT] = 4
	 *
	 * one TLBINVF is executed with an index in VTLB range to
	 * invalidate all VTLB entries.
	 *
	 * One TLBINVF is executed per FTLB entry.
	 *
	 */
	li	t2, MMU_SIZE			/* Start pointer/finger */
	li	t8, FTLB_SETS
	li	t9, %hi(__tlb_stride_length)
	addiu	t9, %lo(__tlb_stride_length)
	mul	t8, t8, t9
	subu	t1, t2, t8			/* End pointer */

	mtc0	zero, C0_INDEX
	ehb
	.set	push
	.set	eva
	tlbinvf
	.set	pop

1:	subu	t2, t2, t9
	mtc0	t2, C0_INDEX
	ehb
	.set	push
	.set	eva
	tlbinvf
	.set	pop
	bne	t1, t2, 1b
#endif

#if HAVE_EHINV_WALK
	li	v0, MMU_SIZE
	move	v1, zero
	li	t0, C0_ENTRYHI_EHINV_MASK
	PTR_MTC0 t0, C0_ENTRYHI
1:
	mtc0	v1, C0_INDEX
	ehb

	tlbwi
	addiu	v1, v1, 1
	bne	v0, v1, 1b
#endif

#if HAVE_NO_INV
	/*
	 * Clean invalidate TLB for R1 onwards by loading
	 * 0x(FFFFFFFF)KSEG0_BASE into EntryHi and writing it into index MAX
	 * incrementing EntryHi by a pagesize, writing into index MAX-1, etc.
	 */
	li	v0, MMU_SIZE

	/*
	 * If large physical addressing is enabled, load 0xFFFFFFFF
	 * into the top half of EntryHi.
	 */
#if HAVE_LPA && ENABLE_LPA
	li	t0, -1
#endif
	li	t1, (KSEG0_BASE - 2<<13)

	move	v1, zero
1:	addiu	t1, t1, (2<<13)
	PTR_MTC0 t1, C0_ENTRYHI
#if HAVE_LPA && ENABLE_LPA
	mthc0	t0,  C0_ENTRYHI
#endif
	ehb				/* mt(h)c0, hazard on tlbp */

	tlbp				/* Probe for a match */
	ehb				/* tlbp, hazard on  MFC0 */

	mfc0	t8, C0_INDEX
	bgez	t8, 1b			/* Skip this address if it exists */

	mtc0	v0, C0_INDEX
	ehb				/* mtc0, hazard on tlbwi */

	tlbwi
	addiu	v1, v1, 1
	bne	v0, v1, 1b
#endif

	PTR_MTC0 zero, C0_ENTRYHI	/* Unset EntryHI, top half */
	MIPS_JRHB	(ra)
END(__init_tlb)
