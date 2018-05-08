#pragma once
#include "ConnectionProvider.h"
#include <memory>

class StatusDisplay;

class SerialConnectionProvider : public ConnectionProvider
{
    int port, baud;
    StatusDisplay *statusDisplay;
    struct Streams;
    
    std::unique_ptr<Streams> streams;

    static void unloadSegDummy();
public:
    SerialConnectionProvider(int port, int baud, StatusDisplay *statusDisplay);
    virtual ~SerialConnectionProvider();

    virtual Stream* getStream();

    virtual void idle();
    virtual void suspend();
    virtual void resume();

    virtual void* segmentToUnload();
};
