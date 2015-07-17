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



static long headerVirtualAddress = -0x40;
static Ptr savedBSS = (Ptr) -1;

#define ACCESS_DISPLACED(VAR) \
	( * (typeof(&VAR)) ((char*)(&VAR) + displacement) )

void Retro68Relocate()
{
	long displacement;
	RETRO68_GET_DISPLACEMENT(displacement);

	struct flat_hdr *header = (struct flat_hdr*) (ACCESS_DISPLACED(headerVirtualAddress) + displacement);

	SysEnvRec env;
	long bss_size;

	env.processor = 0;
	SysEnvirons(0, &env);

	bss_size = header->bss_end - header->data_end;

	long n = header->reloc_count;
	long *relocs = (long*)( (char*)header + header->reloc_start );
	long i;
	long data_end = header->data_end - 0x40;
	long bss_displacement = 0;

	Ptr bss = ACCESS_DISPLACED(savedBSS);
	if(bss == (Ptr)-1)
	{
		bss = NewPtrClear(bss_size);
		bss_displacement = (long)bss - data_end;
	}

	for(i = 0; i < n; i++)
	{
		uint8_t *addrPtr = (uint8_t*)(relocs[i] + displacement);
		long addr;

		addr = (addrPtr[0] << 24) | (addrPtr[1] << 16) | (addrPtr[2] << 8) | addrPtr[3];

		addr += addr >= data_end ? bss_displacement : displacement;

		addrPtr[0] = addr >> 24;
		addrPtr[1] = addr >> 16;
		addrPtr[2] = addr >> 8;
		addrPtr[3] = addr;
	}

	if(env.processor >= env68040)
	{
		FlushCodeCache();
	}
	// accessing globals and calling functions is OK below here.

	headerVirtualAddress += displacement;
	savedBSS = bss;
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
