#ifndef LAUNCHMETHOD_H
#define LAUNCHMETHOD_H

#include <string>
#include <boost/program_options/options_description.hpp>
#include <boost/program_options/variables_map.hpp>

#include <memory>

class Launcher;

/**
 * @brief The LaunchMethod class
 *
 * To add a new backend to LaunchAPPL, start by subclassing this
 * and updating RegisterLaunchMethods() in LaunchAPPL.cc.
 */
class LaunchMethod
{
public:
	typedef boost::program_options::options_description options_description;
	typedef boost::program_options::variables_map variables_map;

	LaunchMethod();
	virtual ~LaunchMethod();

	/**
	 * @brief GetName
	 * @return the name of the launch method, as it will be specified on the command line
	 */
	virtual std::string GetName() = 0;

	/**
	 * @brief GetOptions
	 * @param desc
	 *
	 * Add any command line options for this LaunchMethod
	 * to the options_description structure.
	 */
	virtual void GetOptions(options_description& desc);

	/**
	 * @brief CheckPlatform
	 *
	 * Check whether this is the right kind of machine to use this method.
	 * For things like Apple's Classic Environment, which is only available on some system versions.
	 * The default implementation returns true.
	 */
	virtual bool CheckPlatform();

	/**
	 * @brief CheckOptions
	 * @param options
	 * @return are we ready to run?
	 *
	 * Check whether all necessary options have been specified.
	 * Don't output error messages here, this is also called when outputting usage information
	 */
	virtual bool CheckOptions(variables_map& options);

	/**
	 * @brief MakeLauncher
	 * @param options
	 * @return a new instance of a subclass of Launcher which will do the actual work
	 */
	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options) = 0;

protected:
};

#endif // LAUNCHMETHOD_H
