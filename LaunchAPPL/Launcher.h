#ifndef LAUNCHER_H
#define LAUNCHER_H

#include <boost/program_options/variables_map.hpp>
#include "ResourceFile.h"
#include <boost/filesystem.hpp>

class Launcher
{
protected:
	boost::program_options::variables_map& options;

	ResourceFile app;
	boost::filesystem::path tempDir, appPath, outPath;
	bool keepTempFiles;

	int ChildProcess(std::string program, std::vector<std::string> args, int timeout);
public:
	Launcher(boost::program_options::variables_map& options);
	Launcher(boost::program_options::variables_map& options, ResourceFile::Format f);

	void KeepTempFiles() { keepTempFiles = true; }

	virtual bool Go(int timeout = 0) = 0;

	virtual void DumpOutput();

	virtual ~Launcher();
};

#endif // LAUNCHER_H
