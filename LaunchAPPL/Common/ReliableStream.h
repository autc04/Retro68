#ifndef RELIABLESTREAM_H_
#define RELIABLESTREAM_H_

#include "Stream.h"

class ReliableStream : public Stream, public StreamListener
{
    Stream& stream;

    static const int packetSize = 256;
    
    int receivedInputPacket = 0;
    int sentOutputPacket = 0;
    int ackedOutputPacket = 0;

    void sendPacket();
    void nack();
    void ack();

    void gotNack(uint8_t id);
    void gotAck(uint8_t id);

    void processIncoming();

    enum class State
    {
        waiting,
        skipping,
        receiving
    };

    State state = State::waiting;
    std::vector<uint8_t> incomingPacket;

public:
    ReliableStream(Stream& stream);
    virtual ~ReliableStream();

    virtual void write(const void* p, size_t n) override;
    virtual void flushWrite() override;

    virtual size_t onReceive(const uint8_t* p, size_t n) override;
};

#endif
