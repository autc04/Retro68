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

#ifndef _MIPS64_H_
#define _MIPS64_H_

#include <mips/mips32.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef __ASSEMBLER__

#if __mips == 64 && ! __mips16

/* 64-bit count leading zeroes */
#if !defined(mips_dclz)
# define mips_dclz(x) __builtin_clzll (x)
#endif

/* 64-bit count trailing zeroes */
#if !defined(mips_dctz)
# define mips_dctz(x) __builtin_ctzll (x)
#endif

#if !defined(mips_dclo)
#define mips_dclo(x) __extension__({ \
    unsigned long long __x = (x); \
    unsigned int __v; \
    __asm__ ("dclo %0,%1" : "=d" (__v) : "d" (__x)); \
    __v; \
})
#endif

/* MIPS64r2 dshd opcode */
#define _mips64r2_dshd(x) __extension__({ \
    unsigned long long __x = (x), __v; \
    __asm__ ("dshd %0,%1" \
	     : "=d" (__v) \
	     : "d" (__x)); \
    __v; \
})

/* MIPS64r2 dsbh opcode */
#define _mips64r2_dsbh(x) __extension__({ \
    unsigned long long __x = (x), __v; \
    __asm__ ("dsbh %0,%1" \
	     : "=d" (__v) \
	     : "d" (__x)); \
    __v; \
})

/* MIPS64r2 byte-swap doubleword */
#define _mips64r2_bswapd(x) __extension__({ \
    unsigned long long __x = (x), __v; \
    __asm__ ("dsbh %0,%1; dshd %0,%0" \
	     : "=d" (__v) \
	     : "d" (__x)); \
    __v; \
})

/* MIPS64r2 insert bits */
#define _mips64r2_dins(tgt,val,pos,sz) __extension__({ \
    unsigned long long __t = (tgt), __v = (val); \
    __asm__ ("dins %0,%z1,%2,%3" \
	     : "+d" (__t) \
	     : "dJ" (__v), "I" (pos), "I" (sz)); \
    __t; \
})

/* MIPS64r2 extract bits */
#define _mips64r2_dext(x,pos,sz) __extension__({ \
    unsigned long long __x = (x), __v; \
    __asm__ ("dext %0,%z1,%2,%3" \
	     : "=d" (__v) \
	     : "dJ" (__x), "I" (pos), "I" (sz)); \
    __v; \
})

#endif /* __mips == 64 && ! __mips16 */

#endif /* !__ASSEMBLER__ */

#ifdef __cplusplus
}
#endif

#endif /* _MIPS64_H_ */
