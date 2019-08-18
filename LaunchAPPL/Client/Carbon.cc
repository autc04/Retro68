#include "Carbon.h"
#include "Launcher.h"
#include "Utilities.h"

const std::string launchCFM =
    "/System/Library/Frameworks/Carbon.framework/Versions/A/Support/LaunchCFMApp";

namespace po = boost::program_options;

class CarbonLauncher : public Launcher
{
public:
    CarbonLauncher(po::variables_map& options);
    virtual ~CarbonLauncher();

    virtual bool Go(int timeout = 0);

};

CarbonLauncher::CarbonLauncher(po::variables_map &options)
    : Launcher(options, ResourceFile::Format::real)
{

}

CarbonLauncher::~CarbonLauncher()
{

}

bool CarbonLauncher::Go(int timeout)
{
    return ChildProcess(launchCFM, { appPath.string() }, timeout) == 0;
}

bool Carbon::CheckPlatform()
{
    /* If LaunchCFMApp doesn't exist, we're likely on a Mac OS X version
      where it doesn't exist anymore (10.7 Lion or later),
      or on an entirely different platform. */
    return CheckExecutable(launchCFM);
}

std::unique_ptr<Launcher> Carbon::MakeLauncher(variables_map &options)
{
    return std::unique_ptr<Launcher>(new CarbonLauncher(options));
}
