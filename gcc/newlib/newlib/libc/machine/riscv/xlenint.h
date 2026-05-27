#ifndef _XLENINT_H
#define _XLENINT_H

#include <stdint.h>

#if __riscv_xlen == 64
typedef uint64_t uintxlen_t;
#elif __riscv_xlen == 32
typedef uint32_t uintxlen_t;
#else
# error __riscv_xlen must equal 32 or 64
#endif

/* Load/Store length */
#if __riscv_zilsd
typedef uint64_t uintlslen_t;
#else
typedef uintxlen_t uintlslen_t;
#endif

#endif /* _XLENINT_H */
