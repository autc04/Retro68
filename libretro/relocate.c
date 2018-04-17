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
#include <Resources.h>

#include "Retro68Runtime.h"
#include "PoorMansDebugging.h"

typedef void (*voidFunction)(void);

/*
   Linker-defined addresses in the binary;
 */

	// absolute address 0x1 for multiseg applications,
	// absolute address NULL (or undefined) for code resources
extern uint8_t _MULTISEG_APP __attribute__ ((weak));

// section boundaries
extern uint8_t _stext, _etext, _sdata, _edata, _sbss, _ebss;
// constructor list:
extern uint8_t __init_section, __init_section_end;
// destructor list:
extern uint8_t __fini_section, __fini_section_end;
// address of start of code reource.
// usually equal to _stext, but can be overridden.
extern uint8_t _rsrc_start;

extern voidFunction __CTOR_LIST__, __DTOR_LIST__;
extern uint8_t __EH_FRAME_BEGIN__;


Retro68RelocState relocState __attribute__ ((section(".relocvars"))) = {
	NULL, NULL, false, false
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

#if 0
void Retro68ApplyRelocations(uint8_t *base, uint32_t size, void *relocations, uint32_t displacements[])
{
	uint32_t *reloc = (uint32_t*) relocations;
	// Process relocation records
	for(;*reloc != -1;++reloc)
	{
		uint32_t r = *reloc;
		uint8_t *addrPtr = base + (r & 0xFFFFFF);
		uint8_t *addr;
		uint8_t kind = r >> 24;

		assert(addrPtr >= base);
		assert(addrPtr < base + size);

		addr = (uint8_t*) READ_UNALIGNED_LONGWORD(addrPtr);
		addr += displacements[kind];
		WRITE_UNALIGNED_LONGWORD(addrPtr, (uint32_t) addr);
	}
}
#else
void Retro68ApplyRelocations(uint8_t *base, uint32_t size, void *relocations, uint32_t displacements[])
{
	uint8_t *reloc = (uint8_t*) relocations;
	uint8_t *addrPtr = base - 1;
	while(*reloc)
	{
		    // read an uleb128 value
		uint32_t val = 0;
		uint8_t b;
		int i = 0;
		do
		{
			b = *reloc++;
			val |= (b & 0x7F) << i;
			i += 7;
		} while(b & 0x80);

		    // ... which consists of an offset and the displacement base index
		    // the offset is relative to the previous relocation, or to base-1
		addrPtr += val >> 2;
		uint8_t kind = val & 0x3;

		assert(addrPtr >= base);
		assert(addrPtr < base + size);

		uint8_t *addr = (uint8_t*) READ_UNALIGNED_LONGWORD(addrPtr);
		addr += displacements[kind];
		WRITE_UNALIGNED_LONGWORD(addrPtr, (uint32_t) addr);
	}
}
#endif

void Retro68Relocate()
{
	// memory address to retrieve the ROM type (64K or a later ROM)
	// see for details http://www.mac.linux-m68k.org/devel/macalmanac.php
	short* ROM85      = (short*) 0x028E;
	
	// figure out which trap is supported
	Boolean is128KROM = ((*ROM85) > 0);
	Boolean hasSysEnvirons = false;
	Boolean hasStripAddr = false;
	Boolean hasFlushCodeCache = false;
	if (is128KROM)
	{
		UniversalProcPtr trapSysEnv = GetOSTrapAddress(_SysEnvirons);
		UniversalProcPtr trapStripAddr = GetOSTrapAddress(_StripAddress);
		UniversalProcPtr trapFlushCodeCache = GetOSTrapAddress(0xA0BD);
		UniversalProcPtr trapUnimpl = GetOSTrapAddress(_Unimplemented);

		hasSysEnvirons = (trapSysEnv != trapUnimpl);
		hasStripAddr = (trapStripAddr != trapUnimpl);
		hasFlushCodeCache = (trapFlushCodeCache != trapUnimpl);
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
	// 
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
        
	rState->hasStripAddr = hasStripAddr;
	rState->hasFlushCodeCache = hasFlushCodeCache;

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

	long bss_displacement = 0;
	long data_displacement = 0;
	long jt_displacement = 0;
	
	if(&_MULTISEG_APP)
	{
		uint8_t * a5 = (uint8_t*) SetCurrentA5();
		bss_displacement = a5 - orig_ebss;
		data_displacement = a5 - orig_ebss;
		jt_displacement = a5 - (uint8_t*)NULL;
	}
	else
	{
		data_displacement = displacement;
#if 0
        // find the beginning of the current code resource and lock it.
        // this crashes with some implementations of the memory manager
        // if we guess wrong, so let's don't for now.
        // Therefore, all Retro68-compiled code resources have to be locked,
        // or they might get relocated as soon as the global variables are
        // relocated below.
        // TODO: figure out a way to reliably determine the offset from the
        //       start of the resource (to pass it from Elf2Mac, probably).

		{
			uint8_t *orig_rsrc_start;
			GET_VIRTUAL_ADDRESS(orig_rsrc_start, _rsrc_start);
			uint8_t *rsrc_start = orig_rsrc_start + displacement;
			
			Handle h = RecoverHandle((Ptr) rsrc_start);        
			if(MemError() == noErr && h)
			{
				// Make sure the code is locked. Only relevant for some code resources.
				HLock(h);
				rState->codeHandle = h;  
			}
		}
#endif	
		// Allocate BSS section (uninitialized/zero-initialized global data)
		if(!rState->bssPtr)
		{
			uint32_t bss_size = orig_ebss - orig_sbss;
			THz zone = ApplicationZone();
			if(!zone || base < (uint8_t*)zone)
				rState->bssPtr = NewPtrSysClear(bss_size);
			else
				rState->bssPtr = NewPtrClear(bss_size);
			bss_displacement = (uint8_t*)rState->bssPtr - orig_sbss;
		}
	}	
	
	/*
 		Relocation records consist of 4 bytes each.
		The lower three bytes are the offset of the longword being relocated.
		the first byte of each longword specifies which segment
		the relocation leads to; the corresponding displacements are taken
		from the following table:
	 */
	long displacements[4] = {
			displacement,	// code
			data_displacement,
			bss_displacement,
			jt_displacement
	};
	
	void *reloc;
	Handle RELA = NULL;
	uint32_t relocatableSize;
	if(&_MULTISEG_APP == (uint8_t*)1)
	{
		RELA = Get1Resource('RELA', 1);
		assert(RELA);
		reloc = *RELA;
		uint32_t text_size = orig_etext - orig_stext;
		relocatableSize = text_size;
	}
	else
	{
		uint32_t text_and_data_size = orig_edata - orig_stext;
		reloc = base + text_and_data_size;
		relocatableSize = text_and_data_size;
	}
	
	typedef typeof(&Retro68ApplyRelocations) ApplyRelocationsPtr;
	ApplyRelocationsPtr RealApplyRelocations;
	RealApplyRelocations = (ApplyRelocationsPtr) ((uint8_t*)&Retro68ApplyRelocations + displacement);
	RealApplyRelocations(base, relocatableSize, reloc, displacements);

	// We're basically done.
	/*// Now check whether we're on 68040 or later and need to flush the cache.
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
                        rState->needFlushCache = true;
			FlushCodeCache();
		}
	}*/
	if(hasFlushCodeCache)
		FlushCodeCache();

	// accessing globals and calling functions is OK below here.
	// ... as long as it is in the current segment.

	Retro68InitMultisegApp();
	
	// Now we're set.
	// Someone still needs to invoke Retro68CallConstructors
	// ... but that's the job of _start(). 
}

void Retro68CallConstructors()
{
	static struct object object;
	if (__register_frame_info)
		__register_frame_info(&__EH_FRAME_BEGIN__, &object);
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
	{
		voidFunction *p, f;
		for(p = &__CTOR_LIST__; (f = *p); p++)
			f();
	}
}

void Retro68CallDestructors()
{
	{
		voidFunction *p, f;
		for(p = &__DTOR_LIST__; (f = *p); p++)
			f();
	}
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
	if (__deregister_frame_info)
		__deregister_frame_info(&__EH_FRAME_BEGIN__);
}


void Retro68FreeGlobals()
{
	if(relocState.bssPtr != (Ptr) -1)
	{
		DisposePtr(relocState.bssPtr);
		relocState.bssPtr = (Ptr) -1;
	}
}
