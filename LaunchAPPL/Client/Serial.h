#ifndef SERIAL_H
#define SERIAL_H

#include "LaunchMethod.h"

class Serial : public LaunchMethod
{
public:
	virtual std::string GetName() { return "serial"; }
	virtual void GetOptions(options_description& desc);
	virtual bool CheckOptions(variables_map& options);

	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // EXECUTOR_H
