#include "ReliableStream.h"
#include <iostream>
#include <vector>
#include <string>
#include <stdint.h>
#include <iomanip>

class Forwarder : public Stream
{
public:
    std::string prefix;
    Forwarder *other;
    std::vector<std::vector<uint8_t>> packets;

    virtual void write(const void* p, size_t n)
    {
        std::cout << prefix << ": ";
        for(int i = 0; i < n; i++)
            std::cout << std::hex << std::setfill('0') << std::setw(2) << (int) ((uint8_t*)p)[i] << " ";
        std::cout << std::endl;
        other->enqueueReceive(p,n);
    }

    void enqueueReceive(const void* p, size_t n)
    {
        packets.emplace_back((const uint8_t*)p, ((const uint8_t*)p)+n);
    }

    void idle()
    {
        std::vector<std::vector<uint8_t>> packets2;
        packets2.swap(packets);
        for(auto& p : packets2)
            notifyReceive(p.data(), p.size());
    }
};

class DumpToConsole : public StreamListener
{
public:
    std::string prefix;

    DumpToConsole(std::string prefix) : prefix(prefix) {}

    size_t onReceive(const uint8_t* p, size_t n)
    {
        std::cout << prefix;
        for(int i = 0; i < n; i++)
        {
            if(p[i] >= 128 || p[i] < 32)
                std::cout << "\\x" << std::hex << (unsigned)p[i];
            else
                std::cout << p[i];
        }
        std::cout << std::endl;
        return n;
    }
};

int main()
{
    Forwarder fwd1, fwd2;
    fwd1.other = &fwd2;
    fwd2.other = &fwd1;
    fwd1.prefix = "1->2";
    fwd2.prefix = "2->1";

    ReliableStream rel1(&fwd1), rel2(&fwd2);

    DumpToConsole dump1("one:");
    DumpToConsole dump2("two:");
    
    rel1.setListener(&dump1);
    rel2.setListener(&dump2);

    rel1.write("Hello, world.", 13);
    rel1.flushWrite();

    for(int i = 0; i < 10; i++)
    {
        std::cout << "handle 1:\n";
        fwd1.idle();
        std::cout << "handle 2:\n";
        fwd2.idle();
    }
    return 0;
}
