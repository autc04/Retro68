#ifndef TCP_H
#define TCP_H

#include "LaunchMethod.h"

class TCP : public LaunchMethod
{
public:
	virtual std::string GetName() { return "tcp"; }
	virtual void GetOptions(options_description& desc);
	virtual bool CheckOptions(variables_map& options);

	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // EXECUTOR_H
