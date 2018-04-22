#ifndef STREAM_H_
#define STREAM_H_

#include <stdint.h>
#include <stddef.h>
#include <vector>

class StreamListener
{
public:
    virtual size_t onReceive(const uint8_t* p, size_t n) = 0;
};

class Stream
{
    StreamListener *listener_ = nullptr;
    std::vector<uint8_t> buffer_;
public:
    Stream();
    virtual ~Stream();

    void setListener(StreamListener *l) { listener_ = l; }

    virtual void write(const void* p, size_t n) = 0;
    virtual void flushWrite() {}
    long read(void *p, size_t n);

protected:
    void notifyReceive(const uint8_t* p, size_t n);
};

#endif
