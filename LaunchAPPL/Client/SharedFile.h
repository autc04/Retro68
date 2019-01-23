#pragma once

#include "LaunchMethod.h"

class SharedFile : public LaunchMethod
{
public:
	virtual std::string GetName() { return "shared"; }
	virtual void GetOptions(options_description& desc);
	virtual bool CheckOptions(variables_map& options);

	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};
