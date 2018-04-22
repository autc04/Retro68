#ifndef RELIABLESTREAM_H_
#define RELIABLESTREAM_H_

#include "Stream.h"

#include <vector>
#include <list>

class ReliableStream : public Stream, public StreamListener
{
    Stream& stream;

    static const int maxInFlight = 4;
    static const int packetSize = 1024;
    
    unsigned receivedInputPacket = 0;
    unsigned sentOutputPacket = 0;
    unsigned ackedOutputPacket = 0;

    void sendOnePacket();
    void sendPackets();
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
    int inputMatchMagic1, inputMatchMagic2;

    std::list<std::vector<uint8_t>> packetsToSend;
    std::list<std::vector<uint8_t>> sentPackets;

public:
    ReliableStream(Stream& stream);
    virtual ~ReliableStream();

    virtual void write(const void* p, size_t n) override;
    virtual void flushWrite() override;

    virtual size_t onReceive(const uint8_t* p, size_t n) override;
};

#endif
