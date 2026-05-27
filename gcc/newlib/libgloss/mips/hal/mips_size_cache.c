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

int mips_icache_size = -1;
int mips_icache_linesize = -1;
int mips_icache_ways = 1;

int mips_dcache_size = -1;
int mips_dcache_linesize = -1;
int mips_dcache_ways = 1;

int mips_scache_size = -1;
int mips_scache_linesize = -1;
int mips_scache_ways = 1;

int mips_tcache_size = -1;
int mips_tcache_linesize = -1;
int mips_tcache_ways = 1;

extern void __cache_size_hook (void);

/*
 * Size caches without reinitialising and losing dirty cache lines.
 * Update mips_icache_* and mips_dcache_* global variables.
*/
void _MIPS_HAL_NOMIPS16
mips_size_cache (void)
{
  int lsize, ways;
  unsigned int cfg;

  /* Return if sizes are already known */
  if (mips_icache_size > 0)
    return;

  /* Check presence of Config1 */
  cfg = mips32_getconfig0 ();
  if ((cfg & CFG0_M))
    {
      /* Check if I-cache is present */
      cfg = mips32_getconfig1 ();
      lsize = (cfg & CFG1_IL_MASK) >> CFG1_IL_SHIFT;
      if (lsize)
	{
	  lsize++;

	  /* Get number of I-cache ways */
	  ways = ((cfg & CFG1_IA_MASK) >> CFG1_IA_SHIFT) + 1;
	  mips_icache_ways = ways;
	  mips_icache_linesize = 1 << lsize;
	  ways = ways << lsize;

	  /* Get I-cache lines per way */
	  lsize = ((((cfg & CFG1_IS_MASK) >> CFG1_IS_SHIFT) + 1) & 7) + 5;
	  mips_icache_size = ways << lsize;
	}

      /* Check if D-cache is present */
      lsize = (cfg & CFG1_DL_MASK) >> CFG1_DL_SHIFT;
      if (lsize)
	{
	  lsize++;

	  /* Get number of D-cache ways */
	  ways = ((cfg & CFG1_DA_MASK) >> CFG1_DA_SHIFT) + 1;
	  mips_dcache_ways = ways;
	  mips_dcache_linesize = 1 << lsize;
	  ways = ways << lsize;

	  /* Get D-cache lines per way */
	  lsize = ((((cfg & CFG1_DS_MASK) >> CFG1_DS_SHIFT) + 1) & 7) + 5;
	  mips_dcache_size = ways << lsize;
	}
    }

  __cache_size_hook ();

  return;
}
