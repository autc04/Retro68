#include <OSUtils.h>
#include <Traps.h>
#include <Resources.h>
#include <Memory.h>
#include <Processes.h>
#include <stdint.h>
#include "PoorMansDebugging.h"

#include "Retro68Runtime.h"

static UniversalProcPtr OriginalLoadSeg;
static UniversalProcPtr OriginalUnloadSeg;
static UniversalProcPtr OriginalExitToShell;
static UniversalProcPtr OriginalLaunch;
static UniversalProcPtr OriginalChain;

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

#define StripAddressCompat(p) (relocState.hasStripAddr ? StripAddress(p) : StripAddress24(p))

pascal void* Retro68LoadSegment(uint8_t *p)
{
    union JTEntry *jtEntry = (JTEntry*) (p - 4);
    
    short id = jtEntry->far.id;
    uint32_t offset = jtEntry->far.offset;
    
    /*{
        char buf[256];
        sprintf(buf+1, "Loading seg %d.;g", id);
        buf[0] = strlen(buf+1);
        DebugStr((unsigned char*) buf);
    }*/

    // TODO: UseResFile?
    Handle CODE = GetResource('CODE', id);
    assert(CODE);
    HLock(CODE);
    
    uint8_t *base = StripAddressCompat((uint8_t *)*CODE);
    CODEHeader *header = (CODEHeader*) base;
    uint32_t codeSize = GetHandleSize(CODE);

    uint8_t * a5 = (uint8_t*) StripAddressCompat((void*)SetCurrentA5());
    
    if(header->loadAddress != base || header->currentA5 != a5)
    {
        long displacements[4] = {
                base - header->loadAddress,    // code
                a5 - header->currentA5,    
                a5 - header->currentA5,
                a5 - header->currentA5
        };
        
        header->loadAddress = base;
        header->currentA5 = a5;

        Handle RELA = NULL;
        RELA = GetResource('RELA', id);
        assert(RELA);
        Retro68ApplyRelocations(base + 40, codeSize - 40, *RELA, displacements);
        HPurge(RELA);
    }

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
    
    if(relocState.hasFlushCodeCache)
        FlushCodeCache();
    
    /* Load Exception Information */
    if (__register_frame_info)
    {
        int32_t offset =  ((int32_t*) (base + codeSize))[-1];
        void *eh_frame_info = base + codeSize - 4 + offset;
        struct object *object = (struct object*) (base + codeSize - 36);
        __register_frame_info(eh_frame_info, object);
    }
    return base + offset;
}

static pascal void PatchedUnloadSeg(Ptr ptr)
{
    union JTEntry *jtEntry = (JTEntry*) (ptr - 2);
    if(jtEntry->jmp.jmp != 0x4EF9)
        return; // not loaded or invalid pointer.

    int id = jtEntry->jmp.id;
    Handle CODE = GetResource('CODE', id);
    uint8_t *base = StripAddressCompat((uint8_t *)*CODE);
    CODEHeader *header = (CODEHeader*) base;
    uint32_t codeSize = GetHandleSize(CODE);

    // TODO: check header->magic, pass on to original UnloadSeg?


    /* Load Exception Information */
    if (__register_frame_info)
    {
        int32_t offset =  ((int32_t*) (base + codeSize))[-1];
        void *eh_frame_info = base + codeSize - 4 + offset;
        __deregister_frame_info(eh_frame_info);
    }


    uint8_t * a5 = (uint8_t*) StripAddressCompat((void*)SetCurrentA5());

    // FIXME: hardcoded JT offset, there is a LM global for this somewhere:
    jtEntry = (JTEntry*) (a5 + 32 + header->farEntryOffset);
    int n = header->nFarEntries;
    while(n--)
    {
        if(jtEntry->jmp.jmp == 0x4EF9 && jtEntry->jmp.id == id)
        {
            uint32_t offset = (uint8_t*) jtEntry->jmp.addr - base;
            jtEntry->far.loadseg = _LoadSeg;
            jtEntry->far.offset = offset;
        }
        ++jtEntry;
    }
    if(relocState.hasFlushCodeCache)
        FlushCodeCache();

    HUnlock(CODE);
    HPurge(CODE);
}

static void InstallPatches();
static void UninstallPatches();

static pascal void PatchedExitToShell()
{
    UninstallPatches();
    ExitToShell();
}

#pragma parameter __D0 Launch(__A0)
OSErr Launch(void *param) = { 0xA9F2 };

#pragma parameter __D0 Chain(__A0)
OSErr Chain(void *param) = { 0xA9F2 };

#pragma parameter __D0 PatchedLaunch(__A0)
static OSErr PatchedLaunch(void *p)
{
    UninstallPatches();
    OSErr err = Launch(p);
    InstallPatches();
    return err;
}

#pragma parameter __D0 PatchedChain(__A0)
static OSErr PatchedChain(void *p)
{
    UninstallPatches();
    OSErr err = Chain(p);
    InstallPatches();
    return err;
}

static void InstallPatches()
{
    SetToolTrapAddress((UniversalProcPtr)&PatchedLoadSeg, _LoadSeg);
    SetToolTrapAddress((UniversalProcPtr)&PatchedUnloadSeg, _UnLoadSeg);
    SetToolTrapAddress((UniversalProcPtr)&PatchedExitToShell, _ExitToShell);
    SetToolTrapAddress((UniversalProcPtr)&PatchedLaunch, _Launch);
    SetToolTrapAddress((UniversalProcPtr)&PatchedChain, _Chain);
}

static void UninstallPatches()
{
    SetToolTrapAddress((UniversalProcPtr)OriginalLoadSeg, _LoadSeg);
    SetToolTrapAddress((UniversalProcPtr)OriginalUnloadSeg, _UnLoadSeg);
    SetToolTrapAddress((UniversalProcPtr)OriginalExitToShell, _ExitToShell);
    SetToolTrapAddress((UniversalProcPtr)OriginalLaunch, _Launch);
    SetToolTrapAddress((UniversalProcPtr)OriginalChain, _Chain);
}


// section boundaries
extern uint8_t _stext, _etext, _sdata, _edata, _sbss[], _ebss;

void Retro68InitMultisegApp()
{
    uint8_t * a5 = (uint8_t*) StripAddressCompat((void*)SetCurrentA5());

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
    if(relocState.hasFlushCodeCache)
        FlushCodeCache();

    // Zero-initialize bss
    for(uint32_t *p = (uint32_t*) &_sbss;
        p < (uint32_t*) &_ebss; ++p)
        *p = 0;
    
    // Set up patched LoadSeg

    // NOTE: OriginalLoadSeg is the first global variable we can use
    OriginalLoadSeg = GetToolTrapAddress(_LoadSeg);
    OriginalUnloadSeg = GetToolTrapAddress(_UnLoadSeg);
    OriginalExitToShell = GetToolTrapAddress(_ExitToShell);
    OriginalLaunch = GetToolTrapAddress(_Launch);
    OriginalChain = GetToolTrapAddress(_Chain);
    InstallPatches();

    // Load and relocate statically initialized DATA
    Handle DATA = GetResource('DATA', 0);
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
    ReleaseResource(RELA);
}
