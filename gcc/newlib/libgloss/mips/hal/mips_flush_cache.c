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

/* Writeback and invalidate all caches */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_flush_cache (void)
{
  /* Calculate cache sizes */
  mips_size_cache ();

  /* If D-cache is present */
  if (mips_dcache_size > 0)
    mips_cache_op ((vaddr_t) KSEG0_BASE, mips_dcache_size,
		   mips_dcache_linesize, Index_Writeback_Inv_D);

  /* If I-cache is present */
  if (mips_icache_size > 0)
    mips_cache_op ((vaddr_t) KSEG0_BASE, mips_icache_size,
		   mips_icache_linesize, Index_Invalidate_I);

  /* If L2-cache is present */
  if (mips_scache_size > 0)
    {
      mips_sync ();
      mips_cache_op ((vaddr_t) KSEG0_BASE, mips_scache_size,
		     mips_scache_linesize, Index_Writeback_Inv_S);
    }

  mips_sync ();
  return;
}

/* Writeback and invalidate D-cache */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_flush_dcache (void)
{
  /* Calculate cache sizes */
  mips_size_cache ();

  /* If D-cache is present */
  if (mips_dcache_size > 0)
    mips_cache_op ((vaddr_t) KSEG0_BASE, mips_dcache_size,
		   mips_dcache_linesize, Index_Writeback_Inv_D);

  /* If L2-cache is present */
  if (mips_scache_size > 0)
    {
      mips_sync ();
      mips_cache_op ((vaddr_t) KSEG0_BASE, mips_scache_size,
		     mips_scache_linesize, Index_Writeback_Inv_S);
    }

  mips_sync ();
  return;
}

/* Writeback and invalidate I-cache */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_flush_icache (void)
{
  /* Calculate cache sizes */
  mips_size_cache ();

  /* If I-cache is present */
  if (mips_icache_size > 0)
    mips_cache_op ((vaddr_t) KSEG0_BASE, mips_icache_size,
		   mips_icache_linesize, Index_Invalidate_I);

  /* If L2-cache is present */
  if (mips_scache_size > 0)
    {
      mips_sync ();
      mips_cache_op ((vaddr_t) KSEG0_BASE, mips_scache_size,
		     mips_scache_linesize, Index_Writeback_Inv_S);
    }

  mips_sync ();
  return;
}
