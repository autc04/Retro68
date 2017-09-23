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
#include <stdlib.h>

#include <Processes.h>
#include <Sound.h>
#include <Memory.h>
#include <OSUtils.h>
#include <Traps.h>

#include "Retro68Runtime.h"
#include "PoorMansDebugging.h"

typedef void (*voidFunction)(void);

/*
   Linker-defined addresses in the binary;
 */
extern uint8_t _stext, _etext, _sdata, _edata, _sbss, _ebss;
extern uint8_t __init_section, __init_section_end;
extern uint8_t __fini_section, __fini_section_end;

typedef struct Retro68RelocState
{
	Ptr bssPtr;
	Handle codeHandle;
} Retro68RelocState;

static Retro68RelocState relocState __attribute__ ((nocommon, section(".text"))) = {
	NULL, NULL
};


#define GET_VIRTUAL_ADDRESS(NAME, SYM) \
	do {	\
		__asm__( "\tlea " #SYM ", %0\n"	\
				 : "=a"(NAME) );	\
		if(hasStripAddr) \
			NAME = StripAddress(NAME);	\
		else					\
			NAME = StripAddress24(NAME);	\
	} while(0)

#define READ_UNALIGNED_LONGWORD(ptr)	\
	(((((((ptr)[0] << 8) | (ptr)[1]) << 8) | (ptr)[2]) << 8) | (ptr)[3])
#define WRITE_UNALIGNED_LONGWORD(ptr, val)	\
	do {	\
		uint32_t _a = (val);	\
		uint8_t *_ptr = (ptr);	\
		_ptr[3] = _a;	\
		_ptr[2] = (_a >>= 8);	\
		_ptr[1] = (_a >>= 8);	\
		_ptr[0] = (_a >>= 8);	\
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
	
	uint8_t *base = orig_stext + displacement;
	// Recover the handle to the code resource by looking at the
	// longword before the FLT header. The resource templates in Retro68.r store the offset
	// from the beginning of the code resource there.
	uint32_t offsetInResource = *(uint32_t*)(base - 0x44) + 0x40;
	
	if(offsetInResource < 4096)
		// Arbitrary magic number. We expect the offset to be small, just a few header bytes before it.
		// if it's out of range, assume the longword before the header is not the offset we're looking for.
	{   
		Handle h = RecoverHandle((Ptr) base - offsetInResource);        
		if(MemError() == noErr && h)
		{                    
			// Make sure the code is locked. Only relevant for some code resources.
			HLock(h);
			rState->codeHandle = h;  
		}
	}
	
	uint32_t text_and_data_size = orig_edata - orig_stext;
	long bss_size = orig_ebss - orig_sbss;
		
	//uint32_t total_size = orig_ebss - orig_stext; // FIXME: not true for repeated reloc
	//assert(total_size == header->bss_end - sizeof(*header));
	
	long bss_displacement = 0;
	// Allocate BSS section (uninitialized/zero-initialized global data)
	if(!rState->bssPtr)
	{
		THz zone = ApplicationZone();
		if(!zone || base < (uint8_t*)zone)
			rState->bssPtr = NewPtrSysClear(bss_size);
		else
			rState->bssPtr = NewPtrClear(bss_size);
		bss_displacement = (uint8_t*)rState->bssPtr - orig_sbss;
	}

	long i;
	// Process relocation records
	
	for(long *reloc = (long*)( base + text_and_data_size );
		*reloc != -1;
		++reloc)
	{
		uint8_t *addrPtr = base + *reloc;
		uint8_t *addr;

		assert(addrPtr >= base);
		assert(addrPtr < base + text_and_data_size);

		addr = (uint8_t*) READ_UNALIGNED_LONGWORD(addrPtr);

		/* Check whether addresses are in range.
		 * This doesn't seem to work because exception handling tables
		 * seem to contain strange things.
		 */
		/*assert((uint8_t*)addr >= orig_stext); // TODO: not right for repeated reloc
		assert((uint8_t*)addr <= orig_stext + total_size);*/

		addr += (addr - orig_stext) >= text_and_data_size ?
					bss_displacement : displacement;

		/*assert((Ptr)addr >= (Ptr)base && (Ptr)addr <= (Ptr)base + text_and_data_size
			   || (Ptr)addr >= rState->bssPtr && (Ptr)addr <= rState->bssPtr + bss_size);*/

		WRITE_UNALIGNED_LONGWORD(addrPtr, (uint32_t) addr);
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
	uint8_t *p = &__init_section;
	uint8_t *e = &__init_section_end;
	p += 2;
	while( p < e )
	{
		(*(voidFunction)(*(long*)p))();
		p += 6;
	}
}

void Retro68CallDestructors()
{
	uint8_t *p = &__fini_section;
	uint8_t *e = &__fini_section_end;
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

