#include "Utilities.h"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <boost/filesystem.hpp>
#include <iostream>

namespace fs = boost::filesystem;
using std::string;
using std::vector;

int ChildProcess(string program, vector<string> args, int timeout)
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



bool CheckExecutable(std::string program)
{
	if(access(program.c_str(), X_OK) == 0)
		return true;
	if(program.find("/") != std::string::npos)
		return false;
	const char *PATH = getenv("PATH");

	if(PATH)
	{
		bool endFound = false;
		do
		{
			const char *end = strchr(PATH, ':');
			if(!end)
			{
				end = strchr(PATH, '\0');
				endFound = true;
			}
			std::string pathElement(PATH, end);

			if(pathElement == "")
				pathElement = ".";

			fs::path f = fs::path(pathElement) / program;

			if(access(f.string().c_str(), X_OK) == 0)
				return true;

			PATH = end + 1;
		} while(!endFound);
	}

	return false;
}

vector<string> SplitArguments(std::string str)
{
	bool backslash = false;
	bool quote = false;
	bool begun = false;
	vector<string> args;

	for(char c : str)
	{
		if(!backslash && !quote && isspace(c))
		{
			begun = false;
		}
		else if(!backslash && c == '"')
		{
			quote = !quote;
			if(quote && !begun)
			{
				args.emplace_back();
				begun = true;
			}
		}
		else if(!backslash && c == '\\')
		{
			backslash = true;
		}
		else
		{
			backslash = false;

			if(!begun)
			{
				args.emplace_back();
				begun = true;
			}
			args.back() += c;
		}
	}

	return args;
}

vector<string> SplitArguments(vector<string> strs)
{
	vector<string> args;
	for(string str : strs)
	{
		vector<string> args1 = SplitArguments(str);
		args.insert(args.end(), args1.begin(), args1.end());
	}
	return args;
}
