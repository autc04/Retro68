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

extern "C" {
#include "hfs.h"
}


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
	        ("executor,e", "run using executor")
	        ("minivmac,m", "run using executor")

	        ("executor-path", po::value<std::string>()->default_value("executor"),"path to executor")
	        ("minivmac-path", po::value<std::string>()->default_value("minivmac"),"path to minivmac")
	        ("minivmac-dir", po::value<std::string>()->default_value("."),"directory containing vMac.ROM")
	        ("system-image", po::value<std::string>(),"path to disk image with system")

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

		fs::remove_all(tempDir);

		return result;
	}
	if(options.count("minivmac"))
	{
		assert(options.count("system-image"));
		fs::path tempDir = fs::unique_path();
		fs::path path = tempDir / "image.dsk";
		fs::create_directories(tempDir);

		hfsvol *sysvol = hfs_mount(options["system-image"].as<std::string>().c_str(),
		                        0, HFS_MODE_RDONLY);

		int size = 5000*1024;
		fs::ofstream(path, std::ios::binary | std::ios::trunc).seekp(size-1).put(0);
		hfs_format(path.string().c_str(), 0, 0, "SysAndApp", 0, NULL);
		hfsvol *vol = hfs_mount(path.string().c_str(), 0, HFS_MODE_RDWR);

		hfsvolent ent;
		hfs_vstat(sysvol, &ent);

		hfs_setcwd(sysvol, ent.blessed);




		{
			const char *fn = "System";
			hfsdirent fileent;
			hfs_stat(sysvol, fn, &fileent);
			hfsfile *in = hfs_open(sysvol, fn);
			hfsfile *out = hfs_create(vol, fn, fileent.u.file.type,fileent.u.file.creator);

			std::vector<uint8_t> buffer(std::max(fileent.u.file.dsize, fileent.u.file.rsize));
			hfs_setfork(in, 0);
			hfs_setfork(out, 0);
			hfs_read(in, buffer.data(), fileent.u.file.dsize);
			hfs_write(out, buffer.data(), fileent.u.file.dsize);
			hfs_setfork(in, 1);
			hfs_setfork(out, 1);
			hfs_read(in, buffer.data(), fileent.u.file.rsize);
			hfs_write(out, buffer.data(), fileent.u.file.rsize);
			hfs_close(in);
			hfs_close(out);
		}
		{
			const char *fn = "Finder";
			hfsdirent fileent;
			hfs_stat(sysvol, fn, &fileent);
			hfsfile *in = hfs_open(sysvol, fn);
			hfsfile *out = hfs_create(vol, fn, fileent.u.file.type,fileent.u.file.creator);

			std::vector<uint8_t> buffer(std::max(fileent.u.file.dsize, fileent.u.file.rsize));
			hfs_setfork(in, 0);
			hfs_setfork(out, 0);
			hfs_read(in, buffer.data(), fileent.u.file.dsize);
			hfs_write(out, buffer.data(), fileent.u.file.dsize);
			hfs_setfork(in, 1);
			hfs_setfork(out, 1);
			hfs_read(in, buffer.data(), fileent.u.file.rsize);
			hfs_write(out, buffer.data(), fileent.u.file.rsize);
			hfs_close(in);
			hfs_close(out);
		}
		{
			const char *fn = "MacsBug";
			hfsdirent fileent;
			hfs_stat(sysvol, fn, &fileent);
			hfsfile *in = hfs_open(sysvol, fn);
			hfsfile *out = hfs_create(vol, fn, fileent.u.file.type,fileent.u.file.creator);

			std::vector<uint8_t> buffer(std::max(fileent.u.file.dsize, fileent.u.file.rsize));
			hfs_setfork(in, 0);
			hfs_setfork(out, 0);
			hfs_read(in, buffer.data(), fileent.u.file.dsize);
			hfs_write(out, buffer.data(), fileent.u.file.dsize);
			hfs_setfork(in, 1);
			hfs_setfork(out, 1);
			hfs_read(in, buffer.data(), fileent.u.file.rsize);
			hfs_write(out, buffer.data(), fileent.u.file.rsize);
			hfs_close(in);
			hfs_close(out);
		}

		{
			std::ostringstream rsrcOut;
			app.resources.writeFork(rsrcOut);
			std::string rsrc = rsrcOut.str();
			std::string& data = app.data;

			hfsfile *file = hfs_create(vol, "App","APPL","????");
			hfs_setfork(file, 0);
			hfs_write(file, data.data(), data.size());
			hfs_setfork(file, 1);
			hfs_write(file, rsrc.data(), rsrc.size());
			hfs_close(file);
		}

		{
			hfsfile *out = hfs_create(vol, "out", "TEXT", "????");
			hfs_close(out);
		}

		hfs_vstat(vol, &ent);
		ent.blessed = hfs_getcwd(vol);
		std::cout << "blessed: " << ent.blessed << std::endl;
		hfs_vsetattr(vol, &ent);

		hfs_umount(vol);
		hfs_umount(sysvol);

		extern unsigned char bootblock[1024];
		std::vector<unsigned char> bootblock1(bootblock, bootblock+1024);
		std::fstream out(path.string(), std::ios::in | std::ios::out | std::ios::binary);

		bootblock1[0x5A] = 3;
		bootblock1[0x5B] = 'A';
		bootblock1[0x5C] = 'p';
		bootblock1[0x5D] = 'p';

		out.write((const char*) bootblock1.data(), 1024);

		path = fs::absolute(path);

		fs::path minivmacdir = fs::absolute( options["minivmac-dir"].as<std::string>() );
		fs::path minivmacpath = fs::absolute( minivmacdir / options["minivmac-path"].as<std::string>() );

		fs::current_path(minivmacdir);

		int result = ChildProcess(minivmacpath.string(), { path.string() });

		std::cerr << "volume at: " << path.string() << std::endl;
		vol = hfs_mount(path.string().c_str(), 0, HFS_MODE_RDONLY);
		{
			hfsfile *out = hfs_open(vol, "out");
			if(!out)
				return 1;
			hfsdirent fileent;
			int statres = hfs_stat(vol, "out", &fileent);
			std::cerr << "stat: " << statres << "\n";
			std::cerr << "out: " << fileent.u.file.dsize << " bytes\n";
			std::vector<char> buffer(fileent.u.file.dsize);
			hfs_setfork(out, 0);
			hfs_read(out, buffer.data(), fileent.u.file.dsize);
			hfs_close(out);
			std::cout << string(buffer.begin(), buffer.end());
		}
		hfs_umount(vol);
	}

	return 0;
}
