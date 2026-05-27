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

#include <_ansi.h>
#include <sys/types.h>
#include <sys/stat.h>

#if _MIPS_SIM == _ABI64
# define K0BASE 0xFFFFFFFF80000000LL
#else
# define K0BASE 0x80000000
#endif
void
_get_ram_range (void **ram_base, void **ram_extent)
{
  struct s_mem
  {
    unsigned int size;
    unsigned int icsize;
    unsigned int dcsize;
  } mem;
  void get_mem_info (struct s_mem*);

  /* The sizeof (s_mem.size) must be 4 bytes.  The compiler should be
     able to eliminate this check */
  if (sizeof (unsigned int) != 4)
    {
      *ram_extent = 0;
      return;
    }

  get_mem_info (&mem);

  /* NOTE: The value returned from the get_mem_info call is the amount
     of memory, and not the address of the (last byte + 1) */

  if (ram_base)
    *ram_base = (void*)K0BASE;
  *ram_extent = (void*)(uintptr_t)(K0BASE + mem.size);
}
