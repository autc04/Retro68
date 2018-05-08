#include "SerialConnectionProvider.h"
#include "MacSerialStream.h"
#include <ReliableStream.h>
#include "StatusDisplay.h"

struct SerialConnectionProvider::Streams
{
    MacSerialStream serialStream;
    ReliableStream reliableStream;

    Streams(int port, int baud)
        : serialStream(port, baud)
        , reliableStream(&serialStream)
    {
    }
};

SerialConnectionProvider::SerialConnectionProvider(int port, int baud, StatusDisplay *statusDisplay)
        : port(port), baud(baud), statusDisplay(statusDisplay)
{
    resume();
}

SerialConnectionProvider::~SerialConnectionProvider()
{

}

Stream* SerialConnectionProvider::getStream()
{
    return streams ? &streams->reliableStream : nullptr;
}

void SerialConnectionProvider::idle()
{
    if(streams)
    {
        streams->reliableStream.setListener(listener);
        streams->serialStream.idle();
        if(statusDisplay)
            statusDisplay->SetErrorCount(streams->reliableStream.getFailedReceiveCount()
                                        + streams->reliableStream.getFailedSendCount());
    }
}

void SerialConnectionProvider::suspend()
{
    streams.reset();
}

void SerialConnectionProvider::resume()
{
    if(!streams)
        streams = std::make_unique<Streams>(port, baud);
}

void SerialConnectionProvider::unloadSegDummy()
{
}

void *SerialConnectionProvider::segmentToUnload()
{
    return (void*) &unloadSegDummy;
}
