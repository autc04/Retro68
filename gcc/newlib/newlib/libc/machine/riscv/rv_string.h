/* Copyright (c) 2017  SiFive Inc. All rights reserved.

   This copyrighted material is made available to anyone wishing to use,
   modify, copy, or redistribute it subject to the terms and conditions
   of the FreeBSD License.   This program is distributed in the hope that
   it will be useful, but WITHOUT ANY WARRANTY expressed or implied,
   including the implied warranties of MERCHANTABILITY or FITNESS FOR
   A PARTICULAR PURPOSE.  A copy of this license is available at
   http://www.opensource.org/licenses.
*/

#ifndef _RV_STRING_H
#define _RV_STRING_H

#include <stdbool.h>
#include "xlenint.h"

#if __riscv_zbb
  #include <riscv_bitmanip.h>

  // Determine which intrinsics to use based on XLEN and endianness
  #if __riscv_xlen == 64
    #define __LIBC_RISCV_ZBB_ORC_B(x)         __riscv_orc_b_64(x)

    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
      #define __LIBC_RISCV_ZBB_CNT_Z(x)       __riscv_ctz_64(x)
      #define __LIBC_RISCV_ZBB_CNT_Z_REV(x)   __riscv_clz_64(x)
    #else
      #define __LIBC_RISCV_ZBB_CNT_Z(x)       __riscv_clz_64(x)
      #define __LIBC_RISCV_ZBB_CNT_Z_REV(x)   __riscv_ctz_64(x)
    #endif
  #else
    #define __LIBC_RISCV_ZBB_ORC_B(x)         __riscv_orc_b_32(x)

    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
      #define __LIBC_RISCV_ZBB_CNT_Z(x)       __riscv_ctz_32(x)
      #define __LIBC_RISCV_ZBB_CNT_Z_REV(x)   __riscv_clz_32(x)
    #else
      #define __LIBC_RISCV_ZBB_CNT_Z(x)       __riscv_clz_32(x)
      #define __LIBC_RISCV_ZBB_CNT_Z_REV(x)   __riscv_ctz_32(x)
    #endif
  #endif
#endif


static __inline uintxlen_t __libc_detect_null(uintxlen_t w)
{
#if __riscv_zbb
  /*
    If there are any zeros in each byte of the register, all bits will
    be unset for that byte value, otherwise, all bits will be set.
    If the value is -1, all bits are set, meaning no null byte was found.
  */
  return __LIBC_RISCV_ZBB_ORC_B(w) != -1;
#else
  uintxlen_t mask = 0x7f7f7f7f;
  #if __riscv_xlen == 64
    mask = ((mask << 16) << 16) | mask;
  #endif
  return ~(((w & mask) + mask) | w | mask);
#endif
}


static __inline char *__libc_strcpy(char *dst, const char *src, bool ret_start)
{
  char *dst0 = dst;

#if !defined(PREFER_SIZE_OVER_SPEED) && !defined(__OPTIMIZE_SIZE__)
#if !(__riscv_misaligned_slow || __riscv_misaligned_fast)
  int misaligned = ((uintxlen_t)dst | (uintxlen_t)src) & (sizeof (uintxlen_t) - 1);
  if (__builtin_expect(!misaligned, 1))
#endif
    {
      uintxlen_t *pdst = (uintxlen_t *)dst;
      const uintxlen_t *psrc = (const uintxlen_t *)src;

      while (!__libc_detect_null(*psrc))
        *pdst++ = *psrc++;

      dst = (char *)pdst;
      src = (const char *)psrc;

      if (ret_start)
        {
          if (!(*dst++ = src[0])) return dst0;
          if (!(*dst++ = src[1])) return dst0;
          if (!(*dst++ = src[2])) return dst0;
          #if __riscv_xlen == 64
            if (!(*dst++ = src[3])) return dst0;
            if (!(*dst++ = src[4])) return dst0;
            if (!(*dst++ = src[5])) return dst0;
            if (!(*dst++ = src[6])) return dst0;
          #endif
        }
      else
        {
          if (!(*dst++ = src[0])) return dst - 1;
          if (!(*dst++ = src[1])) return dst - 1;
          if (!(*dst++ = src[2])) return dst - 1;
          #if __riscv_xlen == 64
            if (!(*dst++ = src[3])) return dst - 1;
            if (!(*dst++ = src[4])) return dst - 1;
            if (!(*dst++ = src[5])) return dst - 1;
            if (!(*dst++ = src[6])) return dst - 1;
          #endif
          dst0 = dst;
        }

      *dst = 0;
      return dst0;
    }
#endif /* not PREFER_SIZE_OVER_SPEED */

  char ch;
  do
    {
      ch = *src;
      src++;
      dst++;
      *(dst - 1) = ch;
    } while (ch);

  return ret_start ? dst0 : dst - 1;
}


static __inline uintxlen_t __libc_splat_byte(unsigned char c)
{
  uintxlen_t val;

#if __riscv_zbkb
  asm volatile ("packh %0, %1, %1"
                : "=r" (val)
                : "r" (c)
      );
#if __riscv_xlen == 64
  asm volatile ("packw %0, %0, %0"
                : "+r" (val)
  );
#endif /* __riscv_xlen == 64 */
  asm volatile ("pack %0, %0, %0"
                : "+r" (val)
  );
#else /* not __riscv_zbkb */
  val = (c << 8) | c;
  val = (val << 16) | val;
#if __riscv_xlen == 64
  val = (val << 32) | val;
#endif /* __riscv_xlen == 64 */
#endif /* __riscv_zbkb */

  return val;
}


#endif /* _RV_STRING_H */
