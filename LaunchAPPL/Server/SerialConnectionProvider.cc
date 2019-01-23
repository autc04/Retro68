/*
    Copyright 2019 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

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
