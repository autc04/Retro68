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
#include <mips/hal.h>

/* Writes hi, lo0, lo1 and mask into the TLB entry specified by index */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
m64_tlbwi2 (tlbhi64_t hi, tlblo64_t lo0, tlblo64_t lo1,
	    unsigned long long mask,
	    int index)
{
  mips64_setentryhi (hi);
  mips64_setentrylo0 (lo0);
  mips64_setentrylo1 (lo1);
  mips64_setpagemask (mask);
  mips64_setindex (index);
  mips_ehb ();
  mips_tlbwi ();
  return;
}

/* 
 * Writes hi, lo0, lo1 and mask into the TLB entry specified by the
 * Random register.
*/
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
m64_tlbwr2 (tlbhi64_t hi, tlblo64_t lo0, tlblo64_t lo1,
	    unsigned long long mask)
{
  mips64_setentryhi (hi);
  mips64_setentrylo0 (lo0);
  mips64_setentrylo1 (lo1);
  mips64_setpagemask (mask);
  mips_ehb ();
  mips_tlbwr ();
  return;
}

/* 
 * Probes the TLB for an entry matching hi and if present rewrites that entry,
 * otherwise updates a random entry. A safe way to update the TLB.
*/
int __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
m64_tlbrwr2 (tlbhi64_t hi, tlblo64_t lo0, tlblo64_t lo1,
	     unsigned long long mask)
{
  tlbhi64_t prev_hi;
  int index;

  prev_hi = mips64_getentryhi ();
  mips64_setentryhi (hi);

  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbp ();
  mips_ehb ();	/* tlbp hazard on mfc0 */

  index = mips64_getindex ();

  mips64_setentrylo0 (lo0);
  mips64_setentrylo1 (lo1);
  mips64_setpagemask (mask);

  mips_ehb ();	/* mtc0 hazard on tlbwi/tlbwr */

  if (index < 0)
    mips_tlbwr ();
  else
    mips_tlbwi ();

  mips64_setentryhi (prev_hi);

  return index;
}

/*
 * Reads the TLB entry specified index, and returns the EntryHi,
 * EntryLo0, EntryLo1 and PageMask parts in *phi, *plo0, *plo1 and *pmask
 * respectively.
*/
void _MIPS_HAL_NOMIPS16
m64_tlbri2 (tlbhi64_t *phi, tlblo64_t *plo0, tlblo64_t *plo1,
	    unsigned long long *pmask, int index)
{
  mips64_setindex (index);
  mips_ehb ();	/* mtc0 hazard on tlbr */
  mips_tlbr ();
  mips_ehb ();	/* tlbr hazard on mfc0 */
  *phi = mips64_getentryhi ();
  *plo0 = mips64_getentrylo0 ();
  *plo1 = mips64_getentrylo1 ();
  *pmask = mips64_getpagemask ();
  return;
}

/* 
 * Probes the TLB for an entry matching hi and returns its index, or -1 if
 * not found. If found, then the EntryLo0, EntryLo1 and PageMask parts of the
 * entry are also returned in *plo0, *plo1 and *pmask respectively.
*/
int __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
m64_tlbprobe2 (tlbhi64_t hi, tlblo64_t *plo0, tlblo64_t *plo1,
	       unsigned long long *pmask)
{
  tlbhi64_t prev_hi;
  int index;

  prev_hi = mips64_getentryhi ();
  mips64_setentryhi (hi);

  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbp ();
  mips_ehb ();	/* tlbp hazard on mfc0 */

  index = mips64_getindex ();

  if (index >= 0)
    {
      mips_tlbr ();
      mips_ehb ();	/* tlbr hazard on mfc0 */
      *plo0 = mips64_getentrylo0 ();
      *plo1 = mips64_getentrylo1 ();
      *pmask = mips64_getpagemask ();
    }
  else
    index = -1;

  mips64_setentryhi (prev_hi);

  return index;
}

/* Probes the TLB for an entry matching hi, and if present invalidates it */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
m64_tlbinval (tlbhi64_t hi)
{
  int index, tmp_idx;
  tlbhi64_t prev_hi, tmp_hi;
  register const unsigned long zero = 0;
  unsigned long cfg;

  prev_hi = mips64_getentryhi ();
  mips64_setentryhi (hi);

  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbp ();
  mips_ehb ();	/* tlbp hazard on mfc0 */

  index = mips64_getindex ();

  if (index < 0)
    goto restore;

  mips64_setentrylo0 (zero);
  mips64_setentrylo1 (zero);

  /* Check if Config4 is implemented */
  cfg = mips64_getconfig3 ();
  if ((cfg & CFG3_M) != 0)
    {
      cfg = mips64_getconfig4 ();
      if ((cfg & CFG4_IE_MASK) != 0)
	{
	  tmp_hi = C0_ENTRYHI_EHINV_MASK;
	  goto do_tlbwi;
	}
    }

  tmp_hi = (tlbhi64_t) ((unsigned long) KSEG0_BASE - 0x4000);

  do
    {
      tmp_hi = tmp_hi + 0x4000;
      mips64_setentryhi (tmp_hi);
      mips_ehb ();		/* mtc0 hazard on tlbp */
      mips_tlbp ();
      mips_ehb ();		/* tlbp hazard on mfc0 */
      tmp_idx = mips64_getindex ();
    }
  while (tmp_idx >= 0);

  mips64_setindex (index);	/* restore Index */

do_tlbwi:
  mips64_setentryhi (tmp_hi);
  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbwi ();
  mips_ehb ();	/* tlbwi hazard on mfc0 */

restore:
  mips64_setentryhi (prev_hi); /* restore EntryHi */

  return;
}
