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



static long headerVirtualAddress = -sizeof(struct flat_hdr);
static Ptr bssPtr = (Ptr) -1;
static Handle codeHandle = NULL;

#define ACCESS_DISPLACED(VAR) \
	( * (typeof(&VAR)) ((char*)(&VAR) + displacement) )

void Retro68Relocate()
{
	long displacement;
	RETRO68_GET_DISPLACEMENT_STRIP(displacement);

	if(displacement == 0)
	{
		if(bssPtr != (Ptr) -1)
		{
			// this is not the first time, no relocations needed.
			// should only happen for code resources.
			HLock(codeHandle);
			return;
		}
	}

	long headerOldVirtualAddress = ACCESS_DISPLACED(headerVirtualAddress);
	struct flat_hdr *header = (struct flat_hdr*) (headerOldVirtualAddress + displacement);
	uint8_t *base = (uint8_t*) (header+1);

	uint32_t headerOffsetInResource = ((uint32_t*)header)[-1];

	if(headerOffsetInResource < 4096)
		// Arbitrary magic number. We expect the offset to be small, just a few header bytes before it.
	{
		Handle h = RecoverHandle((Ptr) header - headerOffsetInResource);
		if(MemError() == noErr && h)
		{
			HLock(h);
			ACCESS_DISPLACED(codeHandle) = h;
		}
	}

	SysEnvRec env;
	long bss_size;

	env.processor = 0;
	SysEnvirons(0, &env);

	bss_size = header->bss_end - header->data_end;

	long n = header->reloc_count;
	long *relocs = (long*)( (char*)header + header->reloc_start );
	long i;
	long data_end = header->data_end + headerOldVirtualAddress;
	uint32_t flt_size = (uint32_t) header->data_end;
	long bss_displacement = 0;

	Ptr bss = ACCESS_DISPLACED(bssPtr);
	if(bss == (Ptr)-1)
	{
		THz zone = ApplicationZone();
		if(!zone || (char*)header < (char*)zone)
			bss = NewPtrSysClear(bss_size);
		else
			bss = NewPtrClear(bss_size);
		bss_displacement = (long)bss - data_end;
	}

	for(i = 0; i < n; i++)
	{
		uint8_t *addrPtr = base + relocs[i];
		uint32_t addr;

		//addr = *(uint32_t*)addrPtr;
		addr = (((((addrPtr[0] << 8) | addrPtr[1]) << 8) | addrPtr[2]) << 8) | addrPtr[3];

		addr += (uint32_t)(addr - headerOldVirtualAddress) >= flt_size ? bss_displacement : displacement;

		addrPtr[3] = addr;
		addrPtr[2] = (addr >>= 8);
		addrPtr[1] = (addr >>= 8);
		addrPtr[0] = (addr >>= 8);
		//*(uint32_t*)addrPtr = addr;
	}

	if(env.processor >= env68040)
	{
		FlushCodeCache();
	}
	// accessing globals and calling functions is OK below here.

	headerVirtualAddress += displacement;
	bssPtr = bss;
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
	if(bssPtr != (Ptr) -1)
	{
		DisposePtr(bssPtr);
		bssPtr = (Ptr) -1;
	}
}

