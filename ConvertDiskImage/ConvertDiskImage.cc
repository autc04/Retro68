#include <ResourceFile.h>
#include <BinaryIO.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cassert>
#include <cstdint>
#include <vector>

void decompressADC(std::vector<uint8_t>& outbuf, const std::vector<uint8_t>& inbuf)
{
    outbuf.reserve(0x40000);
    auto p = inbuf.begin();

    while(p != inbuf.end())
    {
        auto cmd = *p++;
        if(cmd & 0x80)
        {
            int n = (cmd & 0x7f) + 1;
            outbuf.insert(outbuf.end(), p, p + n);
            p += n;
            assert(p <= inbuf.end());
        }
        else
        {
            int off;
            int n;
            if(cmd & 0x40)
            {
                n = (cmd & 0x3f) + 4;
                off = *p++ << 8;
                off |= *p++;
            }
            else
            {
                n = ((cmd & 0x3c) >> 2) + 3;
                off = ((cmd & 3) << 8) | *p++;
            }
            ++off;
            
            assert(n > 0);
            assert(off > 0);
            assert(outbuf.size() - off >= 0);
            outbuf.resize(outbuf.size() + n);
            auto dst = outbuf.end() - n;
            auto src = dst - off;
            while(n--)
                *dst++ = *src++;
        }
    }
}

int main(int argc, char* argv[])
{
    if(argc != 3)
	{
		std::cerr << "Usage: ConvertDiskImage input.img output.dsk\n";
		return 1;
	}

    ResourceFile file;
    if(!file.read(argv[1]))
    {
        std::cerr << "Couldn't read input.\n";
        return 1;
    }

    std::istringstream bcem(file.resources.resources[ResRef("bcem",128)].getData());
    std::istringstream ndif(file.data);
    std::ofstream output(argv[2], std::ios::binary | std::ios::trunc);

    word(bcem);
    word(bcem);
    for(int i = 0; i<64; i++)
        byte(bcem); // volume name
    
    int blockCount [[maybe_unused]] = longword(bcem);
    int blockSize = longword(bcem) & ~1; // ???
    std::cout << blockCount << " blocks of " << blockSize << std::endl;
    int hhBSZeroOffset [[maybe_unused]] = longword(bcem);
    int checksum [[maybe_unused]] = longword(bcem);
    int unknown1 [[maybe_unused]] = longword(bcem);
    int unknown2 [[maybe_unused]] = longword(bcem);
    int unknown3 [[maybe_unused]] = longword(bcem);

    for(int i = 0; i < 7; i++)
        longword(bcem); // reserved

    int nChunks = longword(bcem);

    std::vector<uint8_t> inbuf;
    std::vector<uint8_t> outbuf;

    for(int i = 0; i < nChunks; i++)
    {
        unsigned tmp = longword(bcem);
        unsigned dstStartOffset = blockSize * (tmp >> 8);
        unsigned compression = tmp & 0xFF;
        unsigned offset = longword(bcem);
        unsigned size = longword(bcem);

        std::cout << std::hex << "starting at " << dstStartOffset << " from " << offset << " size " << size << " compression " << compression << std::endl;

        if(output.tellp() < dstStartOffset)
        {
            std::cout << std::hex << "zero bytes from " << output.tellp() << std::endl;

            output.seekp(dstStartOffset - 1);
            output.put(0);
        }

        inbuf.clear();
        outbuf.clear();

        inbuf.resize(size);
        ndif.seekg(offset);
        ndif.read((char*)inbuf.data(), size);

        switch(compression)
        {
            case 0:
            case 0xFF:
                break;
            case 2:
                outbuf = std::move(inbuf);
                break;
            
            case 0x83:
                decompressADC(outbuf, inbuf);
                break;
        }

        output.write((char*)outbuf.data(), outbuf.size());
    }

    return 0;
}
