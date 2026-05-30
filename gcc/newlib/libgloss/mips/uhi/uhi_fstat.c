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
 * @Synopsis	 int32_t fstat (int32_t file, struct stat *sbuf);
 *
 *		 Parameters:
 *		   file - File handle
 *		   sbuf - Pointer to dst buffer
 *
 *		 Return:
 *		   0 on success else -1
 *
 *		 Arguments to syscall:
 *		   $25 - Operation code for fstat
 *		   $4 - File handle
 *		   $5 - Pointer to dst buffer (struct stat *)
 *
 *		 Return from syscall:
 *		   $2 - 0 on success else -1
 *		   $3 - errno
 *
 * @Description  File statistics
*/

#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stddef.h>
#include <mips/uhi_syscalls.h>
#include <mips/hal.h>
#include "uhi_stat.h"

/* This macro declares a dummy type with -ve size if CONDITION is false */
#define __paste(STR1, STR2) STR1##STR2
#define __check(LINE, CONDITION) typedef char __paste(assertion_failed_at_line_, LINE) [(int)(CONDITION)-1]

int _MIPS_HAL_NOMIPS16
fstat (int file, struct stat *sbuf)
{
  struct uhi_stat hbuf = {0,};
  register int32_t arg1 asm ("$4") = file;
  register struct uhi_stat *arg2 asm ("$5") = &hbuf;
  register int32_t op asm ("$25") = __MIPS_UHI_FSTAT;
  register int32_t ret asm ("$2") = __MIPS_UHI_SYSCALL_NUM;
  register int32_t new_errno asm ("$3") = 0;

  /*
   * We assume that NewLib has following 'struct stat'. Any change in
   * this structure (either offset or size) would generate a compile
   * time error.
  */
#if defined (_LP64)
  __check (__LINE__, sizeof (struct stat) == 104);
  __check (__LINE__, offsetof (struct stat, st_dev) == 0);
  __check (__LINE__, offsetof (struct stat, st_ino) == 2);
  __check (__LINE__, offsetof (struct stat, st_mode) == 4);
  __check (__LINE__, offsetof (struct stat, st_nlink) == 8);
  __check (__LINE__, offsetof (struct stat, st_uid) == 10);
  __check (__LINE__, offsetof (struct stat, st_gid) == 12);
  __check (__LINE__, offsetof (struct stat, st_rdev) == 14);
  __check (__LINE__, offsetof (struct stat, st_size) == 16);
  __check (__LINE__, offsetof (struct stat, st_atime) == 24);
  __check (__LINE__, offsetof (struct stat, st_spare1) == 32);
  __check (__LINE__, offsetof (struct stat, st_mtime) == 40);
  __check (__LINE__, offsetof (struct stat, st_spare2) == 48);
  __check (__LINE__, offsetof (struct stat, st_ctime) == 56);
  __check (__LINE__, offsetof (struct stat, st_spare3) == 64);
  __check (__LINE__, offsetof (struct stat, st_blksize) == 72);
  __check (__LINE__, offsetof (struct stat, st_blocks) == 80);
  __check (__LINE__, offsetof (struct stat, st_spare4) == 88);
#else
  __check (__LINE__, sizeof (struct stat) == 60);
  __check (__LINE__, offsetof (struct stat, st_dev) == 0);
  __check (__LINE__, offsetof (struct stat, st_ino) == 2);
  __check (__LINE__, offsetof (struct stat, st_mode) == 4);
  __check (__LINE__, offsetof (struct stat, st_nlink) == 8);
  __check (__LINE__, offsetof (struct stat, st_uid) == 10);
  __check (__LINE__, offsetof (struct stat, st_gid) == 12);
  __check (__LINE__, offsetof (struct stat, st_rdev) == 14);
  __check (__LINE__, offsetof (struct stat, st_size) == 16);
  __check (__LINE__, offsetof (struct stat, st_atime) == 20);
  __check (__LINE__, offsetof (struct stat, st_spare1) == 24);
  __check (__LINE__, offsetof (struct stat, st_mtime) == 28);
  __check (__LINE__, offsetof (struct stat, st_spare2) == 32);
  __check (__LINE__, offsetof (struct stat, st_ctime) == 36);
  __check (__LINE__, offsetof (struct stat, st_spare3) == 40);
  __check (__LINE__, offsetof (struct stat, st_blksize) == 44);
  __check (__LINE__, offsetof (struct stat, st_blocks) == 48);
  __check (__LINE__, offsetof (struct stat, st_spare4) == 52);
#endif

  __asm__ __volatile__ (" # %0,%1 = fstat(%2, %3) op=%4\n"
			SYSCALL (__MIPS_UHI_SYSCALL_NUM)
			: "+r" (ret), "=r" (new_errno), "+r" (arg1),
			  "+r" (arg2)
			: "r" (op));

  if (ret != 0)
    {
      /* Do a dance to set errno, errno is a function call that can
	 clobber $3.  */
      volatile uint32_t errno_tmp = new_errno;
      errno = errno_tmp;
    }
  else
    {
      sbuf->st_dev = hbuf.st_dev;
      sbuf->st_ino = hbuf.st_ino;
      sbuf->st_mode = hbuf.st_mode;
      sbuf->st_nlink = hbuf.st_nlink;
      sbuf->st_uid = hbuf.st_uid;
      sbuf->st_gid = hbuf.st_gid;
      sbuf->st_rdev = hbuf.st_rdev;
      sbuf->st_size = (long) hbuf.st_size;
      sbuf->st_atime = (time_t) hbuf.st_atime;
      sbuf->st_spare1 = (long) hbuf.st_spare1;
      sbuf->st_mtime = (time_t) hbuf.st_mtime;
      sbuf->st_spare2 = (long) hbuf.st_spare2;
      sbuf->st_ctime = (time_t) hbuf.st_ctime;
      sbuf->st_spare3 = (long) hbuf.st_spare3;
      sbuf->st_blksize = (long) hbuf.st_blksize;
      sbuf->st_blocks = (long) hbuf.st_blocks;
      sbuf->st_spare4[0] = (long) hbuf.st_spare4[0];
      sbuf->st_spare4[1] = (long) hbuf.st_spare4[1];
    }

  return ret;
}

#undef __paste
#undef __check
