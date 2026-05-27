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

#include "cache.h"
#include <mips/uhi_syscalls.h>

static void __attribute__ ((noreturn)) _MIPS_HAL_NOMIPS16
__boot_fail (void)
{
  register long arg1 asm ("$4") = __MIPS_UHI_BF_CACHE;	/* L2 cache configuration error */
  register long op asm ("$25") = __MIPS_UHI_BOOTFAIL;
  register long ret asm ("$2") = __MIPS_UHI_SYSCALL_NUM;

  __asm__ volatile (" # %0 = bootfail(%0, %1) op=%2\n"
		    SYSCALL (__MIPS_UHI_SYSCALL_NUM)
		    : "+r" (ret)
		    : "r" (arg1), "r" (op));

  __boot_fail ();
}

/*
 * Internal routine to determine cache sizes by looking at config
 * registers.  Sizing information is stored directly to memory.
*/
void _MIPS_HAL_NOMIPS16
__def_cache_size_hook (void)
{
  /* 
   * Fall back to Config2 based L2 if Config3[M] or Config4[M]
   * or Config5[L2C] is not present.
  */
  if ((mips32_getconfig3 () & CFG3_M) == 0
      || (mips32_getconfig4 () & CFG4_M) == 0
      || (mips32_getconfig5 () & CFG5_L2C) == 0)
    {
      unsigned int cfg, tmp1, tmp2;

      cfg = mips32_getconfig2 ();

      /* Get S-cache line size (log2) */
      tmp1 = (cfg & CFG2_SL_MASK) >> CFG2_SL_SHIFT;
      if (tmp1 == 0)
	return;	/* No S-cache */

      tmp1++;

      /* Get number of S-cache ways */
      mips_scache_ways = ((cfg & CFG2_SA_MASK) >> CFG2_SA_SHIFT) + 1;

      /* Total scache size = lines/way * linesize * ways */
      mips_scache_linesize = 1 << tmp1;
      tmp2 = mips_scache_ways << tmp1;

      /* Get scache lines per way */
      tmp1 = ((cfg & CFG2_SS_MASK) >> CFG2_SS_SHIFT) + 6;
      mips_scache_size = tmp2 << tmp1;

      return;
    }

  /*
   * No CM3 code supplied but we have a memory mapped L2 config.
   * Report a boot failure through UHI.
  */
  __boot_fail ();
}

void __cache_size_hook (void) __attribute__ ((weak, alias ("__def_cache_size_hook")));
