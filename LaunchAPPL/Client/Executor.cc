#include "Executor.h"
#include "Launcher.h"
#include "Utilities.h"

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
    std::vector<std::string> args;
    if(options.count("executor-option"))
        args = options["executor-option"].as<std::vector<std::string>>();
    args.push_back(appPath.string());

    if(options.count("executor-system-folder"))
        setenv("SystemFolder", options["executor-system-folder"].as<std::string>().c_str(), true);

    return ChildProcess(options["executor-path"].as<std::string>(), args, timeout) == 0;
}


void Executor::GetOptions(options_description &desc)
{
    desc.add_options()
            ("executor-path", po::value<std::string>()->default_value("executor"),"path to executor")
            ("executor-system-folder", po::value<std::string>(),
                "system folder for executor (overrides SystemFolder environment variable)")
            ("executor-option", po::value<std::vector<std::string>>(),
                "pass an option to executor")
            ;
}

bool Executor::CheckOptions(variables_map &options)
{
    if(options.count("executor-path") == 0)
        return false;
    return CheckExecutable(options["executor-path"].as<std::string>());
}

std::unique_ptr<Launcher> Executor::MakeLauncher(variables_map &options)
{
    return std::unique_ptr<Launcher>(new ExecutorLauncher(options));
}
