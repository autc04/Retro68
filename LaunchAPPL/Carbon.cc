#include "Carbon.h"
#include "Launcher.h"

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
	return ChildProcess("LaunchCarbon", { appPath.string() }, timeout) == 0;
}

std::unique_ptr<Launcher> Carbon::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new CarbonLauncher(options));
}
