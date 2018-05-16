#pragma once

#include <Stream.h>
#include <OpenTransport.h>
#include <stdint.h>

class OpenTptStream : public Stream
{
    static const long kReadBufferSize = 4096;
    uint8_t readBuffer[kReadBufferSize];

    bool connected = false;

    TEndpoint *endpoint;
    TCall call;

    void tryListening();
    void tryReading();
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    OpenTptStream();
    ~OpenTptStream();
};


