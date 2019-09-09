#ifndef PEF_H
#define PEF_H

#include <stdint.h>

typedef uint32_t OSType;

/* Definitions for PEF, from the Multiversal Interfaces */
#include "PEFBinaryFormat.h"


template <typename T>
void eswap(T *data, const char * format)
{
    int endianTest = 1;
    if(*(char*)&endianTest == 0)
        return;

    char *p = reinterpret_cast<char*>(data);
    const char *q = format;
    while(char c = *q++)
    {
        assert(p <= reinterpret_cast<char*>(data) + sizeof(T));
        if(c == 'L')
        {
            std::swap(p[0], p[3]);
            std::swap(p[1], p[2]);
            p += 4;
        }
        else if(c == 's')
        {
            std::swap(p[0], p[1]);
            p += 2;
        }
        else if(c == '*')
        {
            return;
        }
        else
        {
            assert(c == '.');
            ++p;
        }
    }

    assert(p == reinterpret_cast<char*>(data) + sizeof(T));
}

#define DEFINE_ESWAP(T, S) \
    inline void eswap(T* data) { eswap(data, S); }

DEFINE_ESWAP(PEFContainerHeader, "LLLLLLLLssL")
DEFINE_ESWAP(PEFSectionHeader, "LLLLLL....")
DEFINE_ESWAP(PEFLoaderInfoHeader, "LLLLLLLLLLLLLL")
DEFINE_ESWAP(PEFImportedLibrary, "LLLLL..s")
DEFINE_ESWAP(PEFImportedSymbol, "L")
DEFINE_ESWAP(PEFLoaderRelocationHeader, "ssLL")
DEFINE_ESWAP(PEFExportedSymbol, "LLs")



struct CFragResourceMember {
  uint32_t        architecture;
  uint16_t        reservedA;
  uint8_t        reservedB;
  uint8_t        updateLevel;
  uint32_t        currentVersion;
  uint32_t        oldDefVersion;
  uint32_t        uUsage1;  // default stack size
  uint16_t        uUsage2;  // app load folder
  uint8_t        usage;
  uint8_t        where;
  uint32_t        offset;
  uint32_t        length;
  uint32_t        uWhere1;
  uint16_t        uWhere2;
  uint16_t        extensionCount;
  uint16_t        memberSize;
  unsigned char    name[16];
};

struct CFragResource {
  uint32_t                reservedA;
  uint32_t                reservedB;
  uint16_t                reservedC;
  uint16_t                version;
  uint32_t                reservedD;
  uint32_t                reservedE;
  uint32_t                reservedF;
  uint32_t                reservedG;
  uint16_t                reservedH;
  uint16_t                memberCount;
  CFragResourceMember    firstMember;
};


DEFINE_ESWAP(CFragResource, "LLssLLLLss*")
DEFINE_ESWAP(CFragResourceMember, "Ls..LLLs..LLLsss*")

#endif // PEF_H
