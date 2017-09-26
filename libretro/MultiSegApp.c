#include <OSUtils.h>
#include <Traps.h>
#include <Resources.h>
#include <Memory.h>
#include <stdint.h>
#include "PoorMansDebugging.h"

#include "Retro68Runtime.h"

static pascal void (*OriginalLoadSeg)(short id);
static pascal void (*OriginalUnloadSeg)(void *ptr);
static pascal void (*OriginalExitToShell)();

extern pascal void PatchedLoadSeg();

typedef union JTEntry
{
    struct {
        uint16_t offset;
        uint16_t push;
        int16_t id;
        uint16_t loadseg;
    } near;
    struct {
        int16_t id;
        uint16_t loadseg;
        uint32_t offset;
    } far;
    struct {
        int16_t id;
        uint16_t jmp;
        void* addr;
    } jmp;

} JTEntry;

typedef struct CODEHeader
{
    int16_t magic0;
    int16_t magic1;
    uint32_t nearEntryOffset;
    uint32_t nNearEntries;
    uint32_t farEntryOffset;
    uint32_t nFarEntries;
    uint32_t a5relocOffset;
    uint8_t *currentA5;
    uint32_t relocOffset;
    uint8_t *loadAddress;
    uint32_t reserved;
} CODEHeader;

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


pascal void* Retro68LoadSegment(uint8_t *p)
{
    union JTEntry *jtEntry = (JTEntry*) (p - 4);
    
    short id = jtEntry->far.id;
    uint32_t offset = jtEntry->far.offset;
    
    // TODO: UseResFile?
    Handle CODE = GetResource('CODE', id);
    HLock(CODE);
    
    uint8_t *base = StripAddress((uint8_t *)*CODE);
    CODEHeader *header = (CODEHeader*) base;
    uint32_t codeSize = GetHandleSize(CODE);
    
        // TODO: StripAddress24
    uint8_t * a5 = (uint8_t*) StripAddress((void*)SetCurrentA5());
    
    if(header->loadAddress != base || header->currentA5 != a5)
    {
        long displacements[4] = {
    			base - header->loadAddress,	// code
    			a5 - header->currentA5,	
    			a5 - header->currentA5,
    			a5 - header->currentA5
    	};
    	
        header->loadAddress = base;
        header->currentA5 = a5;
        
    	Handle RELA = NULL;
    	RELA = GetResource('RELA', id);
    	assert(RELA);
        Retro68ApplyRelocations(base + 40, codeSize, *RELA, displacements);
    }
    else   
        DebugStr("\prelocation unnecessary???");


    /* Update JT Entries */
        // FIXME: hardcoded JT offset, there is a LM global for this somewhere:
    jtEntry = (JTEntry*) (a5 + 32 + header->farEntryOffset);
    int n = header->nFarEntries;
    while(n--)
    {
        void * addr = base + jtEntry->far.offset;
        //jtEntry->jmp.id = jtEntry->far.id;
        jtEntry->jmp.jmp = 0x4EF9;
        jtEntry->jmp.addr = addr;
        ++jtEntry;
    }
    
    // TODO: Flush cache
    
    /* Load Exception Information */
    if (__register_frame_info)
    {
        int32_t offset =  ((int32_t*) (base + codeSize))[-1];
        void *eh_frame_info = *(void**) (base + codeSize + offset);
        struct object *object = (struct object*) (base + codeSize - 36);
        __register_frame_info(eh_frame_info, object);
    }
    return base + offset;
}

static pascal void PatchedUnloadSeg(void *ptr)
{
    
}
static pascal void PatchedExitToShell()
{
    SetToolTrapAddress((UniversalProcPtr)OriginalLoadSeg, _LoadSeg);
    SetToolTrapAddress((UniversalProcPtr)OriginalUnloadSeg, _UnLoadSeg);
    SetToolTrapAddress((UniversalProcPtr)OriginalExitToShell, _ExitToShell);
    OriginalExitToShell();
}

// section boundaries
extern uint8_t _stext, _etext, _sdata, _edata, _sbss, _ebss;

void Retro68InitMultisegApp()
{
    uint8_t * a5 = (uint8_t*) StripAddress((void*)SetCurrentA5());

    // CODE Segment 1 is already loaded - we are in it.
    // Update the jump table addresses.
    JTEntry *jtEntry = (JTEntry*) (a5 + 32 + 16); // TODO: hardcoded offsets
    while(jtEntry->far.id == 1)
    {
        void * addr = &_stext - 4 + jtEntry->far.offset;
        //jtEntry->jmp.id = jtEntry->far.id;
        jtEntry->jmp.jmp = 0x4EF9;
        jtEntry->jmp.addr = addr;
        ++jtEntry;
    }
    
    // Zero-initialize bss
    for(uint32_t *p = (uint32_t*) &_sbss;
        p < (uint32_t*) &_ebss; ++p)
        *p = 0;
    
    // Set up patched LoadSeg
    
    // NOTE: OriginalLoadSeg is the first global variable we can use
    OriginalLoadSeg = (void(*)(short)) GetToolTrapAddress(_LoadSeg);
    OriginalUnloadSeg = (void(*)(void*)) GetToolTrapAddress(_UnLoadSeg);
    OriginalExitToShell = (void(*)()) GetToolTrapAddress(_ExitToShell);
    SetToolTrapAddress((UniversalProcPtr)&PatchedLoadSeg, _LoadSeg);
    SetToolTrapAddress((UniversalProcPtr)&PatchedUnloadSeg, _UnLoadSeg);
    SetToolTrapAddress((UniversalProcPtr)&PatchedExitToShell, _ExitToShell);

    // Load and relocate statically initialized DATA
    Handle DATA = Get1Resource('DATA', 0);
    BlockMoveData(*DATA, &_sdata, &_edata - &_sdata);
    ReleaseResource(DATA);

    long displacements[4] = {
            0,
            a5 - (uint8_t*)NULL,
            a5 - (uint8_t*)NULL,
            a5 - (uint8_t*)NULL
    };
        
    Handle RELA = NULL;
    RELA = GetResource('RELA', 0);
    assert(RELA);
    Retro68ApplyRelocations(&_sdata, &_edata - &_sdata, *RELA, displacements);

}
