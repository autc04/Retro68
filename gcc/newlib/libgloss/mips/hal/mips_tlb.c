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
#include <mips/m32tlb.h>

/* Writes hi, lo0, lo1 and mask into the TLB entry specified by index */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_tlbwi2 (tlbhi_t hi, tlblo_t lo0, tlblo_t lo1, unsigned int mask,
		  int index)
{
  mips32_setentryhi (hi);
  mips32_setentrylo0 (lo0);
  mips32_setentrylo1 (lo1);
  mips32_setpagemask (mask);
  mips32_setindex (index);
  mips_ehb ();
  mips_tlbwi ();
  return;
}

/* 
 * Writes hi, lo0, lo1 and mask into the TLB entry specified by the
 * random register.
*/
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_tlbwr2 (tlbhi_t hi, tlblo_t lo0, tlblo_t lo1, unsigned int mask)
{
  mips32_setentryhi (hi);
  mips32_setentrylo0 (lo0);
  mips32_setentrylo1 (lo1);
  mips32_setpagemask (mask);
  mips_ehb ();
  mips_tlbwr ();
  return;
}

/* 
 * Probes the TLB for an entry matching hi and if present rewrites that entry,
 * otherwise updates a random entry.  A safe way to update the TLB.
*/
int __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_tlbrwr2 (tlbhi_t hi, tlblo_t lo0, tlblo_t lo1, unsigned int mask)
{
  int index;
  tlbhi_t prev_hi;

  prev_hi = mips32_getentryhi ();
  mips32_setentryhi (hi);

  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbp ();
  mips_ehb ();	/* tlbp hazard on mfc0 */

  index = mips32_getindex ();
  mips32_setentrylo0 (lo0);
  mips32_setentrylo1 (lo1);
  mips32_setpagemask (mask);
  mips_ehb ();	/* mtc0 hazard on tlbwi/tlbwr */

  /* Check if entry matches */
  if (index >= 0)
    mips_tlbwi ();
  else
    mips_tlbwr ();

  mips32_setentryhi (prev_hi);

  return index;
}

/* 
 * Reads the TLB entry specified by index, and returns the EntryHi,
 * EntryLo0, EntryLo1 and PageMask parts in *phi, *plo0, *plo1 and *pmask
 * respectively.
*/
void _MIPS_HAL_NOMIPS16
mips_tlbri2 (tlbhi_t *phi, tlblo_t *plo0, tlblo_t *plo1,
	     unsigned int *pmask, int index)
{
  mips32_setindex (index);
  mips_ehb ();	/* mtc0 hazard on tlbr */
  mips_tlbr ();
  mips_ehb ();	/* tlbr hazard on mfc0 */
  *phi = mips32_getentryhi ();
  *plo0 = mips32_getentrylo0 ();
  *plo1 = mips32_getentrylo1 ();
  *pmask = mips32_getpagemask ();
  return;
}

/* 
 * Probes the TLB for an entry matching hi and return its index, or -1 if
 * not found. If found, the EntryLo0, EntryLo1 and PageMask parts of the
 * entry are also returned in *plo0, *plo1 and *pmask respectively.
*/
int __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_tlbprobe2 (tlbhi_t hi, tlblo_t *plo0, tlblo_t *plo1,
		unsigned int *pmask)
{
  int index;
  tlbhi_t prev_hi;

  prev_hi = mips32_getentryhi ();
  mips32_setentryhi (hi);

  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbp ();
  mips_ehb ();	/* tlbp hazard on mfc0 */

  index = mips32_getindex ();

  if (index >= 0)
    {
      mips_tlbr ();
      mips_ehb ();	/* tlbr hazard on mfc0 */
      *plo0 = mips32_getentrylo0 ();
      *plo1 = mips32_getentrylo1 ();
      *pmask = mips32_getpagemask ();
    }
  else
     index = -1;

  mips32_setentryhi (prev_hi); /* restore EntryHi */

  return index;
}

/* Probes the TLB for an entry matching hi, and if present invalidates it */
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_tlbinval (tlbhi_t hi)
{
  int index, tmp_idx;
  tlbhi_t prev_hi, tmp_hi = 0;
  register const int zero = 0;
  unsigned int cfg;

  prev_hi = mips32_getentryhi ();
  mips32_setentryhi (hi);

  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbp ();
  mips_ehb ();	/* tlbp hazard on mfc0 */

  index = mips32_getindex ();

  if (index < 0)
    goto restore;

  mips32_setentrylo0 (zero);
  mips32_setentrylo1 (zero);

  /* Check if Config4 is implemented */
  cfg = mips32_getconfig3 ();
  if ((cfg & CFG3_M) != 0)
    {
      cfg = mips32_getconfig4 ();
      if ((cfg & CFG4_IE_MASK) != 0)
	{
	  tmp_hi = C0_ENTRYHI_EHINV_MASK;
	  goto do_tlbwi;
	}
    }

  tmp_hi = (tlbhi_t) ((unsigned long) KSEG0_BASE - 0x4000);

  do
    {
      tmp_hi = tmp_hi + 0x4000;
      mips32_setentryhi (tmp_hi);
      mips_ehb ();		/* mtc0 hazard on tlbp */
      mips_tlbp ();
      mips_ehb ();		/* tlbp hazard on mfc0 */
      tmp_idx = mips32_getindex ();
    }
  while (tmp_idx >= 0);

  mips32_setindex (index);	/* restore Index */

do_tlbwi:
  mips32_setentryhi (tmp_hi);
  mips_ehb ();	/* mtc0 hazard on tlbp */
  mips_tlbwi ();
  mips_ehb ();	/* tlbwi hazard on mfc0 */

restore:
  mips32_setentryhi (prev_hi); /* restore EntryHi */

  return;
}

/* 
 * Return number of entries and sets in TLB.
 * Return number of entries in *pentries and 
 * sets in *psets
*/
static void _MIPS_HAL_NOMIPS16
mips_tlb_entries_sets (int *pentries, int *psets)
{
  int entries = 0, sets = 0, ways = 0;
  unsigned int cfg, cfg1, tcfg, tmp;

  cfg = mips32_getconfig ();
  cfg = (cfg & CFG0_MT_MASK) >> CFG0_MT_SHIFT;
  if ((cfg == 0) /* No MMU */
      || (cfg == (CFG0_MT_FIXED >> CFG0_MT_SHIFT)) /* fixed address translation */
      || (cfg == (CFG0_MT_BAT >> CFG0_MT_SHIFT)) /* block address translator */
      || ((cfg & ((CFG0_MT_TLB | CFG0_MT_DUAL) >> CFG0_MT_SHIFT)) == 0)) /* presence of TLB */
    {
      *pentries = 0;
      *psets = 0;
      return;
    }

  cfg1 = mips32_getconfig1 ();

  /* 
   * As per PRA, field holds number of entries - 1
   * Standard TLBs and dual TLBs have extension fields.
  */
  entries = ((cfg1 & CFG1_MMUS_MASK) >> CFG1_MMUSSHIFT) + 1;
  
  tcfg = mips32_getconfig3 ();
  if ((tcfg & CFG3_M) == 0)
    goto doReturn;

  tcfg = mips32_getconfig4 ();

#if (__mips_isa_rev < 6)
  tmp = (tcfg & CFG4_MMUED) >> CFG4_MMUED_SHIFT;

  /* MMU Extension Definition */
  if (tmp == (CFG4_MMUED_FTLBVEXT >> CFG4_MMUED_SHIFT))
    goto doFTLBVTLB;

  /* MMUSizeExt */
  if (tmp == (CFG4_MMUED_SIZEEXT >> CFG4_MMUED_SHIFT))
    goto doSizeExt;

  if (tmp == 0)
    goto doReturn;

  goto doFTLBSize;

doSizeExt:
  entries += ((tcfg & CFG4_MMUSE_MASK) >> CFG4_MMUSE_SHIFT)
	      << CFG1_MMUS_BITS;
  goto doReturn;
#endif

doFTLBVTLB:
  entries += ((tcfg & CFG4_VTLBSEXT_MASK) >> CFG4_VTLBSEXT_SHIFT)
	      << CFG1_MMUS_BITS;

doFTLBSize:
  /* Skip FTLB size calculations if Config:MT != 4 */
  if (cfg != (CFG0_MT_DUAL >> CFG0_MT_SHIFT))
    goto doReturn;

  /* Ways */
  ways = 2 + ((tcfg & CFG4_FTLBW_MASK) >> CFG4_FTLBW_SHIFT);

  /* Sets per way */
  tmp = ((tcfg & CFG4_FTLBS_MASK) >> CFG4_FTLBS_SHIFT);
  sets = 1 << tmp;

  /* Total sets */
  entries += ways << tmp;

doReturn:
  *pentries = entries;
  *psets = sets;

  return;
}

/* 
 * Return number of entries in TLB
 * This function is used for both mips64 and mips32 
*/
int _MIPS_HAL_NOMIPS16
mips_tlb_size (void)
{
  int entries = 0, sets = 0;
  mips_tlb_entries_sets (&entries, &sets);
  (void) sets;
  return entries;
}

/* 
 * Invalidate the whole TLB.
 * This function is used for both mips64 and mips32 
*/
void __attribute__ ((use_hazard_barrier_return)) _MIPS_HAL_NOMIPS16
mips_tlbinvalall (void)
{
  unsigned int cfg0, cfg;
  unsigned long tmp_hi, tmp_hi2;
  int entries = 0, sets = 0, tlb_stride = 0;
  int end_ptr = 0, index = 0;
  register const unsigned long zero = 0;
  extern void *__tlb_stride_length;

  cfg0 = mips32_getconfig ();
  cfg0 = (cfg0 & CFG0_MT_MASK) >> CFG0_MT_SHIFT;
  if ((cfg0 == 0) /* No MMU */
      || (cfg0 == (CFG0_MT_FIXED >> CFG0_MT_SHIFT)) /* fixed address translation */
      || (cfg0 == (CFG0_MT_BAT >> CFG0_MT_SHIFT))) /* block address translator */
    goto doReturn;

  mips_setentrylo0 (zero);
  mips_setentrylo1 (zero);
  mips_setpagemask (zero);

  /* Fetch size & number of sets */
  mips_tlb_entries_sets (&entries, &sets);

  cfg = mips32_getconfig3 ();
  if ((cfg & CFG3_M) == 0)
    goto doBasicInval;

  cfg = mips32_getconfig4 ();
  cfg = (cfg & CFG4_IE_MASK) >> CFG4_IE_SHIFT;

  /* If Config4[IE] = 0, use old method for invalidation */
  if (cfg == 0)
    goto doBasicInval;

  /* If Config4[IE] = 1, EHINV loop */
  if (cfg == (CFG4_IE_EHINV >> CFG4_IE_SHIFT))
    goto doEHINV;

  /* If Config[MT] = 1, one instruction required */
  if (cfg0 == (CFG0_MT_TLB >> CFG0_MT_SHIFT)
      || cfg == (CFG4_IE_INVALL >> CFG4_IE_SHIFT))
    {
      /* TLB walk done by hardware, Config4[IE] = 3 or Config[MT] = 1 */
      mips32_setindex (zero);
      mips_ehb ();
      mips_eva_tlbinvf ();
      goto doReturn;
    }

  /* 
   * TLB walk done by software, Config4[IE] = 2, Config[MT] = 4
   *
   * One TLBINVF is executed with an index in VTLB range to
   * invalidate all VTLB entries.
   *
   * One TLBINVF is executed per FTLB set.
   *
   * We'll clean out the TLB by computing the Size of the VTLB
   * but not add the 1. This will give us a finger that points
   * at the last VTLB entry.
  */

  /* Clear VTLB */
  mips32_setindex (zero);
  mips_ehb ();
  mips_eva_tlbinvf ();

  tlb_stride = (int) ((unsigned long) &__tlb_stride_length);
  sets = sets * tlb_stride;
  end_ptr = entries - sets;

  do
    {
      entries = entries - tlb_stride;
      mips32_setindex (entries);
      mips_ehb ();
      mips_eva_tlbinvf ();
    }
  while (entries != end_ptr);

  goto doReturn;

doEHINV:
  /*
   * Config4[IE] = 1. EHINV supported, but not tlbinvf.
   *
   * Invalidate the TLB for R3 onwards by loading EHINV and writing to all
   * TLB entries.
  */
  index = 0;
  tmp_hi = C0_ENTRYHI_EHINV_MASK;
  mips_setentryhi (tmp_hi);
  do
    {
      mips32_setindex (index);
      mips_ehb ();		/* mtc0 hazard on tlbwi */
      mips_tlbwi ();
      index++;
    }
  while (entries != index);

  goto doReturn;

doBasicInval:
  /* 
   * Perform a basic invalidation of the TLB for R1 onwards by loading
   * 0x(FFFFFFFF)KSEG0_BASE into EntryHi and writing it into index 0
   * incrementing by a pagesize, writing into index 1, etc.
   * If large physical addressing is enabled, load 0xFFFFFFFF
   * into the top half of EntryHi.
  */
  tmp_hi = 0;
  cfg = mips32_getconfig3 ();

  /* If XPA is present */
  if ((cfg & CFG3_LPA) != 0)
    {
      cfg = mips32_getpagegrain ();
      if ((cfg & PAGEGRAIN_ELPA) == 0)
	tmp_hi = 0xFFFFFFFF;
    }

  tmp_hi2 = (unsigned long) KSEG0_BASE - 0x4000;
  index = 0;

  do
    {
      tmp_hi2 += 0x4000;
      mips_setentryhi (tmp_hi2);
      if (tmp_hi != 0)
	mips32_sethientryhi (tmp_hi);
      mips_ehb ();		/* mtc0 hazard on tlbp */
      mips_tlbp ();
      mips_ehb ();		/* tlbp hazard on mfc0 */
      if (mips32_getindex () == 0)
	continue;
      mips32_setindex (index);
      mips_ehb ();		/* mtc0 hazard on tlbwi */
      mips_tlbwi ();
      index++;
    }
  while (entries != index);

doReturn:
  /* 
   * Clear EntryHI. The upper half is cleared 
   * autmatically as mtc0 writes zeroes.
  */
  mips_setentryhi (zero);

  return;
}

_MIPS_HAL_NOMIPS16
int m64_tlb_size (void) __attribute__ ((alias ("mips_tlb_size")));
_MIPS_HAL_NOMIPS16
void m64_tlbinvalall (void) __attribute__ ((alias ("mips_tlbinvalall")));
