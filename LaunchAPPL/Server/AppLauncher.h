#include <memory>
#include <MacTypes.h>

class AppLauncher
{
public:
    virtual bool Launch(ConstStr255Param name) = 0;
    virtual bool IsRunning(ConstStr255Param name) = 0;
};

std::unique_ptr<AppLauncher> CreateAppLauncher();
