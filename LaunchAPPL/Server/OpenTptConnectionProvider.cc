#include "OpenTptConnectionProvider.h"
#include "OpenTptStream.h"
#include <ReliableStream.h>
#include "StatusDisplay.h"


OpenTptConnectionProvider::OpenTptConnectionProvider(StatusDisplay *statusDisplay)
        : statusDisplay(statusDisplay)
{
    stream = std::make_unique<OpenTptStream>();
}

OpenTptConnectionProvider::~OpenTptConnectionProvider()
{

}

Stream* OpenTptConnectionProvider::getStream()
{
    return stream.get();
}

void OpenTptConnectionProvider::idle()
{
    if(stream)
    {
        stream->setListener(listener);
        stream->idle();
    }
}

void OpenTptConnectionProvider::unloadSegDummy()
{
}

void *OpenTptConnectionProvider::segmentToUnload()
{
    return nullptr;//(void*) &unloadSegDummy;
}
