#ifndef STREAM_H_
#define STREAM_H_

#include <stdint.h>
#include <stddef.h>
#include <vector>

class StreamListener
{
public:
    virtual size_t onReceive(const uint8_t* p, size_t n) = 0;
    virtual void onReset() {}
};

class Stream
{
    StreamListener *listener_ = nullptr;
    std::vector<uint8_t> buffer_;
public:
    Stream();
    virtual ~Stream();

    void setListener(StreamListener *l) { listener_ = l; }
    void clearListener(StreamListener *l = nullptr) { if(!l || listener_ == l) listener_ = nullptr; }

    virtual void write(const void* p, size_t n) = 0;
    virtual void flushWrite() {}
    long read(void *p, size_t n);

    virtual bool readyToWrite() const { return true; }
    bool readyToRead() const { return !buffer_.empty(); }

    virtual bool allDataArrived() const { return true; }
protected:
    void notifyReceive(const uint8_t* p, size_t n);
    void notifyReset();
};

class StreamWrapper : public Stream, private StreamListener
{
    Stream* underlying_;
public:
    StreamWrapper(Stream* underlying_);
    virtual ~StreamWrapper();
    
    StreamWrapper(const StreamWrapper& other) = delete;
    StreamWrapper& operator=(const StreamWrapper& other) = delete;
    StreamWrapper(StreamWrapper&& other);
    StreamWrapper& operator=(StreamWrapper&& other);

    Stream& underlying() const { return *underlying_; }
};

#endif
