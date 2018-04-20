#include <stdint.h>
#include <stddef.h>

class Block
{
    uint8_t *begin_ = nullptr;
    uint8_t *end_ = nullptr;
public:
    Block() = default;
    Block(uint8_t *p, size_t len) : begin_(p), end_(p+len) {}
    Block(uint8_t *b, uint8_t *e) : begin_(b), end_(e) {}

    uint8_t * begin() { return begin_; }
    const uint8_t * begin() const { return begin_; }
    uint8_t * end() { return end_; }
    const uint8_t * end() const { return end_; }

    size_t size() const { return end_ - begin_; }
};

class StreamListener
{
public:
    virtual void onReceive(const Block& b) = 0;
};

class Stream
{
    StreamListener *listener_;
public:
    void setListener(StreamListener *l) { listener_ = l; }

    virtual void send(const Block& b) = 0;

protected:
    void onReceive(const Block& b)
        { if(listener_) listener_->onReceive(b); }
};
