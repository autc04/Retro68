#pragma once
#include "ConnectionProvider.h"
#include <memory>

class StatusDisplay;
class OpenTptStream;

class OpenTptConnectionProvider : public ConnectionProvider
{
    StatusDisplay *statusDisplay;
    
    std::unique_ptr<OpenTptStream> stream;

    static void unloadSegDummy();
public:
    OpenTptConnectionProvider(StatusDisplay *statusDisplay);
    virtual ~OpenTptConnectionProvider();

    virtual Stream* getStream();

    virtual void idle();

    virtual void* segmentToUnload();
};
