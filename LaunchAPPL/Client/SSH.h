#ifndef SSH_H
#define SSH_H

#include "LaunchMethod.h"

class SSH : public LaunchMethod
{
public:
    virtual std::string GetName() { return "ssh"; }
    virtual void GetOptions(options_description& desc);
    virtual bool CheckOptions(variables_map& options);

    virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // SSH_H
