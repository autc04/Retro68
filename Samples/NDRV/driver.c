/*
    Copyright 2026 Dustin Hoffman.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
    A native driver that does nothing: the two exports every Device
    Manager 'ndrv' has, TheDriverDescription and DoDriverIO.

    The Driver Loader matches nameInfoStr against the names of the
    devices in the Name Registry, so this driver loads only if some device
    is called "retro68,sample". A real driver for a PCI card puts the name
    Open Firmware gave the card here, e.g. "pci1234,5678".

    Apple's Universal Interfaces declare the native driver interfaces.
    The Multiversal Interfaces do not, so for those the declarations
    this driver needs are below. The layouts are from Apple's "Designing
    PCI Cards and Drivers for Power Macintosh Computers".
*/

#include <MacTypes.h>
#include <Devices.h>

#if __has_include(<DriverServices.h>)

#include <DriverServices.h>

#define kDriverVersion { .majorRev = 0x01, .stage = finalStage }   /* 1.0 */

#else

/* ---- DriverDescription ---- */

enum
{
    kTheDescriptionSignature = 'mtej',
    kInitialDriverDescriptor = 0,

    kDriverIsLoadedUponDiscovery = 1 << 0,
    kDriverIsOpenedUponLoad = 1 << 1,

    kServiceCategoryNdrvDriver = 'ndrv',
    kNdrvTypeIsGeneric = 'genr'
};

typedef struct DriverDescription
{
    OSType driverDescSignature;
    UInt32 driverDescVersion;
    struct
    {
        unsigned char nameInfoStr[32];      /* Str31 */
        NumVersion version;
    } driverType;
    struct
    {
        UInt32 driverRuntime;
        unsigned char driverName[32];       /* Str31 */
        UInt32 driverDescReserved[8];
    } driverOSRuntimeInfo;
    struct
    {
        UInt32 nServices;
        struct
        {
            OSType serviceCategory;
            OSType serviceType;
            NumVersion serviceVersion;
        } service[1];
    } driverServices;
} DriverDescription;

/* ---- DoDriverIO ---- */

typedef UInt32 AddressSpaceID;
typedef struct OpaqueIOCommandID *IOCommandID;
typedef union
{
    ParmBlkPtr pb;              /* open, close, read, write, control, status, killIO */
    void *initialInfo;          /* initialize, replace */
    void *finalInfo;            /* finalize, supersede */
} IOCommandContents;
typedef UInt32 IOCommandCode;
typedef UInt32 IOCommandKind;

enum
{
    kOpenCommand = 0,
    kCloseCommand = 1,
    kReadCommand = 2,
    kWriteCommand = 3,
    kControlCommand = 4,
    kStatusCommand = 5,
    kKillIOCommand = 6,
    kInitializeCommand = 7,
    kFinalizeCommand = 8,
    kReplaceCommand = 9,
    kSupersededCommand = 10
};

enum
{
    kSynchronousIOCommandKind = 0x00000001,
    kAsynchronousIOCommandKind = 0x00000002,
    kImmediateIOCommandKind = 0x00000004
};

OSErr IOCommandIsComplete(IOCommandID theID, OSErr theResult);   /* DriverServicesLib */

#define kDriverVersion 0x01008000   /* 1.0 */

#endif

/* ---- The driver ---- */

DriverDescription TheDriverDescription =
{
    kTheDescriptionSignature,
    kInitialDriverDescriptor,
    { "\pretro68,sample", kDriverVersion },
    { kDriverIsLoadedUponDiscovery | kDriverIsOpenedUponLoad, "\p.Retro68Sample" },
    { 1, { { kServiceCategoryNdrvDriver, kNdrvTypeIsGeneric, kDriverVersion } } }
};

OSErr DoDriverIO(AddressSpaceID spaceID, IOCommandID ID, IOCommandContents contents,
                 IOCommandCode code, IOCommandKind kind)
{
    OSErr err;

    switch(code)
    {
        case kInitializeCommand:
        case kReplaceCommand:
        case kFinalizeCommand:
        case kSupersededCommand:
        case kOpenCommand:
        case kCloseCommand:
            err = noErr;
            break;
        case kControlCommand:
            err = controlErr;
            break;
        case kStatusCommand:
            err = statusErr;
            break;
        case kReadCommand:
            err = readErr;
            break;
        case kWriteCommand:
            err = writErr;
            break;
        default:
            err = paramErr;
            break;
    }

        /* Initialize, finalize, replace and supersede return their result;
           an immediate request does too. Anything else is completed by
           IOCommandIsComplete, whether it was made synchronously or not. */
    if(code == kInitializeCommand || code == kReplaceCommand
            || code == kFinalizeCommand || code == kSupersededCommand
            || (kind & kImmediateIOCommandKind))
        return err;
    return IOCommandIsComplete(ID, err);
}
