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
 * @Synopsis	 void __exit (int32_t exit_code);
 *
 *		 Parameters:
 *		   exit_code - Exit code
 *
 *		 Return:
 *		   None
 *
 *		 Arguments to syscall:
 *		   $25 - Operation code for exit
 *		   $4 - Exit code
 *
 * @Description  Transfer control to the debug port
*/

#include <stdint.h>
#include <errno.h>
#include <mips/uhi_syscalls.h>
#include <mips/hal.h>

void __return_to_boot (int32_t exit_code) __attribute__((noreturn))
  __attribute__((weak));

/* Defined in .ld file */
extern char __use_excpt_boot[];

/* _exit has been declared weak to allow its defination in the application */
int _MIPS_HAL_NOMIPS16
__exit (int exit_code)
{
  register int32_t arg1 asm ("$4") = exit_code;
  register int32_t op asm ("$25") = __MIPS_UHI_EXIT;
  register int32_t ret asm ("$2") = __MIPS_UHI_SYSCALL_NUM;

  __asm__ __volatile__ (" # _exit(%0 %1) op=%2\n"
			SYSCALL (__MIPS_UHI_SYSCALL_NUM)
			: "+r" (ret), "+r" (arg1)
			: "r" (op)
			: "$3", "$5");

  /* exit wasn't handled, return to caller of _start 
   * __use_excpt_boot has following values
   * 0 = Do not use exception handler present in boot
   * 1 = Use exception handler present in boot if BEV 
	 is 0 at startup
   * 2 = Always use exception handler present in boot
  */
  if (((long) __use_excpt_boot == 2
       || ((long) __use_excpt_boot == 1
	   && __get_startup_BEV
	   && __get_startup_BEV () == 0))
      && __return_to_boot)
    __return_to_boot (exit_code);

  /* Infinite loop if control returns.  */
  __exit (exit_code);
  return exit_code;
}
