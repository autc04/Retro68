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

#define __MIPS_NO_IMPLICIT_EHB	/* No implicit EHB after mtc0 */
#include <mips/cpu.h>
#include <mips/cm3.h>
#include <mips/m32c0.h>
#include <mips/m64c0.h>
#include <mips/hal.h>

#if defined(__mips64) || (__mips == 64)
#define mips_getentryhi()	mips64_getentryhi()
#define mips_setentryhi(v)	mips64_setentryhi(v)
#define mips_getentrylo0()	mips64_getentrylo0()
#define mips_setentrylo0(v)	mips64_setentrylo0(v)
#define mips_getentrylo1()	mips64_getentrylo1()
#define mips_setentrylo1(v)	mips64_setentrylo1(v)
#define mips_getpagemask()	mips64_getpagemask()
#define mips_setpagemask(v)	mips64_setpagemask(v)
#define mips_getindex()		mips64_getindex()
#define mips_setindex(v)	mips64_setindex(v)
#define mips_getcmgcrbase()	mips64_get_c0(C0_CMGCRBASE)
#else
#define mips_getentryhi()	mips32_getentryhi()
#define mips_setentryhi(v)	mips32_setentryhi(v)
#define mips_getentrylo0()	mips32_getentrylo0()
#define mips_setentrylo0(v)	mips32_setentrylo0(v)
#define mips_getentrylo1()	mips32_getentrylo1()
#define mips_setentrylo1(v)	mips32_setentrylo1(v)
#define mips_getpagemask()	mips32_getpagemask()
#define mips_setpagemask(v)	mips32_setpagemask(v)
#define mips_getindex()		mips32_getindex()
#define mips_setindex(v)	mips32_setindex(v)
#define mips_getcmgcrbase()	mips32_get_c0(C0_CMGCRBASE)
#endif

static inline __attribute__((always_inline)) _MIPS_HAL_NOMIPS16
void mips_cache_op (vaddr_t kva, size_t n, int lsize, const int op)
{
  vaddr_t addr, maxaddr, mask;

  if (n <= 0)
    return;

  mask = ~ (lsize - 1);
  addr = (kva & mask) - lsize;
  maxaddr = ((kva + n) - 1) & mask;

  do
    {
      addr = addr + lsize;
      mips_cache (op, addr);
    }
  while (addr != maxaddr);

  return;
}
