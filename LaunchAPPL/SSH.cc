#include "SSH.h"
#include "Launcher.h"
#include "Utilities.h"

#include <iostream>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <boost/lexical_cast.hpp>

namespace po = boost::program_options;
using std::string;
using std::vector;

class SSHLauncher : public Launcher
{
public:
	SSHLauncher(po::variables_map& options);
	virtual ~SSHLauncher();

	virtual bool Go(int timeout = 0);

};

SSHLauncher::SSHLauncher(po::variables_map &options)
    : Launcher(options, ResourceFile::Format::percent_appledouble)
{

}

SSHLauncher::~SSHLauncher()
{

}

static void insertArgs(vector<string>& args, po::variables_map& options, string name)
{
	if(options.count(name))
	{
		auto extraArgs = SplitArguments(options[name].as<vector<string>>());
		args.insert(args.end(), extraArgs.begin(), extraArgs.end());
	}
}

bool SSHLauncher::Go(int timeout)
{
	std::vector<std::string> args;
	args.push_back(options["ssh-host"].as<string>());
	insertArgs(args, options, "ssh-args");
	args.push_back("--");
	args.push_back(options["ssh-remote-path"].as<string>());
	insertArgs(args, options, "ssh-remote-args");
	if(timeout)
	{
		args.push_back("--timeout");
		args.push_back(boost::lexical_cast<std::string>(timeout));
	}
	args.push_back("-");

	std::string program = options["ssh-path"].as<std::string>();

	std::vector<const char*> argv;
	argv.push_back(program.c_str());
	for(std::string& s : args)
		argv.push_back(s.c_str());
	argv.push_back(NULL);

	int fd[2];
	pipe(fd);
	const int READ_END = 0;
	const int WRITE_END = 1;

	pid_t pid = fork();
	if(pid < 0)
	{
		perror("unable to fork");
		return 1;
	}
	else if(pid == 0)
	{
		dup2(fd[READ_END], STDIN_FILENO);
		close(fd[WRITE_END]);
		close(fd[READ_END]);

		execvp(argv[0], const_cast<char* const *> (argv.data()));
		perror("exec failed");
		std::cerr << "Tried to execute: " << program;
		for(auto a : args)
			std::cerr << " " << a;
		std::cerr << std::endl;
		_exit(1);
	}
	else
	{
		close(fd[READ_END]);

		std::ostringstream tmp;
		app.write(tmp, ResourceFile::Format::macbin);
		const std::string data = tmp.str();

		write(fd[WRITE_END], data.data(), data.size());
		close(fd[WRITE_END]);

		int wstatus;
		int result = 0;
		do
		{
			result = waitpid(pid, &wstatus, 0);
		} while(result == -1 && errno == EINTR);

		if(!WIFEXITED(wstatus))
		{
			return false;
		}
		else
		{
			//int exitcode = WEXITSTATUS(wstatus);
			return true;
		}
	}
}



void SSH::GetOptions(options_description &desc)
{
	desc.add_options()
	        ("ssh-path", po::value<string>()->default_value("ssh"),"ssh command to use")
	        ("ssh-host", po::value<string>(),
	            "[username@]address of remote host")
	        ("ssh-args", po::value<vector<string>>(),
	            "additional arguments for ssh")
	        ("ssh-remote-path", po::value<string>()->default_value("LaunchAPPL"),
	            "path to LaunchAPPL on remote host")
	        ("ssh-remote-args", po::value<vector<string>>(),
	            "additional arguments for LaunchAPPL on remote host")
	        ;

}

bool SSH::CheckOptions(variables_map &options)
{
	return options.count("ssh-host") != 0;
}

std::unique_ptr<Launcher> SSH::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new SSHLauncher(options));
}
