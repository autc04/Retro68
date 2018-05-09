#ifndef MACSERIALSTREAM_H_
#define MACSERIALSTREAM_H_

#include <Stream.h>

class MacSerialStream : public Stream
{
    static const long kInputBufferSize = 8192;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short outRefNum, inRefNum;
    int port, curBaud;
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    MacSerialStream(int port = 0, int baud = 19200);
    ~MacSerialStream();

    void close();
    void open();

    void setBaud(int baud);
};

#endif
