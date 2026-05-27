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

#include <mips/regdef.h>
#include <mips/cpu.h>
#include <mips/asm.h>
#include <mips/hal.h>

MIPS_NOMIPS16

	# Create space to store k0, k1, ra and sp
	.data
	.global	__start_ctx
	.balign	SZREG
__start_ctx:
	.space	SZREG * 18
#define	start_ctx_sr	(SZREG * 0)
#define	start_ctx_s0	(SZREG * 1)
#define	start_ctx_s1	(SZREG * 2)
#define	start_ctx_s2	(SZREG * 3)
#define	start_ctx_s3	(SZREG * 4)
#define	start_ctx_s4	(SZREG * 5)
#define	start_ctx_s5	(SZREG * 6)
#define	start_ctx_s6	(SZREG * 7)
#define	start_ctx_s7	(SZREG * 8)
#define	start_ctx_k0	(SZREG * 9)
#define	start_ctx_k1	(SZREG * 10)
#define	start_ctx_gp	(SZREG * 11)
#define	start_ctx_sp	(SZREG * 12)
#define	start_ctx_fp	(SZREG * 13)
#define	start_ctx_ra	(SZREG * 14)
#define	start_ctx_ictl	(SZREG * 15)
#define	start_ctx_ebase	(SZREG * 16)	/* saved EBASE */
#define	chain_ebase	(SZREG * 17)	/* chained EBASE */

#if defined (__mips_micromips)
	.space	SZREG
#define	start_ctx_conf3	(SZREG * 18)	/* saved Config3 $16,3 for micromips */
#endif

#
# FUNCTION:	void* __register_excpt_boot (void*, int, void*)
#
# DESCRIPTION: Save all boot state. Some state is already clobbered but passed
#	       in as arguments:
#              a0 = Boot ra
#	       a1 = Boot SR
#	       a2 = caller's RA (to be returned back)
#
WLEAF(__register_excpt_boot)
	.set	push
	.set	noat

	/* Save C0_SR IE and BEV */
	LA	t1, __start_ctx
	REG_S	a0, start_ctx_ra(t1)
	REG_S	a1, start_ctx_sr(t1)

	REG_S	s0, start_ctx_s0(t1)
	REG_S	s1, start_ctx_s1(t1)
	REG_S	s2, start_ctx_s2(t1)
	REG_S	s3, start_ctx_s3(t1)
	REG_S	s4, start_ctx_s4(t1)
	REG_S	s5, start_ctx_s5(t1)
	REG_S	s6, start_ctx_s6(t1)
	REG_S	s7, start_ctx_s7(t1)
	REG_S	k0, start_ctx_k0(t1)
	REG_S	k1, start_ctx_k1(t1)
	REG_S	gp, start_ctx_gp(t1)
	REG_S	sp, start_ctx_sp(t1)
	REG_S	fp, start_ctx_fp(t1)

#if defined (__mips_micromips)
	/* Save Config3 */
	mfc0	t0, C0_CONFIG3
	REG_S	t0, start_ctx_conf3(t1)
#endif
	mfc0	t0, C0_INTCTL
	REG_S	t0, start_ctx_ictl(t1)

	/* Save C0_EBASE */
	PTR_MFC0 t2, C0_EBASE
	REG_S	t2, start_ctx_ebase(t1)

	/* Check if we booted with BEV==1 */
	ext	t3, a1, SR_BEV_SHIFT, 1
	beqz	t3, 1f

	/*
	 * BEV==0 - set chain_ebase to 0xbfc00200
	 * Apply the offset of 0x200 so that the boot vector entries line up
	 * with the offsets in a non-boot vectora.
	 */
	li	t2, 0xbfc00200

	/* No - set chain_ebase to C0_EBASE */
1:	REG_S	t2, chain_ebase(t1)

	/* Return the third argument */
	move	va0, a2
	jr	ra

	.set	pop
WEND(__register_excpt_boot)

#
# FUNCTION:	int __return_to_boot (int)
#
# DESCRIPTION: This is used if UHI EXIT was not handled. Return back to
#	       caller of _start.
#	       a0 = exit code to return to caller
#
WLEAF(__return_to_boot)
	.set	push
	.set	noat
	/* Disable interrupts for safety */
	di
	ehb
	/* Set BEV=1 to allow changing EBASE */
	mfc0	t0, C0_SR
	li	t1, SR_BEV
	or	t0, t0, t1
	mtc0	t0, C0_SR
	ehb

	/* Restore C0_EBASE */
	LA	t0, __start_ctx
	REG_L	t0, start_ctx_ebase(t0)
	/* Set the write gate to potentially change upper bits */
	ori	t1, t0, EBASE_WG
	PTR_MTC0 t1, C0_EBASE
	ehb
	/* Check if the write gate was set on startup */
	andi	t1, t0, EBASE_WG
	bnez	t1, 1f

	/* If write gate wasn't set then clear the write gate again */
	PTR_MTC0 t0, C0_EBASE
	ehb

1:	/* Restore original state */
	LA	t0, __start_ctx
	REG_L	s0, start_ctx_s0(t0)
	REG_L	s1, start_ctx_s1(t0)
	REG_L	s2, start_ctx_s2(t0)
	REG_L	s3, start_ctx_s3(t0)
	REG_L	s4, start_ctx_s4(t0)
	REG_L	s5, start_ctx_s5(t0)
	REG_L	s6, start_ctx_s6(t0)
	REG_L	s7, start_ctx_s7(t0)
	REG_L	k0, start_ctx_k0(t0)
	REG_L	k1, start_ctx_k1(t0)
	REG_L	gp, start_ctx_gp(t0)
	REG_L	sp, start_ctx_sp(t0)
	REG_L	fp, start_ctx_fp(t0)
	REG_L	ra, start_ctx_ra(t0)

#if defined (__mips_micromips)
	/* Restore Config3 */
	REG_L	t1, start_ctx_conf3(t0)
	mtc0	t1, C0_CONFIG3
#endif
	/* Restore IntCtl */
	REG_L	t1, start_ctx_ictl(t0)
	mtc0	t1, C0_INTCTL

	REG_L	t0, start_ctx_sr(t0)

	/* Restore C0_STATUS IE and BEV to boot value */
	mtc0	t0, C0_SR
	mtc0	zero, C0_CAUSE

	/* Return with exit code */
	move	va0, a0
	MIPS_JRHB(ra)
	.set	pop
WEND(__return_to_boot)

#
# FUNCTION:	void __chain_uhi_excpt (struct gpctx *);
#
# DESCRIPTION: Transfer to the exception handler in the boot environment.
#	       a0 == pointer to the context to restore
#
WLEAF(__chain_uhi_excpt)
	.set	push
	.set	noat

	/*
	 * Move context pointer into position.  Use $3 as scratch
	 * as it is the only register that is clobbered by all
	 * UHI calls and is not used as an input.
	 */
	move	r3, a0

#if (__mips_isa_rev < 6)
	REG_L	t0, CTX_HI0(r3)
	REG_L	t1, CTX_LO0(r3)
	mthi	t0
	mtlo	t1
#endif

	lw	t0, CTX_STATUS(r3)
	mtc0	t0, C0_SR
	REG_L	t0, CTX_EPC(r3)
	PTR_MTC0 t0, C0_EPC
	ehb

	/* Restore the common context */
	REG_L	r1, CTX_REG(1)(r3)
	REG_L	r2, CTX_REG(2)(r3)
	REG_L	r4, CTX_REG(4)(r3)
	REG_L	r5, CTX_REG(5)(r3)
	REG_L	r6, CTX_REG(6)(r3)
	REG_L	r7, CTX_REG(7)(r3)
	REG_L	r8, CTX_REG(8)(r3)
	REG_L	r9, CTX_REG(9)(r3)
	REG_L	r10, CTX_REG(10)(r3)
	REG_L	r11, CTX_REG(11)(r3)
	REG_L	r12, CTX_REG(12)(r3)
	REG_L	r13, CTX_REG(13)(r3)
	REG_L	r14, CTX_REG(14)(r3)
	REG_L	r15, CTX_REG(15)(r3)
	REG_L	r16, CTX_REG(16)(r3)
	REG_L	r17, CTX_REG(17)(r3)
	REG_L	r18, CTX_REG(18)(r3)
	REG_L	r19, CTX_REG(19)(r3)
	REG_L	r20, CTX_REG(20)(r3)
	REG_L	r21, CTX_REG(21)(r3)
	REG_L	r22, CTX_REG(22)(r3)
	REG_L	r23, CTX_REG(23)(r3)
	REG_L	r24, CTX_REG(24)(r3)
	REG_L	r25, CTX_REG(25)(r3)
	REG_L	r28, CTX_REG(28)(r3)
	REG_L	r29, CTX_REG(29)(r3)
	REG_L	r30, CTX_REG(30)(r3)
	REG_L	r31, CTX_REG(31)(r3)

	/* Restore chained exception handlers kernel regs */
	LA	r3, __start_ctx
	REG_L	k0, start_ctx_k0(r3)
	REG_L	k1, start_ctx_k1(r3)

#if defined (__mips_micromips)
	/* OR the address with Config3.ISAOnExc bit */
	REG_L	r3, start_ctx_conf3(r3)
	ext	r3, r3, CFG3_IOE_SHIFT, 1
	beqz	r3, 1f

	/* Compute exception vector */
	LA	r3, __start_ctx
	REG_L	r3, chain_ebase(r3)
	PTR_ADDU r3, r3, 0x181		# OR ISAOnExc bit

	/* Chain */
	jr	r3
1:
	/* Compute exception vector */
	LA	r3, __start_ctx
#endif

	REG_L	r3, chain_ebase(r3)
	PTR_ADDU r3, r3, 0x180

	/* Chain */
	jr	r3

	.set	pop
WEND(__chain_uhi_excpt)

#
# FUNCTION:	int __get_startup_BEV (void)
#
# DESCRIPTION: Return value of BEV flag saved in __register_excpt_handler.
#
WLEAF(__get_startup_BEV)
	.set	push
	.set	noat

	LA	t0, __start_ctx
	REG_L	va0, start_ctx_sr(t0)
	li	t1, SR_BEV
	and	va0, va0, t1
	jr	ra

	.set	pop
WEND(__get_startup_BEV)


EXPORTS(__MIPS_UHI_BAD_POINTER, 32)
	.ascii "UHI: BAD POINTER\000"

#
# FUNCTION: __convert_argv_pointers (int, char*[], char*[])
#
# DESCRIPTION: Convert 64-bit pointers to 32-bit.  This allocates the new
#	       argument structure on the stack and verifies all pointers are
#	       canonical for a 32-bit address space.
#
#if _MIPS_SIM==_ABIO32 || _MIPS_SIM==_ABIN32
WLEAF(__convert_argv_pointers)
	/* Early out if a0 <= 0 */
	blez	a0, .Lend

	/* Verify we came from 64-bit mode */
	LA      t0, __start_ctx
	REG_L   t0, start_ctx_sr(t0)
	ext	t1, t0, SR_KX_SHIFT, 1
	beqz	t1, .Lend

	/* Set up stack pointer */
	move	t0, a0
	sll	t1, t0, 2
	/* Round to stack alignment */
	addiu   t1, t1, ALSZ
	and     t1, t1, ALMASK

	PTR_SUBU sp, sp, t1
	move	t2, sp
	move	t3, a1
	li	t1, -1

.Lloop:
#if BYTE_ORDER == LITTLE_ENDIAN
	lw	t8, 0(t3)
	lw	t9, 4(t3)
#elif BYTE_ORDER == BIG_ENDIAN
	lw	t9, 0(t3)
	lw	t8, 4(t3)
#else
#error BYTE_ORDER
#endif
	/* if s1 != 0 && s1 != 0xFFFFFFFF */
	beqz	t9, .LGoodp
	beq	t9, t1, .LGoodp
	/* Overwrite bad pointer with stock bad value */
	LA	t8, __MIPS_UHI_BAD_POINTER
.LGoodp:
	sw	t8, 0(t2)

	PTR_ADDU t2, t2, 4
	PTR_ADDU t3, t3, 8
	addiu	t0, t0, -1
	bnez	t0, .Lloop

	move	a1, sp
	PTR_SUBU sp, sp, (NARGSAVE*SZARG)

	move	a2, zero
.Lend:
	jr	ra
WEND(__convert_argv_pointers)
#endif /* ABI TEST */
