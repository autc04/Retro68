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

#include <mips/regdef.h>
#include <mips/asm.h>
#include <mips/cpu.h>
#include <mips/hal.h>

/* Save the hard context to a gp_ctx pointed to by k1.
   Leave the value of C0_STATUS in the return register.
   Leave the value of k1 unchanged.  */

.macro _gpctx_save
	/* Save general registers.  */
	REG_S   $1, CTX_REG(1) (k1)
	REG_S   $2, CTX_REG(2) (k1)
	REG_S   $3, CTX_REG(3) (k1)
	REG_S   $4, CTX_REG(4) (k1)
	REG_S   $5, CTX_REG(5) (k1)
	REG_S   $6, CTX_REG(6) (k1)
	REG_S   $7, CTX_REG(7) (k1)
	REG_S   $8, CTX_REG(8) (k1)
	REG_S   $9, CTX_REG(9) (k1)
	REG_S   $10, CTX_REG(10) (k1)
	REG_S   $11, CTX_REG(11) (k1)
	REG_S   $12, CTX_REG(12) (k1)
	REG_S   $13, CTX_REG(13) (k1)
	REG_S   $14, CTX_REG(14) (k1)
	REG_S   $15, CTX_REG(15) (k1)
	REG_S   $16, CTX_REG(16) (k1)
	REG_S   $17, CTX_REG(17)(k1)
	REG_S   $18, CTX_REG(18)(k1)
	REG_S   $19, CTX_REG(19)(k1)
	REG_S   $20, CTX_REG(20)(k1)
	REG_S   $21, CTX_REG(21)(k1)
	REG_S   $22, CTX_REG(22)(k1)
	REG_S   $23, CTX_REG(23)(k1)
	REG_S   $24, CTX_REG(24)(k1)
	REG_S   $25, CTX_REG(25)(k1)
	REG_S   $26, CTX_REG(26)(k1)
	/* $27/k1 must be saved prior to using this macro.  */
	REG_S   $28, CTX_REG(28)(k1)
	REG_S   $29, CTX_REG(29)(k1)
	REG_S   $30, CTX_REG(30)(k1)
	REG_S   $31, CTX_REG(31)(k1)
	PTR_S   $0, CTX_LINK(k1) 	/* Clear the link field.  */

	/* Check ISA release and optionally restore HI/LO registers.  */
#if (__mips_isa_rev < 6)
	mfhi	$9
	REG_S	$9, CTX_HI0(k1)
	mflo	$10
	REG_S	$10, CTX_LO0(k1)
#endif

	/* Save CP0 registers.  */
	PTR_MFC0 $31, C0_EPC
	REG_S	$31, CTX_EPC(k1)
	mfc0	va0, C0_STATUS
	sw	va0, CTX_STATUS(k1)
.endm

/* Restores a gp_ctx pointed to by a0.  Leaves interrupts disabled and
   C0_EPC ready to eret.  */

.macro _gpctx_load

	/* Check ISA release and optionally restore HI/LO registers.  */
#if (__mips_isa_rev < 6)
	REG_L	$9, CTX_HI0(a0)
	REG_L	$10, CTX_LO0(a0)
	mthi	$9
	mtlo	$10
#endif

	/* Restore the general registers.  */
	REG_L	$1, CTX_REG(1)(a0)
	REG_L	$2, CTX_REG(2)(a0)
	REG_L	$3, CTX_REG(3)(a0)
	/* Do not restore $4 until the end.  */
	REG_L	$5, CTX_REG(5)(a0)
	REG_L	$6, CTX_REG(6)(a0)
	REG_L	$7, CTX_REG(7)(a0)
	REG_L	$8, CTX_REG(8)(a0)
	REG_L	$9, CTX_REG(9)(a0)
	REG_L	$10, CTX_REG(10)(a0)
	REG_L	$11, CTX_REG(11)(a0)
	REG_L	$12, CTX_REG(12)(a0)
	REG_L	$13, CTX_REG(13)(a0)
	REG_L	$14, CTX_REG(14)(a0)
	REG_L	$15, CTX_REG(15)(a0)
	REG_L	$16, CTX_REG(16)(a0)
	REG_L	$17, CTX_REG(17)(a0)
	REG_L	$18, CTX_REG(18)(a0)
	REG_L	$19, CTX_REG(19)(a0)
	REG_L	$20, CTX_REG(20)(a0)
	REG_L	$21, CTX_REG(21)(a0)
	REG_L	$22, CTX_REG(22)(a0)
	REG_L	$23, CTX_REG(23)(a0)
	REG_L	$24, CTX_REG(24)(a0)
	REG_L	$25, CTX_REG(25)(a0)

	/* Restore CP0 registers, kernel registers and stack with
	   interrupts disabled.  */
	di
	lw	$27, CTX_STATUS(a0)
	REG_L	$26, CTX_EPC(a0)
	mtc0	$27, C0_STATUS
	PTR_MTC0 $26, C0_EPC
	ehb

	REG_L	$26, CTX_REG(26)(a0)
	REG_L	$27, CTX_REG(27)(a0)
	REG_L	$28, CTX_REG(28)(a0)
	REG_L	$29, CTX_REG(29)(a0)
	REG_L	$30, CTX_REG(30)(a0)
	REG_L	$31, CTX_REG(31)(a0)

	/* Finally restore a0/$4.  */
	REG_L	$4, CTX_REG(4)(a0)

.endm
