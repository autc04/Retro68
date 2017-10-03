#if defined(__APPLE__) && defined(__powerpc)
#include "Classic.h"
#include "Launcher.h"

#define ResType MacResType
#include <ApplicationServices/ApplicationServices.h>

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

std::unique_ptr<Launcher> Classic::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new ClassicLauncher(options));
}
#endif
