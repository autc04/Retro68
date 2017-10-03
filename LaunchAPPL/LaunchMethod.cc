#include "LaunchMethod.h"
#include <boost/filesystem.hpp>
#include <unistd.h>

namespace fs = boost::filesystem;

LaunchMethod::LaunchMethod()
{

}

LaunchMethod::~LaunchMethod()
{

}

void LaunchMethod::GetOptions(boost::program_options::options_description &desc)
{
}

bool LaunchMethod::CheckOptions(boost::program_options::variables_map &options)
{
	return true;
}

bool LaunchMethod::CheckExecutable(std::string program)
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
