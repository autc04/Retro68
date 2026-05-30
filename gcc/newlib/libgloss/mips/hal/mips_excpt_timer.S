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

#include <mips/cpu.h>
#include <mips/asm.h>

MIPS_NOMIPS16

EXPORTS(_count_wrap, 4)
	.word	0x0

#
# FUNCTION:
#
# DESCRIPTION:
#
LEAF(mips_start_minimal_counter)
	di	$8
	ehb
	ori	$8, $8, SR_HINT5
	ori	$8, $8, SR_IE
	LA	$9, _count_wrap
	sw	$0, 0($9)
	li	$9, 1
	mtc0	$9, C0_COUNT
	mtc0	$0, C0_COMPARE
	mtc0	$8, C0_SR
	ehb
	jr	$31
END(mips_start_minimal_counter)

LEAF(_mips_isr_sw0)
	.set push
	.set noreorder
	.set noat
	LA	$k0, _count_wrap
	lw	$k1, 0($k0)
	addiu	$k1, $k1, 1
	sw	$k1, 0($k0)
	mtc0	$0, C0_COMPARE
	eret
	.set pop
END(_mips_isr_sw0)

LEAF(_mips_interrupt)
	.set push
	.set noreorder
	.set noat
	LA	$k0, _count_wrap
	lw	$k1, 0($k0)
	addiu	$k1, $k1, 1
	sw	$k1, 0($k0)
	mtc0	$0, C0_COMPARE
	eret
	.set pop
END(_mips_interrupt)

LEAF(mips_stop_minimal_counter)
	LA	$11, _count_wrap
	mfc0	$9, C0_COUNT
	di	$8
	ehb
	lw	$11, 0($11)
	li	$12, ~SR_HINT5
	and	$8, $8, $12
	mfc0	$10, C0_COUNT
	sltu	$9, $10, $9
	ori	$8, $8, SR_IE
	beqz	$9, 1f
	addiu	$11, $11, 1
1:
	sw	$11, 0($4)
	sw	$10, 0($5)
	mtc0	$8, C0_SR
	jr	$31
END(mips_stop_minimal_counter)
