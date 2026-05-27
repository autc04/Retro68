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

/*  
 * The MIPS32 cache architecture does support per-line cache locking.
 * If you lock any cache lines, then don't call the mips_flush_cache
 * routine, because these will flush the locked data out of the cache
 * too; use only mips_clean_xcache routines.
*/

/* Load and lock a block of data into the D-cache */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_lock_dcache (vaddr_t data, size_t n)
{
  /* Calculate cache sizes */
  mips_size_cache ();

  /* If D-cache is present */
  if (mips_dcache_linesize > 0)
    mips_cache_op (data, n, mips_dcache_linesize, Fetch_Lock_D);
  
  mips_sync ();
  return;
}

/* Load and lock a block of instructions into the I-cache */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_lock_icache (vaddr_t code, size_t n)
{
  /* Calculate cache sizes */
  mips_size_cache ();

  /* If I-cache is present */
  if (mips_icache_linesize > 0)
    mips_cache_op (code, n, mips_icache_linesize, Fetch_Lock_I);
  
  mips_sync ();
  return;
}

/* Load and lock a block of data into the L2-cache */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_lock_scache (vaddr_t data, size_t n)
{
  /* Calculate cache sizes */
  mips_size_cache ();

  /* If L2-cache is present */
  if (mips_scache_linesize > 0)
    mips_cache_op (data, n, mips_scache_linesize, Fetch_Lock_S);
  
  mips_sync ();
  return;
}
