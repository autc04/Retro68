#define ResType MacResType
#include <ApplicationServices/ApplicationServices.h>
#undef ResType

#if TARGET_CPU_PPC
#include "Classic.h"
#include "Launcher.h"


namespace po = boost::program_options;

class ClassicLauncher : public Launcher
{
public:
    ClassicLauncher(po::variables_map& options);
    virtual ~ClassicLauncher();

    virtual bool Go(int timeout = 0);

};

ClassicLauncher::ClassicLauncher(po::variables_map &options)
    : Launcher(options, ResourceFile::Format::real)
{

}

ClassicLauncher::~ClassicLauncher()
{

}

bool ClassicLauncher::Go(int timeout)
{    
    FSRef ref;
    FSPathMakeRef((const UInt8*) appPath.string().c_str(), &ref, NULL);
    LSApplicationParameters params;
    memset(&params, 0, sizeof(params));
    params.flags = kLSLaunchStartClassic
                 | kLSLaunchInClassic
                 | kLSLaunchDontAddToRecents
                 | kLSLaunchNewInstance;
    params.application = &ref;
    
    ProcessSerialNumber psn;
    LSOpenApplication(&params, &psn);
    
        // Classic startup takes place before LSOpenApplication returns,
        // so no extra timeout is needed
    
    for(int i = 0; i < timeout || timeout == 0; i++)
    {
        sleep(1);
        
        ProcessInfoRec pi;
        pi.processInfoLength = sizeof(pi);
        pi.processName = NULL;
        pi.processAppSpec = 0;
        if(GetProcessInformation(&psn, &pi) == procNotFound)
            return true;
    }

    KillProcess(&psn);

    return false;
}

bool Classic::CheckPlatform()
{
    long sysver = 0;
    Gestalt(gestaltSystemVersion, &sysver);
    if(sysver >= 0x1050)
        return false;
    else
        return true;
}

std::unique_ptr<Launcher> Classic::MakeLauncher(variables_map &options)
{
    return std::unique_ptr<Launcher>(new ClassicLauncher(options));
}
#endif
