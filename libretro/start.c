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


int main(int argc, char* argv[]);

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


void _start()
{
	
	long virtualstart, realstart;
	
	__asm__( "move.l #_start, %0" : "=r"(virtualstart) );
	__asm__( "lea (_start:w,%%pc), %0" : "=a"(realstart) );
	
	long displacement = realstart - virtualstart; 
	
	struct flat_hdr *header = (struct flat_hdr*) (displacement - 0x40);
	
	SysEnvRec env;
	long bss_size;
	
	env.processor = 0;
	SysEnvirons(0, &env);

	bss_size = header->bss_end - header->data_end;
	Ptr bss = NewPtrClear(bss_size);

	long n = header->reloc_count;
	long *relocs = (long*)( (char*)header + header->reloc_start );
	long i;
	long data_end = header->data_end - 0x40;
	long bss_displacement = (long)bss - data_end;
	
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
	
	int result;
	{
		char *argv[2] = { "./a.out", NULL };
		result = main(1, argv);
	}
	exit(result);
}
