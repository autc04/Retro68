#include <boost/program_options.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include <iostream>
#include <vector>
#include <string>

#include "LaunchMethod.h"
#include "Launcher.h"

#if defined(__APPLE__)
#	define ResType MacResType
#	include <ApplicationServices/ApplicationServices.h>
#	undef ResType
#	if TARGET_CPU_PPC
#		include "Classic.h"
#	endif
#	include "Carbon.h"
#endif
#include "Executor.h"
#include "MiniVMac.h"
#include "SSH.h"

namespace po = boost::program_options;
namespace fs = boost::filesystem;

using std::string;
using std::vector;

static po::options_description desc;
static po::variables_map options;
static vector<string> configFiles;
static vector<LaunchMethod*> launchMethods;

static void RegisterLaunchMethods()
{
	vector<LaunchMethod*> methods = {
#if defined(__APPLE__)
#	if TARGET_CPU_PPC
		new Classic(),
#	endif
		new Carbon(),
#endif
	    new Executor(), new MiniVMac(),
	    new SSH()
		// #### Add new `LaunchMethod`s here.
	};
	
	for(LaunchMethod *m : methods)
	{
		if(m->CheckPlatform())
			launchMethods.push_back(m);
	}
}

static void usage()
{
	std::cerr << "Usage: " << "LaunchAPPL [options] appl-file\n";
	std::cerr << desc << std::endl;
	std::cerr << "Defaults are read from:\n";
	for(string str : configFiles)
	{
		std::cerr << "\t" << str;
		if(!std::ifstream(str))
			std::cerr << " (not found)";
		std::cerr << std::endl;
	}
	std::cerr << std::endl;

	vector<string> configuredMethods, unconfiguredMethods;
	for(LaunchMethod *method : launchMethods)
		(method->CheckOptions(options) ? configuredMethods : unconfiguredMethods)
				.push_back(method->GetName());

	if(!configuredMethods.empty())
	{
		std::cerr << "Available emulators/environments:\n";
		for(string m : configuredMethods)
			std::cerr << "\t" << m << std::endl;
	}
	if(!unconfiguredMethods.empty())
	{
		std::cerr << "Emulators/environments needing more configuration:\n";
		for(string m : unconfiguredMethods)
			std::cerr << "\t" << m << std::endl;
	}

	if(options.count("emulator"))
	{
		string e = options["emulator"].as<string>();
		std::cerr << "\nChosen emulator/environment: " << e;
		if(std::find(configuredMethods.begin(), configuredMethods.end(), e)
				!= configuredMethods.end())
			std::cerr << "\n";
		else if(std::find(unconfiguredMethods.begin(), unconfiguredMethods.end(), e)
			   != unconfiguredMethods.end())
			std::cerr << " (needs more configuration)\n";
		else
			std::cerr << " (UNKNOWN)\n";
	}
	else
	{
		std::cerr << "\nNo emulator/environment chosen (-e)\n";
	}
}

void MakeExecutable(string filepath);

int main(int argc, char *argv[])
{
	RegisterLaunchMethods();
	configFiles = { string(getenv("HOME")) + "/.LaunchAPPL.cfg", RETRO68_PREFIX "/LaunchAPPL.cfg"};

	desc.add_options()
			("help,h", "show this help message")
			("list-emulators,l", "get the list of available, fully configured emulators/environments")
			("make-executable,x", po::value<std::string>(), "make a MacBinary file executable")
	;
	po::options_description configdesc;
	configdesc.add_options()
			("emulator,e", po::value<std::string>(), "what emulator/environment to use")
	;
	for(LaunchMethod *lm : launchMethods)
		lm->GetOptions(configdesc);
	desc.add(configdesc);

	desc.add_options()
			("timeout,t", po::value<int>(),"abort after timeout")
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

	for(string configFileName : configFiles)
	{
		try
		{
			std::ifstream cfg(configFileName);
			if(cfg)
			{
				auto parsed = po::parse_config_file<char>(cfg,configdesc,false);

				po::store(parsed, options);
			}
		}
		catch(po::error& e)
		{
			std::cerr << "CONFIG FILE ERROR: " << e.what() << std::endl << std::endl;
			usage();
			return 1;
		}
	}

	po::notify(options);

	vector<string> commandModes = {"application", "help", "make-executable", "list-emulators"};
	int nModes = 0;
	string mode;

	for(string aMode : commandModes)
	{
		if(options.count(aMode))
		{
			nModes++;
			mode = aMode;
		}
	}
	if(nModes > 1)
	{
		std::cerr << "Need to specify either an application file or exactly one of ";
		for(int i = 1, n = commandModes.size(); i < n-1; i++)
			std::cerr << "--" << commandModes[i] << ", ";
		std::cerr << "or " << commandModes.back() << "." << std::endl << std::endl;
		usage();
		return 1;
	}
	if(mode == "" || mode == "help")
	{
		usage();
		return 0;
	}
	else if(mode == "make-executable")
	{
		string fn = options["make-executable"].as<std::string>();
		MakeExecutable(fn);
		return 0;
	}
	else if(mode == "list-emulators")
	{
		for(LaunchMethod *method : launchMethods)
			if(method->CheckOptions(options))
				std::cout << method->GetName() << std::endl;
		return 0;
	}

	if(!options.count("emulator"))
	{
		std::cerr << "ERROR: emulator/environment not specified.\n";
		usage();
		return 1;
	}

	LaunchMethod *method = NULL;
	for(LaunchMethod *lm : launchMethods)
	{
		if(lm->GetName() == options["emulator"].as<string>())
		{
			method = lm;
			break;
		}
	}
	if(!method)
	{
		std::cerr << "ERROR: unknown emulator/environment: " << options["emulator"].as<string>() << "\n";
		return 1;
	}

	if(!method->CheckOptions(options))
	{
		std::cerr << "Need more configuration.\n";
		usage();
		return 1;
	}

	std::unique_ptr<Launcher> launcher = method->MakeLauncher(options);

	int timeout = options.count("timeout") ? options["timeout"].as<int>() : 0;

	bool result = launcher->Go(timeout);

	launcher->DumpOutput();


	return result ? 0 : 1;
}
