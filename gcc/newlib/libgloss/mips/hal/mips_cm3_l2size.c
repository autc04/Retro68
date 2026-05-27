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

_MIPS_HAL_NOMIPS16
void __def_cache_size_hook (void);

/*
 * Routine for calculating L2 cache size from CM3 configuration
 * registers.  Sizing information is stored directly to memory. 
*/
void _MIPS_HAL_NOMIPS16
__cache_size_hook (void)
{
  unsigned long cm_gcr_base, cm_gcr_l2_config;
  int associ;

  /* 
   * Fall back to Config2 based L2 if Config3[M] or Config4[M]
   * or Config5[L2C] is not present.
  */
  if ((mips32_getconfig3 () & CFG3_M) == 0
      || (mips32_getconfig4 () & CFG4_M) == 0
      || (mips32_getconfig5 () & CFG5_L2C) == 0)
    {
      __def_cache_size_hook ();
      return;
    }

  /* Read CMGCRBase to find CMGCR_BASE_ADDR */
  cm_gcr_base = (mips_getcmgcrbase () << 4) | 0xB0000000UL;

  /* Read GCR_L2_CONFIG */
  cm_gcr_l2_config = * ((unsigned long *) (cm_gcr_base + GCR_L2_CONFIG));

  /* Extract line size */
  mips_scache_linesize = (cm_gcr_l2_config & GCR_L2_SL_MASK) >> GCR_L2_SL_SHIFT;

  /* Check for no cache */
  if (mips_scache_linesize == 0)
    return;
  
  /* Now have true L2 line size */
  mips_scache_linesize = 2 << mips_scache_linesize;

  /* Extract sets/way */
  mips_scache_ways = (cm_gcr_l2_config & GCR_L2_SS_MASK) >> GCR_L2_SS_SHIFT;

  /* Now we have true L2 sets/way */
  mips_scache_ways = 64 << mips_scache_ways;
  
  /* Extract L2 associativity */
  associ = (cm_gcr_l2_config & GCR_L2_SA_MASK) >> GCR_L2_SA_SHIFT;

  /* Get total number of sets */
  associ = (associ + 1) * mips_scache_ways;

  /* L2 cache size */
  mips_scache_size = mips_scache_linesize * associ;

  return;
}
