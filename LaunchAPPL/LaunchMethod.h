#ifndef LAUNCHMETHOD_H
#define LAUNCHMETHOD_H

#include <string>
#include <boost/program_options/options_description.hpp>
#include <boost/program_options/variables_map.hpp>

#include <memory>

class Launcher;

class LaunchMethod
{
public:
	typedef boost::program_options::options_description options_description;
	typedef boost::program_options::variables_map variables_map;

	LaunchMethod();
	virtual ~LaunchMethod();

	virtual std::string GetName() = 0;
	virtual void GetOptions(options_description& desc);

	virtual bool CheckPlatform();
	virtual bool CheckOptions(variables_map& options);

	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options) = 0;

protected:
	bool CheckExecutable(std::string program);
};

#endif // LAUNCHMETHOD_H
