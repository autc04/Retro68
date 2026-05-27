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

#define _BOOTCODE

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>

MIPS_NOMIPS16

      .set  noat

LEAF(__init_cp0)

	/* Initialize Status */
	li	t1, SR_ERL | SR_BEV
	mtc0	t1, C0_STATUS

	/* Initialize Watch registers if implemented */
	mfc0	t0, C0_CONFIG1
	ext	t1, t0, CFG1_WR_SHIFT, 1
	beqz	t1, $Ldone_wr
	li	t1, WATCHHI_I | WATCHHI_R | WATCHHI_W

	/* Clear Watch Status bits and disable watch exceptions */
	mtc0	t1, C0_WATCHHI
	mfc0	t0, C0_WATCHHI
	mtc0	zero, C0_WATCHLO
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 1
	mfc0	t0, C0_WATCHHI, 1
	mtc0	zero, C0_WATCHLO, 1
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 2
	mfc0	t0, C0_WATCHHI, 2
	mtc0	zero, C0_WATCHLO, 2
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 3
	mfc0	t0, C0_WATCHHI, 3
	mtc0	zero, C0_WATCHLO, 3
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 4
	mfc0	t0, C0_WATCHHI, 4
	mtc0	zero, C0_WATCHLO, 4
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 5
	mfc0	t0, C0_WATCHHI, 5
	mtc0	zero, C0_WATCHLO, 5
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 6
	mfc0	t0, C0_WATCHHI, 6
	mtc0	zero, C0_WATCHLO, 6
	bgez	t0, $Ldone_wr

	mtc0	t1, C0_WATCHHI, 7
	mfc0	t0, C0_WATCHHI, 7
	mtc0	zero, C0_WATCHLO, 7

$Ldone_wr:
	/*
	 * Clear WP bit to avoid watch exception upon user code entry, IV,
	 * and software interrupts.
	 */
	mtc0	zero, C0_CAUSE

	/*
	 * Clear timer interrupt. (Count was cleared at the reset vector to
	 * allow timing boot.)
	 */
	mtc0	zero, C0_COMPARE

	jr	ra
END(__init_cp0)
