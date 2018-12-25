#ifndef RELIABLESTREAM_H_
#define RELIABLESTREAM_H_

#include "Stream.h"

#include <vector>
#include <list>

class ReliableStream : public StreamWrapper
{
    static const int maxInFlight = 3;
    static const int packetSize = 1024;

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

    unsigned receivedInputPacket = 0;
    unsigned sentOutputPacket = 0;
    unsigned ackedOutputPacket = 0;

    unsigned failedReceiveCount = 0;
    unsigned failedSendCount = 0;

    State state = State::waiting;
    std::vector<uint8_t> incomingPacket;
    int inputMatchMagic1, inputMatchMagic2;

    std::list<std::vector<uint8_t>> packetsToSend;
    std::list<std::vector<uint8_t>> sentPackets;

    bool resetResponse = false;
    bool flushRequested = false;

    virtual size_t onReceive(const uint8_t* p, size_t n) override;
public:
    explicit ReliableStream(Stream* stream);
    void reset(int sendReset);
    bool resetResponseArrived() { return resetResponse; }
    
    virtual void write(const void* p, size_t n) override;
    virtual void flushWrite() override;


    virtual bool readyToWrite() const override { return packetsToSend.empty() && underlying().readyToWrite(); }
    virtual bool allDataArrived() const override { return packetsToSend.empty() && sentPackets.empty() && underlying().readyToWrite(); }

    unsigned getFailedReceiveCount() const { return failedReceiveCount; }
    unsigned getFailedSendCount() const { return failedSendCount; }
};

#endif
