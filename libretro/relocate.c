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
#include <Traps.h>

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
	Ptr bssPtr;
	Handle codeHandle;
} Retro68RelocState;
extern uint8_t _stext, _etext, _sdata, _edata, _sbss, _ebss;

static Retro68RelocState relocState __attribute__ ((nocommon, section(".text"))) = {
	NULL, NULL
};

	/* a simple version of assert - on failure, the line number is output
	 * using DebugStr. */
#if 0
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

#if 0
#define log(x) do { } while(0)
#else
#define log(x) do { \
		{\
			unsigned char str[10];	\
			int ___i;	\
			unsigned l = (x); \
			for(___i = 2; ___i < 10; ___i++)	\
				str[___i] = ' ';	\
			str[0] = 9;	\
			str[1] = 'L';	\
			str[9] = '0';	\
			for(___i = 8; l && ___i > 1; ___i--)	\
			{	\
				str[___i] = '0' + (l & 0xF);	\
				if((l & 0xF) >= 0xA) \
					str[___i] = 'A' - 10 + (l&0xF); \
				l >>= 4;	\
			}	\
			DebugStr(str);	\
		}	\
	} while(0)

#endif

#define GET_VIRTUAL_ADDRESS(NAME, SYM) \
	do {	\
		__asm__( "\tlea " #SYM ", %0\n"	\
				 : "=a"(NAME) );	\
		if(hasStripAddr) \
			NAME = StripAddress(NAME);	\
		else					\
			NAME = StripAddress24(NAME);	\
	} while(0)


void Retro68Relocate()
{
	// memory address to retrieve the ROM type (64K or a later ROM)
	// see for details http://www.mac.linux-m68k.org/devel/macalmanac.php
	short* ROM85      = (short*) 0x028E;
	
	// figure out which trap is supported
	Boolean is128KROM = ((*ROM85) > 0);
	Boolean hasSysEnvirons = false;
	Boolean hasStripAddr = false;
	if (is128KROM)
	{
		UniversalProcPtr trapSysEnv = GetOSTrapAddress(_SysEnvirons);
		UniversalProcPtr trapStripAddr = GetOSTrapAddress(_StripAddress);
		UniversalProcPtr trapUnimpl = GetOSTrapAddress(_Unimplemented);

		hasSysEnvirons = (trapSysEnv != trapUnimpl);
		hasStripAddr = (trapStripAddr != trapUnimpl);
	}
					
	// Figure out the displacement
	// what is the difference between the addresses in our program code
	// and an address calculated by PC-relative access?
	long displacement;
	
	if (hasStripAddr)
	{
		RETRO68_GET_DISPLACEMENT_STRIP(displacement); 
	}
	else
	{
		RETRO68_GET_DISPLACEMENT_STRIP24(displacement);
	}

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
			if(rState->codeHandle)
				HLock(rState->codeHandle);
			return;
		}
	}

	// Locate the start of the FLT file header inside the code resource
	uint8_t *orig_stext, *orig_etext, *orig_sdata, *orig_edata, *orig_sbss, *orig_ebss;
	
	GET_VIRTUAL_ADDRESS(orig_stext, _stext);
	GET_VIRTUAL_ADDRESS(orig_etext, _etext);
	GET_VIRTUAL_ADDRESS(orig_sdata, _sdata);
	GET_VIRTUAL_ADDRESS(orig_edata, _edata);
	GET_VIRTUAL_ADDRESS(orig_sbss, _sbss);
	GET_VIRTUAL_ADDRESS(orig_ebss, _ebss);
	
	log(orig_stext);
	log(orig_etext);
	log(orig_sdata);
	log(orig_edata);
	log(orig_sbss);
	log(orig_ebss);
	
	uint8_t *base = (uint8_t*) (orig_stext + displacement);
	struct flat_hdr *header = ((struct flat_hdr*) (orig_stext + displacement)) - 1;
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
	
	long bss_size = &_ebss - &_sbss;
	

	long n = header->reloc_count;
	long *relocs = (long*)( (char*)header + header->reloc_start );

	long i;
	uint32_t text_and_data_size = orig_edata - orig_stext;
	uint32_t total_size = orig_ebss - orig_stext; // FIXME: not true for repeated reloc
	long bss_displacement = 0;
		
	assert(text_and_data_size == header->data_end - sizeof(*header));
	assert((uint8_t*)relocs == base + text_and_data_size);
	assert(total_size == header->bss_end - sizeof(*header));
	
	// Allocate BSS section (uninitialized/zero-initialized global data)
	if(!rState->bssPtr)
	{
		THz zone = ApplicationZone();
		if(!zone || (uint8_t*)header < (uint8_t*)zone)
			rState->bssPtr = NewPtrSysClear(bss_size);
		else
			rState->bssPtr = NewPtrClear(bss_size);
		bss_displacement = (uint8_t*)rState->bssPtr - &_sbss;
	}

	// Process relocation records
	for(i = 0; i < n; i++)
	{
		//Debugger();
		uint8_t *addrPtr = base + relocs[i];
		uint32_t addr;

		/*log(relocs + i);
		log(relocs[i]);*/
		assert((Ptr)addrPtr >= (Ptr)base);
		assert((Ptr)addrPtr < (Ptr)base + text_and_data_size);

		//addr = *(uint32_t*)addrPtr;
		addr = (((((addrPtr[0] << 8) | addrPtr[1]) << 8) | addrPtr[2]) << 8) | addrPtr[3];

		//log(addr);

		/* Check whether addresses are in range.
		 * This doesn't seem to work because exception handling tables
		 * seem to contain strange things.
		 */
		/*assert((uint8_t*)addr >= orig_stext); // TODO: not right for repeated reloc
		assert((uint8_t*)addr <= orig_stext + total_size);*/

		addr += (addr - (uint32_t)orig_stext) >= text_and_data_size ?
					bss_displacement : displacement;

		/*assert((Ptr)addr >= (Ptr)base && (Ptr)addr <= (Ptr)base + text_and_data_size
			   || (Ptr)addr >= rState->bssPtr && (Ptr)addr <= rState->bssPtr + bss_size);*/

		addrPtr[3] = addr;
		addrPtr[2] = (addr >>= 8);
		addrPtr[1] = (addr >>= 8);
		addrPtr[0] = (addr >>= 8);
		//*(uint32_t*)addrPtr = addr;
	}
	
	// We're basically done.
	// Now check whether we're on 68040 or later and need to flush the cache.
	// only do this if SysEnvirons is available.
	// if SysEnvirons is not available, that means we're on an old System or ROM
	// and likely not using a 68040, so we won't do this
	if (hasSysEnvirons)
	{
		SysEnvRec env;

		env.processor = 0;
		SysEnvirons(0, &env);
		if(env.processor >= env68040)
		{
			FlushCodeCache();
		}
	}
	
	// accessing globals and calling functions is OK below here.
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

void Retro68CallDestructors()
{
	char *p = (char*)&__fini_section;
	char *e = (char*)&__fini_section_end;
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

