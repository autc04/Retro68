/*
FUNCTION
	<<memrchr>>---reverse search for character in memory

INDEX
	memrchr

SYNOPSIS
	#include <string.h>
	void *memrchr(const void *<[src]>, int <[c]>, size_t <[length]>);

DESCRIPTION
	This function searches memory starting at <[length]> bytes
	beyond <<*<[src]>>> backwards for the character <[c]>.
	The search only ends with the first occurrence of <[c]>; in
	particular, <<NUL>> does not terminate the search.

RETURNS
	If the character <[c]> is found within <[length]> characters
	of <<*<[src]>>>, a pointer to the character is returned. If
	<[c]> is not found, then <<NULL>> is returned.

PORTABILITY
<<memrchr>> is a GNU extension.

<<memrchr>> requires no supporting OS subroutines.

QUICKREF
	memrchr
*/

#include <sys/asm.h>
#include <stddef.h>
#include "rv_string.h"

// Move size
#if __riscv_zilsd
#define MV_SZ           8

// Offset is only 4 bytes for Zilsd/Zclsd since each register is 32 bits
#define OFFSET          4
#else
#define MV_SZ           SZREG
#define OFFSET          SZREG
#endif


void *
memrchr (const void *src_void,
	int c,
	size_t length)
{
  const unsigned char *src = (const unsigned char *) src_void;
  unsigned char d = c;

  if (length) src += length - 1;

#if !defined(PREFER_SIZE_OVER_SPEED) && !defined(__OPTIMIZE_SIZE__)

  /*
    We add one to the address because even if an address is already aligned,
    when loading words the bytes preceding this address are read, so check
    the single byte.

    If the address has all the least significant bits set equaling MV_SZ - 1,
    and has a length of at least MV_SZ, we can read a word starting from
    src & ~(MV_SZ - 1) because no alignment is actually required
  */
  size_t align = (uintptr_t) (src + 1) & (MV_SZ - 1);

  if (align)
    {
      if (length < align) align = length;

      switch (align)
        {
#if MV_SZ == 8
          case 7:
            if (*src-- == d) return (void *) (src + 1);
          case 6:
            if (*src-- == d) return (void *) (src + 1);
          case 5:
            if (*src-- == d) return (void *) (src + 1);
          case 4:
            if (*src-- == d) return (void *) (src + 1);
#endif /* MV_SZ == 8 */
          case 3:
            if (*src-- == d) return (void *) (src + 1);
          case 2:
            if (*src-- == d) return (void *) (src + 1);
          case 1:
            if (*src-- == d) return (void *) (src + 1);
        }

      length -= align;
    }

  const unsigned char *end_addr = src - (length & ~(MV_SZ - 1));

  if (src > end_addr)
    {
      src -= MV_SZ - 1;

      uintxlen_t mask = __libc_splat_byte(d);

      do
        {
          uintlslen_t val = *(uintlslen_t*) src;

#if __riscv_zilsd
          uintxlen_t word2 = val >> 32;
          word2 ^= mask;

          if (__libc_detect_null(word2))
            {
#if __riscv_zbb
              src += OFFSET;
              word2 = ~__LIBC_RISCV_ZBB_ORC_B(word2);
              word2 = __LIBC_RISCV_ZBB_CNT_Z_REV(word2);

              return (void *) (src + OFFSET - 1 - (word2 >> 3));
#else /* not __riscv_zbb */
              src += MV_SZ - 1;
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
              return (void *) src;
#endif /* __riscv_zbb */
            }
#endif /* __riscv_zilsd */
          uintxlen_t word1 = val ^ mask;

          if (__libc_detect_null(word1))
            {
#if __riscv_zbb
              word1 = ~__LIBC_RISCV_ZBB_ORC_B(word1);
              word1 = __LIBC_RISCV_ZBB_CNT_Z_REV(word1);

              return (void *) (src + OFFSET - 1 - (word1 >> 3));
#else /* not __riscv_zbb */
              src += OFFSET - 1;
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
#if __riscv_xlen == 64
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
              if (*src-- == d) return (void *) (src + 1);
#endif /* __riscv_xlen == 64 */
              return (void *) src;
#endif /* __riscv_zbb */
            }

          src -= MV_SZ;
        } while (src > end_addr);

      length &= MV_SZ - 1;
      src = end_addr;
    }

#endif /* not PREFER_SIZE_OVER_SPEED */

  while (length--)
    {
      if (*src == d)
        return (void *) src;
      src--;
    }

  return NULL;
}
