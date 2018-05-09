#pragma once
#include "ConnectionProvider.h"
#include <memory>

class StatusDisplay;
class MacTCPStream;

class TCPConnectionProvider : public ConnectionProvider
{
    StatusDisplay *statusDisplay;
    
    std::unique_ptr<MacTCPStream> stream;

    static void unloadSegDummy();
public:
    TCPConnectionProvider(StatusDisplay *statusDisplay);
    virtual ~TCPConnectionProvider();

    virtual Stream* getStream();

    virtual void idle();

    virtual void* segmentToUnload();
};
