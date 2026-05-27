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

/*
 * @Synopsis	 pread
 *
 *		 Arguments to syscall:
 *		   $25 - Operation code for pread
 *		   $4 - File handle
 *		   $5 - Destination buffer
 *		   $6 - Max number of bytes to read
 *		   $7 - Offset in file from which bytes to be read
 *
 *		 Return from syscall:
 *		   $2 - Number of bytes read or -1 in case of error
 *		   $3 - errno
 *
 * @Description  File read from a given offset
*/

#include <sys/types.h>
#include <stdint.h>
#include <errno.h>
#include <mips/uhi_syscalls.h>
#include <mips/hal.h>

ssize_t _MIPS_HAL_NOMIPS16
pread (int fd, void *buf, size_t count, off_t offset)
{
  register int32_t arg1 asm ("$4") = fd;
  register void *arg2 asm ("$5") = buf;
  register int32_t arg3 asm ("$6") = count;
  register int32_t arg4 asm ("$7") = offset;
  register int32_t op asm ("$25") = __MIPS_UHI_PREAD;
  register int32_t ret asm ("$2") = __MIPS_UHI_SYSCALL_NUM;
  register int32_t new_errno asm ("$3") = 0;

  __asm__ __volatile__ (" # %0,%1 = pread(%2, %3, %4, %5) op=%6\n"
			SYSCALL (__MIPS_UHI_SYSCALL_NUM)
			: "+r" (ret), "=r" (new_errno), "+r" (arg1),
			  "+r" (arg2)
			: "r" (arg3), "r" (arg4), "r" (op));

  if (ret == -1)
    {
      /* Do a dance to set errno, errno is a function call that can
	 clobber $3.  */
      volatile uint32_t errno_tmp = new_errno;
      errno = errno_tmp;
    }

  return ret;
}
