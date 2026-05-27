/*
 * Copyright (C) 2017-2018 MIPS Tech, LLC
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
#include <mips/hal.h>
#include <mips/intctrl.h>

#define  _mips_intpatch_kscratch1 0x00
#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ || defined (__mips_micromips)
# define  _mips_intpatch_isroff1  0x06
# define  _mips_intpatch_isroff2  0x0a
# define  _mips_intpatch_isroff3  0x12
# define  _mips_intpatch_isroff4  0x1a
#else
# define  _mips_intpatch_isroff1  0x04
# define  _mips_intpatch_isroff2  0x08
# define  _mips_intpatch_isroff3  0x10
# define  _mips_intpatch_isroff4  0x1c
#endif

extern void m32_sync_icache(unsigned kva, size_t n);

void _MIPS_HAL_NOMIPS16
_mips_intpatch (const reg_t index, uintptr_t handler, bool k1_to_kscratch1)
{
  extern void *__isr_vec_space;
  uint16_t *patch;
  uint32_t *patch32;
  uintptr_t isrbase = (uintptr_t) (mips32_getebase() & EBASE_BASE)
		      + 0x200 + (index * ((uintptr_t) &__isr_vec_space));
  if (k1_to_kscratch1)
    {
#ifdef __mips_micromips
      patch = (uint16_t *) (isrbase + _mips_intpatch_kscratch1);
      *(patch++) = 0x037f;
      *(patch) = 0x12fc;
#else
      patch32 = (uint32_t *) (isrbase + _mips_intpatch_kscratch1);
      *patch32 = 0x409bf802;
#endif
    }
#if SZPTR==4
  handler += (handler & 0x8000) << 1;
  patch = (uint16_t *) (isrbase + _mips_intpatch_isroff1);
  *patch = (uint16_t) (handler >> 16);		/* %hi */
  patch = (uint16_t *) (isrbase + _mips_intpatch_isroff2);
  *patch = (uint16_t) (handler & 0xffff);	/* %lo */
  m32_sync_icache (isrbase, 32);
#elif SZPTR==8
  handler += (handler & 0x800080008000) << 1;
  patch = (uint16_t *) (isrbase + _mips_intpatch_isroff1);
  *patch = (uint16_t) (handler >> 48);			/* %highest */
  patch = (uint16_t *) (isrbase + _mips_intpatch_isroff2);
  *patch = (uint16_t) ((handler >> 32) & 0xffff);	/* %higher */
  patch = (uint16_t *) (isrbase + _mips_intpatch_isroff3);
  *patch = (uint16_t) ((handler >> 16) & 0xffff);	/* %hi */
  patch = (uint16_t *) (isrbase + _mips_intpatch_isroff4);
  *patch = (uint16_t) (handler & 0xffff);		/* %lo */
  m32_sync_icache (isrbase, 64);
#else
# error "Unknown pointer size"
#endif
}

/*
 * Interrupt masking and acknowledging functions - these are weak so they can
 * be replaced with versions that understand more complex interrupt models.
 */

reg_t __attribute__ ((weak)) _MIPS_HAL_NOMIPS16
_mips_intmask (const reg_t index, const reg_t enable)
{
  register reg_t enbefore, valbefore = 0, indexedbit;

  /*
   * Calculate which bit upfront to minimise critical section.
   * Note that this function supports the MCU ASE, unlike the .h files.
   */
  if ((index >= 0) && (index <= 8))
    /* Traditional/1st MCU ASE interrupt.  */
    indexedbit = SR_IM0 << index;
  else if (index == 9)
    /* 2nd MCU ASE interrupt.  */
    indexedbit = SR_IM7 << 2;

  /* Make sure we can safely adjust the mask.  */
  enbefore = _mips_intdisable ();

  /* Make the change.  */
  valbefore = mips32_bcssr (indexedbit, enable ? indexedbit : 0);

  /* Go live again.  */
  _mips_intrestore (enbefore);

  /* Return true if it was enabled, again outside critical section.  */
  return (valbefore & indexedbit) != 0;
}

reg_t __attribute__ ((weak)) _MIPS_HAL_NOMIPS16
_mips_intack (const reg_t index)
{
  reg_t enbefore, indexedbit;
  reg_t valbefore = 0;

  /* We only handle software interrupts - bail out otherwise.  */
  if ((index < 0) && (index > 1))
    return 0;

  /* Calculate which bit upfront to minimise critical section.  */
  indexedbit = CR_IP0 << index;

  /* Make sure we can safely adjust the state.  */
  enbefore = _mips_intdisable ();

  /* Make the change. */
  valbefore = mips32_bicsr (indexedbit);

  /* Go live again.  */
  _mips_intrestore (enbefore);

  /* Return true if it was enabled, again outside critical section.  */
  return (valbefore & indexedbit) != 0;
}
