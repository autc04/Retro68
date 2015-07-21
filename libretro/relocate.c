/*
	Copyright 2015 Wolfgang Thaller.

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
#include <stdlib.h>

#include <Processes.h>
#include <Sound.h>
#include <Memory.h>
#include <OSUtils.h>

#include "Retro68Runtime.h"


struct flat_hdr {
	char magic[4];
	unsigned long rev;          /* version */
	unsigned long entry;        /* Offset of first executable instruction
								   with text segment from beginning of file */
	unsigned long data_start;   /* Offset of data segment from beginning of
								   file */
	unsigned long data_end;     /* Offset of end of data segment
								   from beginning of file */
	unsigned long bss_end;      /* Offset of end of bss segment from beginning
								   of file */

	/* (It is assumed that data_end through bss_end forms the bss segment.) */

	unsigned long stack_size;   /* Size of stack, in bytes */
	unsigned long reloc_start;  /* Offset of relocation records from
								   beginning of file */
	unsigned long reloc_count;  /* Number of relocation records */
	unsigned long flags;       
	unsigned long filler[6];    /* Reserved, set to zero */
};

typedef void (*voidFunction)(void);

extern void __init_section(void);
extern void __init_section_end(void);
extern void __fini_section(void);
extern void __fini_section_end(void);

typedef struct Retro68RelocState
{
	long	headerVirtualAddress;
	Ptr		bssPtr;
	Handle	codeHandle;
} Retro68RelocState;

static Retro68RelocState relocState __attribute__ ((nocommon)) = {
	-sizeof(struct flat_hdr), NULL, NULL
};

#if 1
#define assert(x) do { } while(0)
#else
#define assert(x) do { \
		if(!(x)) {\
			unsigned char str[6];	\
			int i;	\
			int l = __LINE__; \
			for(i = 1; i < 6; i++)	\
				str[i] = ' ';	\
			str[0] = 5;	\
			str[5] = '0';	\
			for(i = 5; l && i > 0; i--)	\
			{	\
				str[i] = '0' + (l % 10);	\
				l /= 10;	\
			}	\
			DebugStr(str);	\
		}	\
	} while(0)
#endif

void Retro68Relocate()
{
	// Figure out the displacement
	// what is the difference between the addresses in our program code
	// and an address calculated by PC-relative access?
	long displacement;
	RETRO68_GET_DISPLACEMENT_STRIP(displacement);

	struct Retro68RelocState *rState = (Retro68RelocState*)
			((char*)&relocState + displacement);
	// rState now points to the global relocState variable

	if(displacement == 0)
	{
		if(rState->bssPtr)
		{
			// this is not the first time, no relocations needed.
			// should only happen for code resources
			// that are invoked more than once.

			// Lock the code to be sure.
			HLock(rState->codeHandle);
			return;
		}
	}

	// Locate the start of the FLT file header inside the code resource
	long headerOldVirtualAddress = rState->headerVirtualAddress;
	struct flat_hdr *header = (struct flat_hdr*) (headerOldVirtualAddress + displacement);
	uint8_t *base = (uint8_t*) (header+1);


	// Recover the handle to the code resource by looking at the
	// longword before the FLT header. The resource templates in Retro68.r store the offset
	// from the beginning of the code resource there.
	uint32_t headerOffsetInResource = ((uint32_t*)header)[-1];

	if(headerOffsetInResource < 4096)
		// Arbitrary magic number. We expect the offset to be small, just a few header bytes before it.
		// if it's out of range, assume the longword before the header is not the offset we're looking for.
	{
		Handle h = RecoverHandle((Ptr) header - headerOffsetInResource);
		if(MemError() == noErr && h)
		{
			// Make sure the code is locked. Only relevant for some code resources.
			HLock(h);
			rState->codeHandle = h;
		}
	}



	long bss_size = header->bss_end - header->data_end;

	long n = header->reloc_count;
	long *relocs = (long*)( (char*)header + header->reloc_start );
	long i;
	long data_end = header->data_end + headerOldVirtualAddress;
	uint32_t flt_size = (uint32_t) header->data_end;
	long bss_displacement = 0;

	// Allocate BSS section (uninitialized/zero-initialized global data)
	if(!rState->bssPtr)
	{
		THz zone = ApplicationZone();
		if(!zone || (char*)header < (char*)zone)
			rState->bssPtr = NewPtrSysClear(bss_size);
		else
			rState->bssPtr = NewPtrClear(bss_size);
		bss_displacement = (long)(rState->bssPtr) - data_end;
	}

	// Process relocation records
	for(i = 0; i < n; i++)
	{
		uint8_t *addrPtr = base + relocs[i];
		uint32_t addr;

		assert((Ptr)addrPtr >= (Ptr)header);
		assert((Ptr)addrPtr < (Ptr)header + flt_size);

		//addr = *(uint32_t*)addrPtr;
		addr = (((((addrPtr[0] << 8) | addrPtr[1]) << 8) | addrPtr[2]) << 8) | addrPtr[3];

		assert(addr + 0x40 >= headerOldVirtualAddress + 0x40);
		assert(addr + 0x40 < headerOldVirtualAddress + header->bss_end + 0x40);

		addr += (uint32_t)(addr - headerOldVirtualAddress) >= flt_size ?
					bss_displacement : displacement;

		assert((Ptr)addr >= (Ptr)header && (Ptr)addr < (Ptr)header + flt_size
			   || (Ptr)addr >= rState->bssPtr && (Ptr)addr < rState->bssPtr + bss_size);

		addrPtr[3] = addr;
		addrPtr[2] = (addr >>= 8);
		addrPtr[1] = (addr >>= 8);
		addrPtr[0] = (addr >>= 8);
		//*(uint32_t*)addrPtr = addr;
	}

	// We're basically done.
	// Now check whether we're on 68040 or later and need to flush the cache.
	SysEnvRec env;

	env.processor = 0;
	SysEnvirons(0, &env);
	if(env.processor >= env68040)
	{
		FlushCodeCache();
	}
	// accessing globals and calling functions is OK below here.

	rState->headerVirtualAddress += displacement;
}

void Retro68CallConstructors()
{
	char *p = (char*)&__init_section;
	char *e = (char*)&__init_section_end;
	p += 2;
	while( p < e )
	{
		(*(voidFunction)(*(long*)p))();
		p += 6;
	}
}

void Retro68FreeGlobals()
{
	if(relocState.bssPtr != (Ptr) -1)
	{
		DisposePtr(relocState.bssPtr);
		relocState.bssPtr = (Ptr) -1;
	}
}

