#include <boost/program_options.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include <iostream>
#include <vector>
#include <string>

#include "LaunchMethod.h"
#include "Launcher.h"

#ifdef __APPLE__
#include "Classic.h"
#include "Carbon.h"
#endif
#include "Executor.h"
#include "MiniVMac.h"

namespace po = boost::program_options;
namespace fs = boost::filesystem;

using std::string;
using std::vector;

static po::options_description desc;
po::variables_map options;

static void usage()
{
	std::cerr << "Usage: " << "LaunchAPPL [options] appl-file\n";
	std::cerr << desc << std::endl;
}



int main(int argc, char *argv[])
{
	std::vector<LaunchMethod*> methods = {
#ifdef __APPLE__
		new Classic(), new Carbon(),
#endif
	    new Executor(), new MiniVMac()
	};
	desc.add_options()
	        ("help,h", "show this help message")
	        ("emulator,e", po::value<std::string>(), "what emulator/environment to use")
	;
	for(LaunchMethod *lm : methods)
		lm->GetOptions(desc);

	desc.add_options()
	        ("timeout,t", po::value<int>(),"abort after timeout")
	        ("timeout-ok","timeout counts as success")
	        ("logfile", po::value<std::string>(), "read log file")
	;
	po::options_description hidden, alldesc;
	hidden.add_options()
	    ("application,a", po::value<std::string>(), "application" )
	;
	alldesc.add(desc).add(hidden);
	try
	{
		auto parsed = po::command_line_parser(argc, argv)
		        .options(alldesc)
		        .positional(po::positional_options_description().add("application", -1))
		        .style(po::command_line_style::default_style)
		        .run();

		po::store(parsed, options);
	}
	catch(po::error& e)
	{
		std::cerr << "ERROR: " << e.what() << std::endl << std::endl;
		usage();
		return 1;
	}

	po::notify(options);

	if(options.count("help") || !options.count("application") || !options.count("emulator"))
	{
		usage();
		return 0;
	}

	LaunchMethod *method = NULL;
	for(LaunchMethod *lm : methods)
	{
		if(lm->GetName() == options["emulator"].as<string>())
		{
			method = lm;
			break;
		}
	}
	if(!method)
	{
		std::cerr << "ERROR: unknown emulator/environment.\n";
		return 1;
	}

	if(!method->CheckOptions(options))
	{
		std::cerr << "Missing configuration.\n";
		return 1;
	}

	std::unique_ptr<Launcher> launcher = method->MakeLauncher(options);

	int timeout = options.count("timeout") ? options["timeout"].as<int>() : 0;

	bool result = launcher->Go(timeout);

	launcher->DumpOutput();


	return result ? 0 : 1;
}
