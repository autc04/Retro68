#include "AppLauncher.h"

#include <AppleEvents.h>
#include <vector>
#include <string.h>

class ToolLauncher : public AppLauncher
{
    bool replyReceived;
    AEEventHandlerUPP replyHandler = nullptr;

    Handle buildCommandLine(ConstStr255Param name)
    {
        CInfoPBRec pb;
        memset(&pb, 0, sizeof(pb));

        pb.hFileInfo.ioNamePtr = (StringPtr)name;
        PBGetCatInfoSync(&pb);
        long dirID = pb.hFileInfo.ioFlParID;

        std::vector<unsigned long> dirIDs;

        while(dirID != 2)
        {
            dirIDs.push_back(dirID);
            
            pb.dirInfo.ioNamePtr = 0;
            pb.dirInfo.ioDrDirID = dirID;
            pb.dirInfo.ioFDirIndex = -1;
            PBGetCatInfoSync(&pb);

            dirID = pb.dirInfo.ioDrParID;
        } while(dirID != 2);

        dirIDs.push_back(dirID);

        Handle text;
        PtrToHand("\"", &text, 1);
        
        for(int i = dirIDs.size() - 1; i >= 0; i--)
        {
            Str32 dirName;
            pb.dirInfo.ioNamePtr = dirName;
            pb.dirInfo.ioDrDirID = dirIDs[i];
            pb.dirInfo.ioFDirIndex = -1;
            PBGetCatInfoSync(&pb);
            PtrAndHand(dirName+1, text, dirName[0]);
            PtrAndHand(":", text, 1);
        }

        long sz1 = GetHandleSize(text);
        
        PtrAndHand(name+1, text, name[0]);
        PtrAndHand("\" > ", text, 4);

        long sz2 = GetHandleSize(text);
        SetHandleSize(text, sz2 + sz1 + 4);
        memcpy((*text) + sz2, *text, sz1);
        memcpy((*text) + sz1 + sz2, "out\"", 4);

        return text;
    }

    static pascal OSErr handleReply(const AppleEvent *theAppleEvent, AppleEvent *reply, long handlerRefcon)
    {
        ToolLauncher *self = (ToolLauncher*)handlerRefcon;
        self->replyReceived = true;

        AERemoveEventHandler(kCoreEventClass, kAEAnswer, self->replyHandler, false);
        return noErr;
    }

public:
    virtual bool Launch(ConstStr255Param name)
    {
        if(!replyHandler)
            replyHandler = NewAEEventHandlerUPP(&handleReply);
        AEInstallEventHandler(kCoreEventClass, kAEAnswer, replyHandler, (long)this, false);

        AEAddressDesc address;

        OSType signature = 'MPS ';
        OSErr err = AECreateDesc(typeApplSignature, &signature, 4, &address);

        AppleEvent ae;
        err = AECreateAppleEvent('misc', 'dosc', &address, kAutoGenerateReturnID, kAnyTransactionID, &ae);
        
        Handle command = buildCommandLine(name);
        Str255 commandP;
        commandP[0] =GetHandleSize(command);
        memcpy(commandP + 1, *command, commandP[0]);
        HLock(command);
        err = AEPutParamPtr(&ae, keyDirectObject, typeChar, *command, GetHandleSize(command));
        DisposeHandle(command);

        AppleEvent reply;

        err = AESend(&ae, &reply, kAEQueueReply | kAEAlwaysInteract | kAECanSwitchLayer, kAENormalPriority, kAEDefaultTimeout, nullptr, nullptr);
        
        AEDisposeDesc(&address);
        AEDisposeDesc(&ae);
        
        return err == noErr;
    }
    virtual bool IsRunning(ConstStr255Param name)
    {
        return !replyReceived;
    }
};

std::unique_ptr<AppLauncher> CreateToolLauncher()
{
    return std::make_unique<ToolLauncher>();
}
