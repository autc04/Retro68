#include "TCPConnectionProvider.h"
#include "MacTCPStream.h"
#include <ReliableStream.h>
#include "StatusDisplay.h"


TCPConnectionProvider::TCPConnectionProvider(StatusDisplay *statusDisplay)
        : statusDisplay(statusDisplay)
{
    stream = std::make_unique<MacTCPStream>();
}

TCPConnectionProvider::~TCPConnectionProvider()
{

}

Stream* TCPConnectionProvider::getStream()
{
    return stream.get();
}

void TCPConnectionProvider::idle()
{
    if(stream)
    {
        stream->setListener(listener);
        stream->idle();
    }
}

void TCPConnectionProvider::unloadSegDummy()
{
}

void *TCPConnectionProvider::segmentToUnload()
{
    return nullptr;//(void*) &unloadSegDummy;
}
