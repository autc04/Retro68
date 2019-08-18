#ifndef EXECUTOR_H
#define EXECUTOR_H

#include "LaunchMethod.h"

class Executor : public LaunchMethod
{
public:
    virtual std::string GetName() { return "executor"; }
    virtual void GetOptions(options_description& desc);
    virtual bool CheckOptions(variables_map& options);

    virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // EXECUTOR_H
