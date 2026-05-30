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

#include <stdint.h>
#include <errno.h>
#include <mips/uhi_syscalls.h>
#include <mips/hal.h>

extern char __attribute__((weak)) __memory_size[];
extern char __attribute__((weak)) __memory_base[];

void _MIPS_HAL_NOMIPS16
_get_ram_range (void **ram_base, void **ram_extent)
{
  register int32_t op asm ("$25") = __MIPS_UHI_RAMRANGE;
  register void* r_base asm ("$2") = (void*)__MIPS_UHI_SYSCALL_NUM;
  register void* r_extent asm ("$3") = NULL;

  if (__memory_size != NULL)
    {
      if (ram_base)
	*ram_base = (void*)(unsigned long)__memory_base;
      *ram_extent = (void*)((unsigned long)__memory_base
			    + (unsigned long)__memory_size);
      return;
    }

  __asm__ __volatile__ (" # %0,%1 = ramrange() op=%2\n"
			SYSCALL (__MIPS_UHI_SYSCALL_NUM)
			: "+r" (r_base), "=r" (r_extent)
			: "r" (op)
			: "$4", "$5");

  if (ram_base)
    *ram_base = r_base;
  *ram_extent = r_extent;
}
