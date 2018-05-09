#pragma once

#include <Stream.h>
#include <MacTCP.h>

class MacTCPStream : public Stream
{
    static const long kInputBufferSize = 8192;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short refNum;
    bool connected = false;

    StreamPtr tcpStream;
    TCPiopb readPB, writePB;

    void startListening();
    void startReading();
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    MacTCPStream();
    ~MacTCPStream();
};


