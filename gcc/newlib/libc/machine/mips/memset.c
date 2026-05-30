/*
 * Copyright (C) 2018 MIPS Tech, LLC
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

#include <string.h>

#if _MIPS_SIM == _ABIO32
#define SIZEOF_reg_t 4
typedef unsigned long reg_t;
#else
#define SIZEOF_reg_t 8
typedef unsigned long long reg_t;
#endif

typedef struct bits8
{
  reg_t B0:8, B1:8, B2:8, B3:8;
#if SIZEOF_reg_t == 8
  reg_t B4:8, B5:8, B6:8, B7:8;
#endif
} bits8_t;
typedef struct bits16
{
  reg_t B0:16, B1:16;
#if SIZEOF_reg_t == 8
  reg_t B2:16, B3:16;
#endif
} bits16_t;
typedef struct bits32
{
  reg_t B0:32;
#if SIZEOF_reg_t == 8
  reg_t B1:32;
#endif
} bits32_t;

/* This union assumes that small structures can be in registers.  If
   not, then memory accesses will be done - not optimal, but ok.  */
typedef union
{
  reg_t v;
  bits8_t b8;
  bits16_t b16;
  bits32_t b32;
} bitfields_t;

/* This code is called when aligning a pointer or there are remaining bytes
   after doing word sets.  */
static inline void * __attribute__ ((always_inline))
do_bytes (void *a, void *retval, unsigned char fill, const unsigned long len)
{
  unsigned char *x = ((unsigned char *) a);
  unsigned long i;

  for (i = 0; i < len; i++)
    *x++ = fill;

  return retval;
}

/* Pointer is aligned.  */
static void *
do_aligned_words (reg_t * a, void * retval, reg_t fill,
	 unsigned long words, unsigned long bytes)
{
  unsigned long i, words_by_1, words_by_16;

  words_by_1 = words % 16;
  words_by_16 = words / 16;

  /*
   * Note: prefetching the store memory is not beneficial on most
   * cores since the ls/st unit has store buffers that will be filled
   * before the cache line is actually needed.
   *
   * Also, using prepare-for-store cache op is problematic since we
   * don't know the implementation-defined cache line length and we
   * don't want to touch unintended memory.
   */
  for (i = 0; i < words_by_16; i++)
    {
      a[0] = fill;
      a[1] = fill;
      a[2] = fill;
      a[3] = fill;
      a[4] = fill;
      a[5] = fill;
      a[6] = fill;
      a[7] = fill;
      a[8] = fill;
      a[9] = fill;
      a[10] = fill;
      a[11] = fill;
      a[12] = fill;
      a[13] = fill;
      a[14] = fill;
      a[15] = fill;
      a += 16;
    }

  /* do remaining words.  */
  for (i = 0; i < words_by_1; i++)
    *a++ = fill;

  /* mop up any remaining bytes.  */
  return do_bytes (a, retval, fill, bytes);
}

void *
memset (void *a, int ifill, size_t len)
{
  unsigned long bytes, words;
  bitfields_t fill;
  void *retval = (void *) a;

  /* shouldn't hit that often.  */
  if (len < 16)
    return do_bytes (a, retval, ifill, len);

  /* Align the pointer to word/dword alignment.
     Note that the pointer is only 32-bits for o32/n32 ABIs. For
     n32, loads are done as 64-bit while address remains 32-bit.   */
  bytes = ((unsigned long) a) % (sizeof (reg_t) * 2);
  if (bytes)
    {
      bytes = (sizeof (reg_t) * 2 - bytes);
      if (bytes > len)
	bytes = len;
      do_bytes (a, retval, ifill, bytes);
      if (len == bytes)
	return retval;
      len -= bytes;
      a = (void *) (((unsigned char *) a) + bytes);
    }

  /* Create correct fill value for reg_t sized variable.  */
  if (ifill != 0)
    {
      fill.b8.B0 = (unsigned char) ifill;
      fill.b8.B1 = fill.b8.B0;
      fill.b16.B1 = fill.b16.B0;
#if SIZEOF_reg_t == 8
      fill.b32.B1 = fill.b32.B0;
#endif
    }
  else
    fill.v = 0;

  words = len / sizeof (reg_t);
  bytes = len % sizeof (reg_t);
  return do_aligned_words (a, retval, fill.v, words, bytes);
}
