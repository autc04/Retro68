#include "ReliableStream.h"
#include <iterator>
#include "CRC32.h"

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
    kNack
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

ReliableStream::ReliableStream(Stream& stream)
    : stream(stream)
{
    incomingPacket.reserve(packetSize + 4);
}
ReliableStream::~ReliableStream()
{
}


void ReliableStream::sendPacket()
{
}

void ReliableStream::ack()
{
    uint8_t packet[] = {
        magic1[0], magic1[1], magic1[2], magic1[3],
        kAck, (uint8_t)~kAck, (uint8_t)receivedInputPacket, (uint8_t)~receivedInputPacket
    };
    stream.write(packet, 8);
    printf("ack sent\n");
}

void ReliableStream::nack()
{
    uint8_t packet[] = {
        magic1[0], magic1[1], magic1[2], magic1[3],
        kNack, (uint8_t)~kNack, (uint8_t)receivedInputPacket, (uint8_t)~receivedInputPacket
    };
    stream.write(packet, 8);
    printf("nack sent\n");
}

void ReliableStream::gotNack(uint8_t id)
{
    printf("got ack\n");
}

void ReliableStream::gotAck(uint8_t id)
{
    printf("got nack\n");
}

void ReliableStream::processIncoming()
{
    printf("Received packet %d - %d bytes\n", receivedInputPacket, (int)incomingPacket.size());
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
        printf("CRC mismatch %x != %x\n", receivedCRC, expectedCRC);

        nack();
        incomingPacket.clear();
        return;
    }

    receivedInputPacket++;
    printf("Verified packet %d - %d bytes\n", receivedInputPacket, (int)incomingPacket.size());
    ack();
    notifyReceive(incomingPacket.data(), incomingPacket.size() - 4);
    incomingPacket.clear();
}

void ReliableStream::write(const void* p0, size_t n)
{
    const uint8_t* p = (const uint8_t*)p0;
    
    ++sentOutputPacket;
    std::vector<uint8_t> packet = {
        magic1[0], magic1[1], magic1[2], magic1[3],
        kDataPacket, (uint8_t)~kDataPacket, (uint8_t)sentOutputPacket, (uint8_t)~sentOutputPacket
    };
    int match = 0, match2 = 0;
    int i;
    int consumed = 0;
    for(i = 0; i < n; i++)
    {
        if(p[i] == magic1[match++])
        {
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
        }
        else
            match = 0;

        if(match == 0)
            while(consumed <= i)
                packet.push_back(p[consumed++]);


        if(p[i] == magic2[match2++])
        {
            if(match2 == 4)
            {
                match2 = 0;
                packet.push_back(kEscapedMagic2);
            }
        }
        else
        {
            match2 = 0;
        }
    }
    uint32_t crc = crc32(0, p, p + n);
    printf("sending crc: %x\n", crc);

    if(crc == magic1_32 || crc == magic2_32)
    {
        packet.push_back(magic2[0]);
        packet.push_back(magic2[1]);
        packet.push_back(magic2[2]);
        packet.push_back(magic2[3]);
        packet.push_back(crc == magic1_32 ? kEscapedMagic1 : kEscapedMagic2);
    }
    else
    {
        packet.push_back(crc >> 24);
        packet.push_back(crc >> 16);
        packet.push_back(crc >> 8);
        packet.push_back(crc);
    }

    packet.push_back(magic2[0]);
    packet.push_back(magic2[1]);
    packet.push_back(magic2[2]);
    packet.push_back(magic2[3]);
    packet.push_back(kEndOfPacket);

    stream.write(packet.data(), packet.size());
}

void ReliableStream::flushWrite()
{

}

size_t ReliableStream::onReceive(const uint8_t* p, size_t n)
{
    printf("data available (%d) - state %d\n", (int)n, (int)state);

    switch(state)
    {
        case State::waiting:
            if( (n > 0  && p[0] != magic1[0])
                || (n > 1 && p[1] != magic1[1])
                || (n > 2 && p[2] != magic1[2])
                || (n > 3 && p[3] != magic1[3]) )
            {
                state = State::skipping;
                nack();
                gotNack(ackedOutputPacket);
                return n > 4 ? 4 : n;
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
                        nack();
                        state = State::skipping;
                        return 8;
                    }
                    state = State::receiving;
                    return 8;
                default:
                    state = State::skipping;
                    nack();
                    gotNack(ackedOutputPacket);
                    return 8;
            }
            break;

        case State::skipping:
            {
                int match = 0;
                int i;
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
                int match = 0, match2 = 0;
                int i;
                int consumed = 0;
                for(i = 0; i < n; i++)
                {
                    if(p[i] == magic1[match++])
                    {
                        if(match == 4)
                        {
                            state = State::waiting;
                            nack();
                            return i-3;
                        }
                    }
                    else
                        match = 0;

                    if(match2 == 4)
                    {
                        match2 = 0;
                        consumed = i+1;
                        switch(p[i])
                        {
                            case kEscapedMagic1:
                                incomingPacket.insert(incomingPacket.end(), begin(magic1), end(magic1));
                                break;
                            case kEscapedMagic2:
                                incomingPacket.insert(incomingPacket.end(), begin(magic2), end(magic2));
                                break;
                            case kEndOfPacket:
                                processIncoming();
                                state = State::waiting;
                                return i + 1;
                            default:
                                state = State::waiting;
                                nack();
                                return i + 1;
                        }
                    }
                    else if(p[i] == magic2[match2++])
                        ;
                    else
                    {
                        match2 = 0;
                    }

                    if(match == 0 && match2 == 0)
                        while(consumed <= i)
                            incomingPacket.push_back(p[consumed++]);

                }
                return i - std::max(match, match2);
            }
            break;
    }
}
