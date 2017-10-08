#include "Launcher.h"
#include <boost/filesystem/fstream.hpp>
#include <iostream>
#include <sstream>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>


namespace fs = boost::filesystem;
using std::string;
using std::vector;

Launcher::Launcher(boost::program_options::variables_map &options)
    : options(options)
{
	string fn = options["application"].as<std::string>();
	
	if(fn == "-")
	{
		std::stringstream tmp;
		tmp << std::cin.rdbuf();
		if(!app.read(tmp, ResourceFile::Format::macbin))
			throw std::runtime_error("Could not load application from stdin.");
	}
	else
	{
		app.assign(fn);
		if(!app.read())
			throw std::runtime_error("Could not load application file.");
	}
	
	tempDir = fs::absolute(fs::unique_path());
	fs::create_directories(tempDir);

	appPath = tempDir / "Application";
	outPath = tempDir / "out";

	fs::ofstream out(outPath);
}

Launcher::Launcher(boost::program_options::variables_map &options, ResourceFile::Format f)
    : Launcher(options)
{
	app.assign(appPath.string(), f);
	app.write();
}

void Launcher::DumpOutput()
{
	fs::ifstream in(outPath);
	std::cout << in.rdbuf();
}

Launcher::~Launcher()
{
	fs::remove_all(tempDir);
}



int Launcher::ChildProcess(string program, vector<string> args, int timeout)
{
	std::vector<const char*> argv;
	argv.push_back(program.c_str());
	for(string& s : args)
		argv.push_back(s.c_str());
	argv.push_back(NULL);

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
			std::cerr << "Tried to execute: " << program;
			for(auto a : args)
				std::cerr << " " << a;
			std::cerr << std::endl;
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
