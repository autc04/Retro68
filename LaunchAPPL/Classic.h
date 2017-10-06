#ifndef CLASSIC_H
#define CLASSIC_H

#include "LaunchMethod.h"

class Classic : public LaunchMethod
{
public:
	virtual std::string GetName() { return "classic"; }

	virtual bool CheckPlatform();
	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // CLASSIC_H
