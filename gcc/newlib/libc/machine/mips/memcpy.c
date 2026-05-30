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

/* Typical observed latency in cycles in fetching from DRAM.  */
#ifndef LATENCY_CYCLES
 #define LATENCY_CYCLES 63
#endif

/* Pre-fetch performance is subject to accurate prefetch ahead,
   which in turn depends on both the cache-line size and the amount
   of look-ahead.  Since cache-line size is not nominally fixed in
   a typically library built for multiple platforms, we make conservative
   assumptions in the default case.  This code will typically operate
   on such conservative assumptions, but if compiled with the correct
   -mtune=xx options, will perform even better on those specific
   platforms.  */
#if defined(_MIPS_TUNE_OCTEON2) || defined(_MIPS_TUNE_OCTEON3)
 #define CACHE_LINE 128
 #define BLOCK_CYCLES 30
 #undef LATENCY_CYCLES
 #define LATENCY_CYCLES 150
#elif defined(_MIPS_TUNE_I6400) || defined(_MIPS_TUNE_I6500)
 #define CACHE_LINE 64
 #define BLOCK_CYCLES 15
#elif defined(_MIPS_TUNE_P6600)
 #define CACHE_LINE 32
 #define BLOCK_CYCLES 15
#elif defined(_MIPS_TUNE_INTERAPTIV) || defined(_MIPS_TUNE_INTERAPTIV_MR2)
 #define CACHE_LINE 32
 #define BLOCK_CYCLES 30
#else
 #ifndef CACHE_LINE
  #define CACHE_LINE 32
 #endif
 #ifndef BLOCK_CYCLES
  #ifdef __nanomips__
   #define BLOCK_CYCLES 20
  #else
   #define BLOCK_CYCLES 11
  #endif
 #endif
#endif

/* Pre-fetch look ahead = ceil (latency / block-cycles)  */
#define PREF_AHEAD (LATENCY_CYCLES / BLOCK_CYCLES			\
		    + ((LATENCY_CYCLES % BLOCK_CYCLES) == 0 ? 0 : 1))

/* The unroll-factor controls how many words at a time in the core loop.  */
#ifndef BLOCK_SIZE
 #define BLOCK_SIZE (CACHE_LINE == 128 ? 16 : 8)
#elif BLOCK_SIZE != 8 && BLOCK_SIZE != 16
 #error "BLOCK_SIZE must be 8 or 16"
#endif

#define __overloadable
#if !defined(UNALIGNED_INSTR_SUPPORT)
/* does target have unaligned lw/ld/ualw/uald instructions? */
 #define UNALIGNED_INSTR_SUPPORT 0
#if (__mips_isa_rev < 6 && !defined(__mips1)) || defined(__nanomips__)
  #undef UNALIGNED_INSTR_SUPPORT
  #define UNALIGNED_INSTR_SUPPORT 1
 #endif
#endif
#if !defined(HW_UNALIGNED_SUPPORT)
/* Does target have hardware support for unaligned accesses?  */
 #define HW_UNALIGNED_SUPPORT 0
 #if __mips_isa_rev >= 6 && !defined(__nanomips__)
  #undef HW_UNALIGNED_SUPPORT
  #define HW_UNALIGNED_SUPPORT 1
 #endif
#endif

#ifndef ENABLE_PREFETCH
 #define ENABLE_PREFETCH 1
#endif

#ifndef ENABLE_PREFETCH_CHECK
 #define ENABLE_PREFETCH_CHECK 0
#endif

#if ENABLE_PREFETCH
 #if ENABLE_PREFETCH_CHECK
#include <assert.h>
static  char *limit;
#define PREFETCH(addr)				\
  do {						\
    assert ((char *)(addr) < limit);		\
    __builtin_prefetch ((addr), 0, 1);		\
  } while (0)
#else /* ENABLE_PREFETCH_CHECK */
  #define PREFETCH(addr)  __builtin_prefetch (addr, 0, 1)
 #endif /* ENABLE_PREFETCH_CHECK */
#else /* ENABLE_PREFETCH */
 #define PREFETCH(addr)
#endif /* ENABLE_PREFETCH */

#include <string.h>

#ifdef __mips64
typedef unsigned long long reg_t;
typedef struct
{
  reg_t B0:8, B1:8, B2:8, B3:8, B4:8, B5:8, B6:8, B7:8;
} bits_t;
#else /* __mips64 */
typedef unsigned long reg_t;
typedef struct
{
  reg_t B0:8, B1:8, B2:8, B3:8;
} bits_t;
#endif /* __mips64 */

#define CACHE_LINES_PER_BLOCK						\
  ((BLOCK_SIZE * sizeof (reg_t) > CACHE_LINE)				\
   ? (BLOCK_SIZE * sizeof (reg_t) / CACHE_LINE)				\
   : 1)

typedef union
{
  reg_t v;
  bits_t b;
} bitfields_t;

#define DO_BYTE(a, i)   \
  a[i] = bw.b.B##i;     \
  len--;                \
  if (!len) return ret;  \

/* This code is called when aligning a pointer, there are remaining bytes
   after doing word compares, or architecture does not have some form
   of unaligned support.  */
static inline void * __attribute__ ((always_inline))
do_bytes (void *a, const void *b, unsigned long len, void *ret)
{
  unsigned char *x = (unsigned char *) a;
  unsigned char *y = (unsigned char *) b;
  unsigned long i;
  /* 'len' might be zero here, so preloading the first two values
     before the loop may access unallocated memory.  */
  for (i = 0; i < len; i++)
    {
      *x = *y;
      x++;
      y++;
    }
  return ret;
}

/* This code is called to copy only remaining bytes within word or doubleword */
static inline void * __attribute__ ((always_inline))
do_bytes_remaining (void *a, const void *b, unsigned long len, void *ret)
{
  unsigned char *x = (unsigned char *) a;
  bitfields_t bw;
  if (len > 0)
    {
      bw.v = *(reg_t *)b;
      DO_BYTE(x, 0);
      DO_BYTE(x, 1);
      DO_BYTE(x, 2);
#ifdef __mips64
      DO_BYTE(x, 3);
      DO_BYTE(x, 4);
      DO_BYTE(x, 5);
      DO_BYTE(x, 6);
#endif /* __mips64 */
    }
  return ret;
}

static inline void * __attribute__ ((always_inline))
do_words_remaining (reg_t *a, const reg_t *b, unsigned long words,
		    unsigned long bytes, void *ret)
{
  /* Use a set-back so that load/stores have incremented addresses in
     order to promote bonding.  */
  int off = (BLOCK_SIZE - words);
  a -= off;
  b -= off;
  switch (off)
    {
      case 1: a[1] = b[1];
      case 2: a[2] = b[2];
      case 3: a[3] = b[3];
      case 4: a[4] = b[4];
      case 5: a[5] = b[5];
      case 6: a[6] = b[6];
      case 7: a[7] = b[7];
#if BLOCK_SIZE==16
      case 8: a[8] = b[8];
      case 9: a[9] = b[9];
      case 10: a[10] = b[10];
      case 11: a[11] = b[11];
      case 12: a[12] = b[12];
      case 13: a[13] = b[13];
      case 14: a[14] = b[14];
      case 15: a[15] = b[15];
#endif /* BLOCK_SIZE==16 */
    }
  return do_bytes_remaining (a + BLOCK_SIZE, b + BLOCK_SIZE, bytes, ret);
}

#if !HW_UNALIGNED_SUPPORT
#if UNALIGNED_INSTR_SUPPORT
/* For MIPS GCC, there are no unaligned builtins - so this struct forces
   the compiler to treat the pointer access as unaligned.  */
struct ulw
{
  reg_t uli;
} __attribute__ ((packed));
static inline void * __attribute__ ((always_inline))
do_uwords_remaining (struct ulw *a, const reg_t *b, unsigned long words,
		     unsigned long bytes, void *ret)
{
  /* Use a set-back so that load/stores have incremented addresses in
     order to promote bonding.  */
  int off = (BLOCK_SIZE - words);
  a -= off;
  b -= off;
  switch (off)
    {
      case 1: a[1].uli = b[1];
      case 2: a[2].uli = b[2];
      case 3: a[3].uli = b[3];
      case 4: a[4].uli = b[4];
      case 5: a[5].uli = b[5];
      case 6: a[6].uli = b[6];
      case 7: a[7].uli = b[7];
#if BLOCK_SIZE==16
      case 8: a[8].uli = b[8];
      case 9: a[9].uli = b[9];
      case 10: a[10].uli = b[10];
      case 11: a[11].uli = b[11];
      case 12: a[12].uli = b[12];
      case 13: a[13].uli = b[13];
      case 14: a[14].uli = b[14];
      case 15: a[15].uli = b[15];
#endif /* BLOCK_SIZE==16 */
    }
  return do_bytes_remaining (a + BLOCK_SIZE, b + BLOCK_SIZE, bytes, ret);
}

/* The first pointer is not aligned while second pointer is.  */
static void *
unaligned_words (struct ulw *a, const reg_t * b,
		 unsigned long words, unsigned long bytes, void *ret)
{
  unsigned long i, words_by_block, words_by_1;
  words_by_1 = words % BLOCK_SIZE;
  words_by_block = words / BLOCK_SIZE;

  for (; words_by_block > 0; words_by_block--)
    {
      /* This condition is deliberately conservative.  One could theoretically
	 pre-fetch another time around in some cases without crossing the page
	 boundary at the limit, but checking for the right conditions here is
	 too expensive to be worth it.  */
      if (words_by_block > PREF_AHEAD)
	for (i = 0; i < CACHE_LINES_PER_BLOCK; i++)
	  PREFETCH (b + ((BLOCK_SIZE / CACHE_LINES_PER_BLOCK)
			 * (PREF_AHEAD + i)));

      reg_t y0 = b[0], y1 = b[1], y2 = b[2], y3 = b[3];
      reg_t y4 = b[4], y5 = b[5], y6 = b[6], y7 = b[7];
      a[0].uli = y0;
      a[1].uli = y1;
      a[2].uli = y2;
      a[3].uli = y3;
      a[4].uli = y4;
      a[5].uli = y5;
      a[6].uli = y6;
      a[7].uli = y7;
#if BLOCK_SIZE==16
      y0 = b[8], y1 = b[9], y2 = b[10], y3 = b[11];
      y4 = b[12], y5 = b[13], y6 = b[14], y7 = b[15];
      a[8].uli = y0;
      a[9].uli = y1;
      a[10].uli = y2;
      a[11].uli = y3;
      a[12].uli = y4;
      a[13].uli = y5;
      a[14].uli = y6;
      a[15].uli = y7;
#endif /* BLOCK_SIZE==16 */
      a += BLOCK_SIZE;
      b += BLOCK_SIZE;
  }

  /* Mop up any remaining bytes.  */
  return do_uwords_remaining (a, b, words_by_1, bytes, ret);
}

#else /* !UNALIGNED_INSTR_SUPPORT */

/* No HW support or unaligned lw/ld/ualw/uald instructions.  */
static void *
unaligned_words (reg_t * a, const reg_t * b,
		 unsigned long words, unsigned long bytes, void *ret)
{
  unsigned long i;
  unsigned char *x;
  for (i = 0; i < words; i++)
    {
      bitfields_t bw;
      bw.v = *((reg_t*) b);
      x = (unsigned char *) a;
      x[0] = bw.b.B0;
      x[1] = bw.b.B1;
      x[2] = bw.b.B2;
      x[3] = bw.b.B3;
#ifdef __mips64
      x[4] = bw.b.B4;
      x[5] = bw.b.B5;
      x[6] = bw.b.B6;
      x[7] = bw.b.B7;
#endif
      a += 1;
      b += 1;
    }
  /* Mop up any remaining bytes.  */
  return do_bytes_remaining (a, b, bytes, ret);
}

#endif /* UNALIGNED_INSTR_SUPPORT */
#endif /* HW_UNALIGNED_SUPPORT */

/* both pointers are aligned, or first isn't and HW support for unaligned.  */
static void *
aligned_words (reg_t * a, const reg_t * b,
	       unsigned long words, unsigned long bytes, void *ret)
{
  unsigned long i, words_by_block, words_by_1;
  words_by_1 = words % BLOCK_SIZE;
  words_by_block = words / BLOCK_SIZE;

  for (; words_by_block > 0; words_by_block--)
    {
      if (words_by_block > PREF_AHEAD)
	for (i = 0; i < CACHE_LINES_PER_BLOCK; i++)
	  PREFETCH (b + ((BLOCK_SIZE / CACHE_LINES_PER_BLOCK)
			 * (PREF_AHEAD + i)));

      reg_t x0 = b[0], x1 = b[1], x2 = b[2], x3 = b[3];
      reg_t x4 = b[4], x5 = b[5], x6 = b[6], x7 = b[7];
      a[0] = x0;
      a[1] = x1;
      a[2] = x2;
      a[3] = x3;
      a[4] = x4;
      a[5] = x5;
      a[6] = x6;
      a[7] = x7;
#if BLOCK_SIZE==16
      x0 = b[8], x1 = b[9], x2 = b[10], x3 = b[11];
      x4 = b[12], x5 = b[13], x6 = b[14], x7 = b[15];
      a[8] = x0;
      a[9] = x1;
      a[10] = x2;
      a[11] = x3;
      a[12] = x4;
      a[13] = x5;
      a[14] = x6;
      a[15] = x7;
#endif /* BLOCK_SIZE==16 */
      a += BLOCK_SIZE;
      b += BLOCK_SIZE;
    }

  /* mop up any remaining bytes.  */
  return do_words_remaining (a, b, words_by_1, bytes, ret);
}

void *
memcpy (void *a, const void *b, size_t len) __overloadable
{
  unsigned long bytes, words, i;
  void *ret = a;
#if ENABLE_PREFETCH_CHECK
  limit = (char *)b + len;
#endif /* ENABLE_PREFETCH_CHECK */
  /* shouldn't hit that often.  */
  if (len <= 8)
    return do_bytes (a, b, len, a);

  /* Start pre-fetches ahead of time.  */
  if (len > CACHE_LINE * PREF_AHEAD)
    for (i = 1; i < PREF_AHEAD; i++)
      PREFETCH ((char *)b + CACHE_LINE * i);
  else
    for (i = 1; i < len / CACHE_LINE; i++)
      PREFETCH ((char *)b + CACHE_LINE * i);

  /* Align the second pointer to word/dword alignment.
     Note that the pointer is only 32-bits for o32/n32 ABIs.  For
     n32, loads are done as 64-bit while address remains 32-bit.   */
  bytes = ((unsigned long) b) % (sizeof (reg_t));

  if (bytes)
    {
      bytes = (sizeof (reg_t)) - bytes;
      if (bytes > len)
	bytes = len;
      do_bytes (a, b, bytes, ret);
      if (len == bytes)
	return ret;
      len -= bytes;
      a = (void *) (((unsigned char *) a) + bytes);
      b = (const void *) (((unsigned char *) b) + bytes);
    }

  /* Second pointer now aligned.  */
  words = len / sizeof (reg_t);
  bytes = len % sizeof (reg_t);

#if HW_UNALIGNED_SUPPORT
  /* treat possible unaligned first pointer as aligned.  */
  return aligned_words (a, b, words, bytes, ret);
#else /* !HW_UNALIGNED_SUPPORT */
  if (((unsigned long) a) % sizeof (reg_t) == 0)
    return aligned_words (a, b, words, bytes, ret);
  /* need to use unaligned instructions on first pointer.  */
  return unaligned_words (a, b, words, bytes, ret);
#endif /* HW_UNALIGNED_SUPPORT */
}
