#ifndef MINIVMAC_H
#define MINIVMAC_H

#include "LaunchMethod.h"

class MiniVMac : public LaunchMethod
{
public:
	virtual std::string GetName() { return "minivmac"; }
	virtual void GetOptions(options_description& desc);
	virtual bool CheckOptions(variables_map& options);

	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // MINIVMAC_H
