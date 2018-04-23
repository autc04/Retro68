#ifndef UNRELIABLESTREAM_H_
#define UNRELIABLESTREAM_H_

#include "Stream.h"

    // A stream filter to simulate bit errors
class UnreliableStream : public StreamWrapper
{
    int nextError = 0;
public:
    UnreliableStream(Stream* stream)
        : StreamWrapper(stream)
    {
        setupNextError();
    }
    virtual void write(const void* p, size_t n) override
    {
        std::vector<uint8_t> tmp(n);
        memcpy(tmp.data(), p, n);
        maybeFlipBit(tmp.data(), n);
        underlying().write(tmp.data(),n);
    }
    virtual void flushWrite() override
    {
        underlying().flushWrite();
    }

private:
    virtual size_t onReceive(const uint8_t* p, size_t n) override
    {
        std::vector<uint8_t> tmp(n);
        memcpy(tmp.data(), p, n);
        maybeFlipBit(tmp.data(), n);
        notifyReceive(tmp.data(), n);
        return n;
    }

    void setupNextError()
    {
        nextError += rand() % (40 * 8 * 1000 + 3);
    }

    void maybeFlipBit(uint8_t* p, size_t n)
    {
        while(nextError < n * 8)
        {
            p[n / 8] ^= 0x80 >> (n%8);
            setupNextError();
        }
        nextError -= n * 8;
    }
};

#endif
