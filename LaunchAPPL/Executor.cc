#include "Executor.h"
#include "Launcher.h"

namespace po = boost::program_options;

class ExecutorLauncher : public Launcher
{
public:
	ExecutorLauncher(po::variables_map& options);
	virtual ~ExecutorLauncher();

	virtual bool Go(int timeout = 0);

};

ExecutorLauncher::ExecutorLauncher(po::variables_map &options)
    : Launcher(options, ResourceFile::Format::percent_appledouble)
{

}

ExecutorLauncher::~ExecutorLauncher()
{

}

bool ExecutorLauncher::Go(int timeout)
{
	return ChildProcess(options["executor-path"].as<std::string>(), { appPath.string() }, timeout) == 0;
}


void Executor::GetOptions(options_description &desc)
{
	desc.add_options()
	        ("executor-path", po::value<std::string>()->default_value("executor"),"path to executor")
	        ;
}

bool Executor::CheckOptions(variables_map &options)
{
	return options.count("executor-path") != 0;
}

std::unique_ptr<Launcher> Executor::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new ExecutorLauncher(options));
}
