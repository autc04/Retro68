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
#include <mips/cm3.h>

MIPS_NOMIPS16

#define CM3_BASE	t8
LEAF(__init_l23cache)
	/* Check for memory mapped L2 cache config */
	mfc0	t0, C0_CONFIG3
	ext	t1, t0, CFG3_M_SHIFT, 1
	beqz	t1, err

	mfc0	t0, C0_CONFIG4
	ext	t1, t0, CFG4_M_SHIFT, 1
	beqz	t1, err

	mfc0	t0, C0_CONFIG5
	ext	t1, t0, CFG5_L2C_SHIFT, 1
	bnez	t1, disable_cache
err:
	/*
	 * CM3 L2 code supplied but we have a Config2 L2 setup
	 * Report a Boot failure through UHI
	 */
	li	t9, 23
	/* Reason - L2 cache config */
	li	a0, 1
	/* Trigger the UHI operation */
	sdbbp 	1
	/* In case a debugger corrects this failure */
	jr	ra

disable_cache:
	/* Read CMGCRBase to find CMGCR_BASE_ADDR */
	PTR_MFC0 t1,C0_CMGCRBASE
	sll	t1, t1, CMGCR_BASE_ADDR_LSHIFT
	li	CM3_BASE, 0xa0000000		/* Make it virtual */
	or	CM3_BASE, CM3_BASE, t1

	/* Disable L2 cache by setting it to bypass mode */
	PTR_L	a0, GCR_L2_CONFIG(CM3_BASE)
	li	a2, 1
	ins	a0, a2, GCR_L2_BYPASS_SHIFT, GCR_L2_BYPASS_BITS
	PTR_S	a0, GCR_L2_CONFIG(CM3_BASE)
	sync
ret:
	jr	ra
END(__init_l23cache)

LEAF(__init_l23cache_cached)
	/* Read CMGCRBase to find CMGCR_BASE_ADDR */
	PTR_MFC0 t3,C0_CMGCRBASE
	sll	t3, t3, CMGCR_BASE_ADDR_LSHIFT
	li	CM3_BASE, 0xa0000000		/* Make it virtual */
	or	CM3_BASE, CM3_BASE, t3

	/* Read GCR_L2_CONFIG */
	move	t2, a0
	ext	t3, t2, GCR_L2_SL_SHIFT, GCR_L2_SL_BITS
	beqz	t3, done_cm3l2cache		# No L2 cache

	/* Unusual case, hardware cache initialization support & init finished. */
	PTR_L	t1, GCR_L2_RAM_CONFIG(CM3_BASE)
	ext	t0, t1, GCR_L2_RAM_HCIS_SHIFT, (GCR_L2_RAM_HCID_BITS +\
						GCR_L2_RAM_HCIS_BITS)
	li	t1, 3
	beq	t0, t1, done_cm3l2cache

	li	a2, 2
	sllv	a1, a2, t3			/* Now have L2 line size */

	ext	a0, t2, GCR_L2_SS_SHIFT, GCR_L2_SS_BITS
	li	a2, 64
	sllv	a0, a2, a0			/* Now have L2 sets/way */

	ext	t3, t2, GCR_L2_SA_SHIFT, GCR_L2_SA_BITS
	addiu	t3, t3, 1			/* Set associativity */
	mul	a0, t3, a0			/* Get total number of sets */

	sw	zero, GCR_TAG_ADDR(CM3_BASE)
	sw	zero, (GCR_TAG_ADDR+4)(CM3_BASE)
	sw	zero, GCR_TAG_STATE(CM3_BASE)
	sw	zero, (GCR_TAG_STATE+4)(CM3_BASE)
	sw	zero, GCR_TAG_DATA(CM3_BASE)
	sw	zero, (GCR_TAG_DATA+4)(CM3_BASE)
	sw	zero, GCR_TAG_ECC(CM3_BASE)
	sw	zero, (GCR_TAG_ECC+4)(CM3_BASE)
	sync

	li	a2, 0x80000000

next_cm3l2cache_tag:
	cache	Index_Store_Tag_S, 0(a2)
	addiu	a0, a0, -1
	addu	a2, a2, a1
	bnez	a0, next_cm3l2cache_tag

done_cm3l2cache:
	move	a2, zero
	PTR_L	t0, GCR_L2_CONFIG(CM3_BASE)
	ins	t0, a2, GCR_L2_BYPASS_SHIFT, GCR_L2_BYPASS_BITS
	PTR_S	t0, GCR_L2_CONFIG(CM3_BASE)

	jr	ra
END(__init_l23cache_cached)
