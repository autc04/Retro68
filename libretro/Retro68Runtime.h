/*
    Copyright 2017 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    Under Section 7 of GPL version 3, you are granted additional
    permissions described in the GCC Runtime Library Exception, version
    3.1, as published by the Free Software Foundation.

    You should have received a copy of the GNU General Public License and
    a copy of the GCC Runtime Library Exception along with this program;
    see the files COPYING and COPYING.RUNTIME respectively.  If not, see
    <http://www.gnu.org/licenses/>.
*/

#include <stdint.h>
#include <Types.h>

#define _RETRO68_GET_DISPLACEMENT(DISPLACEMENT, STRIP) \
    do {    \
        char *virtualstart, *realstart;    \
        __asm__( "1:\n"    \
                 "\tmove.l #1b, %0\n"    \
                 "\tlea (1b:w,%%pc), %1" \
                : "=r"(virtualstart) , "=a"(realstart) );    \
        DISPLACEMENT = STRIP(realstart) - virtualstart;    \
    } while(0)

#define RETRO68_GET_DISPLACEMENT(DISPLACEMENT) \
    _RETRO68_GET_DISPLACEMENT(DISPLACEMENT, )

// Calls to the StripAddress() trap are supposed to make sure addresses are 32-bit clean. 
// But this trap doesn’t exist on old ROMs and old system versions,
// so programs built with StripAddress will mysteriously crash. 
// Those systems always run in 24-bit mode, so we can just take the lower 24
// bits of the 32 bit address.
// StripAddress24 must not be used on 32-bit systems, or the resulting crashes
// will be even more mysterious.

#define StripAddress24(x) ((char*) ((unsigned long)(x) & 0x00FFFFFF))
#define RETRO68_GET_DISPLACEMENT_STRIP24(DISPLACEMENT) \
    _RETRO68_GET_DISPLACEMENT(DISPLACEMENT, StripAddress24)

// original StripAddress
#define RETRO68_GET_DISPLACEMENT_STRIP(DISPLACEMENT) \
    _RETRO68_GET_DISPLACEMENT(DISPLACEMENT, StripAddress)
    
#define RETRO68_CALL_UNRELOCATED(FUN,ARGS) \
    do {    \
        long displacement;    \
        RETRO68_GET_DISPLACEMENT(displacement);    \
        (*(typeof(&FUN)) ((char*)(&FUN) + displacement)) ARGS;    \
    } while(0)

void Retro68Relocate(void);
void Retro68CallConstructors(void);
void Retro68CallDestructors(void);
void Retro68FreeGlobals(void);
void Retro68InitMultisegApp(void);
void Retro68ApplyRelocations(uint8_t *base, uint32_t size, void *relocations, uint32_t displacements[]);

#define RETRO68_RELOCATE() RETRO68_CALL_UNRELOCATED(Retro68Relocate,())



/*
   struct object is an internal data structure in libgcc.
   Comments in unwind-dw2-fde.h imply that it will not
   increase in size.
 */
struct object { long space[8]; };

extern void __register_frame_info (const void *, struct object *)
                  __attribute__ ((weak));
extern void *__deregister_frame_info (const void *)
                     __attribute__ ((weak));

typedef struct Retro68RelocState
{
    Ptr bssPtr;
    Handle codeHandle;
    char hasStripAddr;
    char hasFlushCodeCache;
} Retro68RelocState;

extern Retro68RelocState relocState;
