#include "ReliableStream.h"
#include <iterator>
#include "CRC32.h"
#include <cassert>

using std::begin;
using std::end;

const uint8_t magic1[4] = { 0xDE, 0xAD, 0xBE, 0xEF };
const uint8_t magic2[4] = { 0xFA, 0xCE, 0xCA, 0xFE };

const uint32_t magic1_32 = 0xDEADBEEF;
const uint32_t magic2_32 = 0xFACECAFE;

enum thing : uint8_t
{
    kDataPacket = 0,
    kEndOfPacket,
    kEscapedMagic1,
    kEscapedMagic2,
    kAck,
    kNack,
    kReset1,
    kReset2
};

inline uint32_t readLong(uint8_t* p)
{
    uint32_t x;
    x = *p++;
    x = (x << 8) | *p++;
    x = (x << 8) | *p++;
    x = (x << 8) | *p++;
    return x;
}

ReliableStream::ReliableStream(Stream* stream)
    : StreamWrapper(stream)
{
    incomingPacket.reserve(packetSize + 4);
}

void ReliableStream::reset(int sendReset)
{
    //printf("reset %d\n", sendReset);
    receivedInputPacket = 0;
    sentOutputPacket = 0;
    ackedOutputPacket = 0;

    failedReceiveCount = failedSendCount = 0;

    incomingPacket.clear();
    state = State::waiting;
    sentPackets.clear();
    packetsToSend.clear();

    resetResponse = false;

    if(sendReset)
    {
        uint8_t resetKind = sendReset == 1 ? kReset1 : kReset2;
        uint8_t packet[] = {
            magic1[0], magic1[1], magic1[2], magic1[3],
            resetKind, (uint8_t)~resetKind
        };
        underlying().write(packet, 6);
    }
}

void ReliableStream::ack()
{
    uint8_t packet[] = {
        magic1[0], magic1[1], magic1[2], magic1[3],
        kAck, (uint8_t)~kAck, (uint8_t)receivedInputPacket, (uint8_t)~receivedInputPacket
    };
    underlying().write(packet, 8);
    //printf("ack sent\n");
}

void ReliableStream::nack()
{
    uint8_t packet[] = {
        magic1[0], magic1[1], magic1[2], magic1[3],
        kNack, (uint8_t)~kNack, (uint8_t)receivedInputPacket, (uint8_t)~receivedInputPacket
    };
    underlying().write(packet, 8);
    //printf("nack sent\n");
    failedReceiveCount++;
}

void ReliableStream::gotAck(uint8_t id)
{
    unsigned nAcked = (id - ackedOutputPacket) & 0xFF;
    //printf("got ack %d -> %u packets of %u acked\n", (int)id, nAcked, (unsigned)sentPackets.size());
    if(nAcked <= sentPackets.size())
    {
        ackedOutputPacket += nAcked;
        for(unsigned i = 0; i < nAcked; i++)
            sentPackets.pop_front();

        sendPackets();
    }
}

void ReliableStream::gotNack(uint8_t id)
{
    //printf("got nack %d\n", (int)id);

    unsigned nAcked = (id - ackedOutputPacket) & 0xFF;
    if(nAcked <= sentPackets.size())
    {
        ackedOutputPacket += nAcked;
        for(unsigned i = 0; i < nAcked; i++)
            sentPackets.pop_front();

        sentOutputPacket = ackedOutputPacket;

        failedSendCount += packetsToSend.size();
        packetsToSend.splice(packetsToSend.begin(), sentPackets);
        
        sendPackets();
    }
}

void ReliableStream::processIncoming()
{
    //printf("Received packet %d - %d bytes\n", receivedInputPacket + 1, (int)incomingPacket.size());
    if(incomingPacket.size() < 4)
    {
        nack();
        incomingPacket.clear();
        return;
    }
    uint32_t expectedCRC = crc32(0, incomingPacket.begin(), incomingPacket.end() - 4);
    uint32_t receivedCRC = readLong(&incomingPacket[incomingPacket.size()-4]);
    if(receivedCRC != expectedCRC)
    {
        //printf("CRC mismatch %x != %x\n", receivedCRC, expectedCRC);

        nack();
        incomingPacket.clear();
        return;
    }

    receivedInputPacket++;
    //printf("Verified packet %d - %d bytes\n", receivedInputPacket, (int)incomingPacket.size());
    ack();
    notifyReceive(incomingPacket.data(), incomingPacket.size() - 4);
    incomingPacket.clear();
}

void ReliableStream::sendOnePacket()
{
    if(packetsToSend.empty())
        return;
    
    const uint8_t* p = packetsToSend.front().data();
    size_t n = packetsToSend.front().size();

    if(n < packetSize)
        flushRequested = false;

    ++sentOutputPacket;
    sentPackets.splice(sentPackets.end(), packetsToSend, packetsToSend.begin());

    std::vector<uint8_t> packet;
    packet.reserve(n + 32);
    packet = {
        magic1[0], magic1[1], magic1[2], magic1[3],
        kDataPacket, (uint8_t)~kDataPacket, (uint8_t)sentOutputPacket, (uint8_t)~sentOutputPacket
    };
    
    int match = 0, match2 = 0;
    size_t i;
    size_t consumed = 0;
    for(i = 0; i < n; i++)
    {
        if(p[i] == magic1[match])
            match++;
        else if(p[i] == magic1[0])
            match = 1;
        else
            match = 0;

        if(match == 4)
        {
            packet.push_back(magic2[0]);
            packet.push_back(magic2[1]);
            packet.push_back(magic2[2]);
            packet.push_back(magic2[3]);
            packet.push_back(kEscapedMagic1);
            match = 0;
            consumed = i+1;
        }

        if(match == 0)
            while(consumed <= i)
                packet.push_back(p[consumed++]);


        if(p[i] == magic2[match2])
            match2++;
        else if(p[i] == magic2[0])
            match2 = 1;
        else
            match2 = 0;

        if(match2 == 4)
        {
            match2 = 0;
            packet.push_back(kEscapedMagic2);
        }
    }
    while(consumed < i)
        packet.push_back(p[consumed++]);


    packet.push_back(magic2[0]);
    packet.push_back(magic2[1]);
    packet.push_back(magic2[2]);
    packet.push_back(magic2[3]);
    packet.push_back(kEndOfPacket);

    //printf("sent packet: %d, total %d bytes\n", sentOutputPacket, (int)packet.size());
    //printf("sendOnePacket: %d - %d packets, next = %d\n", (int)packetsToSend.size(), (int)sentPackets.size(), sentOutputPacket + 1);
    underlying().write(packet.data(), packet.size());
}

void ReliableStream::sendPackets()
{
    //printf("sendPackets: %d - %d packets, next = %d\n", (int)packetsToSend.size(), (int)sentPackets.size(), sentOutputPacket + 1);
    while(!packetsToSend.empty() && sentPackets.size() < maxInFlight
        && (flushRequested || sentPackets.front().size() >= packetSize))
        sendOnePacket();
}

void ReliableStream::flushWrite()
{
    flushRequested = true;
    sendPackets();
}

void ReliableStream::write(const void* p, size_t n)
{
    while(n)
    {
        size_t availableSpaceInPacket = 0;
        if(!packetsToSend.empty())
            availableSpaceInPacket = packetSize - (packetsToSend.back().size()-4);

        uint32_t crc = 0;

        if(availableSpaceInPacket)
        {
            auto& packet = packetsToSend.back();

            auto p = packet.end() - 4;
            crc = (p[0] << 24) | (p[1] << 16) | (p[2] << 8) | p[3];
            packet.erase(p, packet.end());
        }
        else
        {
            packetsToSend.emplace_back();
            availableSpaceInPacket = packetSize;
            flushRequested = false;
        }

        size_t n1 = n > availableSpaceInPacket ? availableSpaceInPacket : n;
        
        auto& packet = packetsToSend.back();
        packet.reserve(packetSize + 4);

        auto newData = packet.end();
        packet.insert(newData, (const uint8_t*)p, ((const uint8_t*)p)+n1);
        crc = crc32(crc,  newData, packet.end());
        //printf("outgoing crc: %x (bytes: %d without crc and header)\n", (unsigned) crc, (int)packet.size());
        packet.push_back(crc >> 24);
        packet.push_back(crc >> 16);
        packet.push_back(crc >> 8);
        packet.push_back(crc);

        p = ((const uint8_t*)p) + n1;
        n -= n1;
    }
    flushWrite();
}
//#include <MacTypes.h>

size_t ReliableStream::onReceive(const uint8_t* p, size_t n)
{
    //printf("data available (%d) - state %d\n", (int)n, (int)state);
    switch(state)
    {
        case State::waiting:
            if( (n > 0  && p[0] != magic1[0])
                || (n > 1 && p[1] != magic1[1])
                || (n > 2 && p[2] != magic1[2])
                || (n > 3 && p[3] != magic1[3]) )
            {
                state = State::skipping;
                //printf("no magic\n");
                nack();
                gotNack(ackedOutputPacket);

                if(p[0] != magic1[0])
                    return 0;
                else if(p[1] != magic1[1])
                    return 1;
                else if(p[2] != magic1[2])
                    return 2;
                else
                    return 3;
            }
            if(n < 6)
                return 0;
            
            if(p[5] != (uint8_t)~p[4])
            {
                state = State::skipping;
                nack();
                gotNack(ackedOutputPacket);
                return 6;
            }
            
            switch(p[4])
            {
                case kAck:
                    if(n < 8)
                        return 0;
                    if(p[6] != (uint8_t)~p[7])
                    {
                        state = State::skipping;
                        nack();
                        gotNack(ackedOutputPacket);
                        return 8;
                    }
                    gotAck(p[6]);
                    return 8;
                case kNack:
                    if(n < 8)
                        return 0;
                    if(p[6] != (uint8_t)~p[7])
                    {
                        state = State::skipping;
                        nack();
                        gotNack(ackedOutputPacket);
                        return 8;
                    }
                    gotNack(p[6]);
                    return 8;
                case kDataPacket:
                    if(n < 8)
                        return 0;
                    if(p[6] != (uint8_t)~p[7])
                    {
                        state = State::skipping;
                        nack();
                        gotNack(ackedOutputPacket);
                        return 8;
                    }
                    if(p[6] != ((receivedInputPacket + 1) & 0xFF))
                    {
                        //printf("bad serial: %d %d\n", p[6], receivedInputPacket+1);
                        //nack();
                        state = State::skipping;
                        return 8;
                    }
                    state = State::receiving;
                    inputMatchMagic1 = inputMatchMagic2 = 0;
                    return 8;
                
                case kReset1:
                    reset(2);
                    notifyReset();
                    return 6;

                case kReset2:
                    reset(0);
                    resetResponse = true;
                    notifyReset();
                    return 6;

                default:
                    state = State::skipping;
                    nack();
                    gotNack(ackedOutputPacket);
                    return 8;
            }
            break;

        case State::skipping:
            {
                unsigned match = 0;
                unsigned i;
                for(i = 0; i < n; i++)
                {
                    if(p[i] == magic1[match++])
                    {
                        if(match == 4)
                        {
                            state = State::waiting;
                            return i-3;
                        }
                    }
                    else
                        match = 0;
                }
                return i - match;
            }
            break;

        case State::receiving:
            {
                for(unsigned i = 0; i < n; i++)
                {
                    incomingPacket.push_back(p[i]);

                    if(inputMatchMagic2 == 4)
                    {
                        inputMatchMagic2 = 0;
                        incomingPacket.pop_back();
                        switch(p[i])
                        {
                            case kEscapedMagic1:
                                std::copy(begin(magic1), end(magic1), incomingPacket.end()-4);
                                break;
                            case kEscapedMagic2:
                                break;
                            case kEndOfPacket:
                                incomingPacket.erase(incomingPacket.end()-4, incomingPacket.end());
                                processIncoming();
                                state = State::waiting;
                                return i + 1;
                            default:
                                state = State::waiting;
                                nack();
                                return i + 1;
                        }
                    }

                    if(p[i] != magic1[inputMatchMagic1])
                        inputMatchMagic1 = 0;
                    if(p[i] == magic1[inputMatchMagic1])
                        inputMatchMagic1++;
                    if(p[i] != magic2[inputMatchMagic2])
                        inputMatchMagic2 = 0;
                    if(p[i] == magic2[inputMatchMagic2])
                        inputMatchMagic2++;
                    
                    if(inputMatchMagic1 == 4)
                    {
                        state = State::waiting;
                        nack();
                        return i-3;
                    }
                }
                return n;
            }
            break;
    }
    std::abort();   // unreachable
}
