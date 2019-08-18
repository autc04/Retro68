#ifndef CARBON_METHOD_H
#define CARBON_METHOD_H

#include "LaunchMethod.h"

class Carbon : public LaunchMethod
{
public:
    virtual std::string GetName() { return "carbon"; }

    virtual bool CheckPlatform();
    virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // CARBON_METHOD_H
