#ifndef MACSERIALSTREAM_H_
#define MACSERIALSTREAM_H_

#include <Stream.h>

class MacSerialStream : public Stream
{
    static const long kInputBufferSize = 4096;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short outRefNum, inRefNum;
    int curBaud;
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    MacSerialStream();
    ~MacSerialStream();

    void close();
    void open();

    void setBaud(int baud);
};

#endif
