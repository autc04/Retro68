#include <boost/program_options.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include <iostream>
#include <vector>
#include <string>

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>


#include "ResourceFork.h"
#include "ResourceFile.h"

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


int ChildProcess(string program, vector<string> args)
{
	std::vector<const char*> argv;
	argv.push_back(program.c_str());
	for(string& s : args)
		argv.push_back(s.c_str());
	argv.push_back(NULL);

	int timeout = options.count("timeout") ? options["timeout"].as<int>() : 0;

	pid_t pid = fork();
	if(pid < 0)
	{
		perror("unable to fork");
		return 1;
	}
	else if(pid == 0)
	{
		pid_t worker_pid = timeout ? fork() : 0;
		if(worker_pid < 0)
		{
			perror("unable to fork");
			_exit(1);
		}
		if(worker_pid == 0)
		{
			execvp(argv[0], const_cast<char* const *> (argv.data()));
			perror("exec failed");
			_exit(1);
		}

		pid_t timeout_pid = fork();
		if(timeout_pid < 0)
		{
			perror("unable to fork");
			_exit(1);
		}
		if(timeout_pid == 0)
		{
			sleep(timeout);
			_exit(0);
		}
		int wstatus;
		pid_t exited_pid = wait(&wstatus);
		if(exited_pid == worker_pid)
		{
			kill(timeout_pid, SIGKILL);
			wait(NULL);
			if(!WIFEXITED(wstatus))
			{
				return 1;
			}
			else
			{
				int exitcode = WEXITSTATUS(wstatus);
				_exit(exitcode);
			}
		}
		else
		{
			kill(worker_pid, SIGKILL);
			wait(NULL);
			_exit(1);
		}
	}
	else
	{
		int wstatus;
		int result = 0;
		do
		{
			result = waitpid(pid, &wstatus, 0);
		} while(result == -1 && errno == EINTR);

		if(!WIFEXITED(wstatus))
		{
			return 1;
		}
		else
		{
			int exitcode = WEXITSTATUS(wstatus);
			return exitcode;
		}
	}

}

int main(int argc, char *argv[])
{
	desc.add_options()
	       ("help,h", "show this help message")
	        ("executor-path", po::value<std::string>()->default_value("executor"),"path to executor")
	        ("executor,e", "run using executor")
	        ("timeout,t", po::value<int>(),"abort after timeout")
	        ("logfile", po::value<std::string>(), "read log file")
	        ("result,r", "TEST 128")
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

	if(options.count("help") || !options.count("application"))
	{
		usage();
		return 0;
	}

	ResourceFile app(options["application"].as<std::string>());
	if(!app.read())
	{
		std::cerr << "Could not read application file.\n";
		return 1;
	}



	if(options.count("executor"))
	{
		fs::path tempDir = fs::unique_path();
		std::cerr << "Unique path: " << tempDir.string() << std::endl;
		fs::create_directories(tempDir);

		fs::path appPath = tempDir / "Application";

		app.assign(appPath.string(), ResourceFile::Format::percent_appledouble);
		if(!app.write())
		{
			std::cerr << "Could not write application file.\n";
			return 1;
		}

		if(options.count("logfile"))
		{
			fs::ofstream out(tempDir/options["logfile"].as<std::string>());
		}

		int result = ChildProcess(options["executor-path"].as<std::string>(), { appPath.string() });

		if(options.count("logfile"))
		{
			fs::ifstream in(tempDir/options["logfile"].as<std::string>());
			std::cout << in.rdbuf();
		}


		if(result == 0 && options.count("result"))
		{
			app.read();
			auto& resmap = app.resources.resources;
			auto p = resmap.find(ResRef("TEST", 128));
			if(p == resmap.end())
				return 1;

			std::cout << p->second.getData();
		}

		fs::remove_all(tempDir);

		return result;
	}

	return 0;
}
