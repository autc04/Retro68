#include "AppLauncher.h"

#include <Processes.h>
#include <TextUtils.h>
#include <string.h>

class AppLauncherSingle : public AppLauncher
{
public:
    virtual bool Launch(ConstStr255Param name)
    {
        LaunchParamBlockRec lpb;
        memset(&lpb, 0, sizeof(lpb));

        lpb.reserved1 = (unsigned long) name;
        lpb.reserved2 = 0;
        lpb.launchBlockID = extendedBlock;
        lpb.launchEPBLength = 6;
        lpb.launchFileFlags = 0;
        lpb.launchControlFlags = 0xC000;
        
        LaunchApplication(&lpb);

        return false;
    }

    virtual bool IsRunning(ConstStr255Param name)
    {
        return false;
    }
};

class AppLauncher7 : public AppLauncher
{
    ProcessSerialNumber psn;
public:
    virtual bool Launch(ConstStr255Param name)
    {
        LaunchParamBlockRec lpb;
        memset(&lpb, 0, sizeof(lpb));
        FSSpec spec;
        FSMakeFSSpec(0,0,name,&spec);
        lpb.launchBlockID = extendedBlock;
        lpb.launchEPBLength = extendedBlockLen;
        lpb.launchFileFlags = 0;
        lpb.launchControlFlags = launchContinue;
        lpb.launchAppSpec = &spec;

        OSErr err = LaunchApplication(&lpb);
        
        psn = lpb.launchProcessSN;

        return err >= 0;
    }
    virtual bool IsRunning(ConstStr255Param name)
    {
        ProcessInfoRec info;
        memset(&info, 0, sizeof(info));
        info.processInfoLength = sizeof(info);
        OSErr err = GetProcessInformation(&psn,&info);
        return err == noErr;
    }
};

class AppLauncherMultiFinder : public AppLauncher
{
public:
    virtual bool Launch(ConstStr255Param name)
    {
        LaunchParamBlockRec lpb;
        memset(&lpb, 0, sizeof(lpb));

        lpb.reserved1 = (unsigned long) name;
        lpb.reserved2 = 0;
        lpb.launchBlockID = extendedBlock;
        lpb.launchEPBLength = 6;
        lpb.launchFileFlags = 0;
        lpb.launchControlFlags = 0xC000;
        
        OSErr err = LaunchApplication(&lpb);

        return err >= 0;
    }
    virtual bool IsRunning(ConstStr255Param name)
    {
        uint8_t *fcbs = *(uint8_t**)0x34E; // FCBSPtr;

        uint16_t bufSize = * (uint16_t*) fcbs;
        uint8_t *end = fcbs + bufSize;

        for(uint8_t *fcb = fcbs + 2; fcb < end; fcb += 94)
        {
            if(*(uint32_t*) fcb == 0)
                continue;
            if(*(OSType*) (fcb + 0x32) != 'APPL')
                continue;
            if(EqualString(fcb + 0x3E, "\pRetro68App", true, true))
                return true;
        }
        return false;
    }
};

std::unique_ptr<AppLauncher> CreateAppLauncher()
{
#if TARGET_API_MAC_CARBON || TARGET_RT_MAC_CFM
    return std::make_unique<AppLauncher7>();
#else
    SysEnvRec environ;
    SysEnvirons(curSysEnvVers, &environ);
    if(environ.systemVersion >= 0x0700)
        return std::make_unique<AppLauncher7>();
    else 
    {
        uint32_t& Twitcher2 = *(uint32_t*) 0xB7C;
        if(Twitcher2 == 0 || Twitcher2 == 0xFFFFFFFF)
            return std::make_unique<AppLauncherSingle>();
        else
            return std::make_unique<AppLauncherMultiFinder>();
    }
#endif
}
