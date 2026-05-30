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

#include <mips/hal.h>
#include <stdint.h>
#include <stdbool.h>

/*
 * Use the macros themselves for idempotency to ease replacement at the OS
 * level.
 */
#ifndef _mips_intpatch
/*
 * Install a handler into the template vector code by patching the address
 * calculation instructions.  The INDEX is the interrupt number with SW0
 * being index 0 and HW5 being index 7, this also applies to EIC vectors
 * where the INDEX represents the vector number.  K1_TO_KSCRATCH1 should be
 * set if an instruction should be injected to move K1 to KSCRATCH1 before
 * clobbering it.
 */
_MIPS_HAL_NOMIPS16
void _mips_intpatch (const reg_t index, const uintptr_t handler,
		     bool k1_to_kscratch1);
#endif /* _mips_intpatch */

#ifndef _mips_intmask
/*
 * Enable or disable an interrupt at INDEX where INDEX has the same meaning
 * as in _mips_intpatch.  Returns nonzero if the interrupt was already
 * enabled.
 */
_MIPS_HAL_NOMIPS16
reg_t _mips_intmask (const reg_t index, const reg_t enable);
#endif /* _mips_intmask */

#ifndef _mips_intack
/*
 * Acknowledge (clear) an interrupt at INDEX where INDEX has the same meaning
 * as in _mips_intpatch.  Returns nonzero if the interrupt needed
 * acknowledging.
 */
_MIPS_HAL_NOMIPS16
reg_t _mips_intack (const reg_t index);
#endif /* _mips_intack */
