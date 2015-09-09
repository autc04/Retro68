#ifndef PEF_H
#define PEF_H

/* Provide minimal definitions from ConfitionalMacros.h.
 * ConditionalMacros.h can't deal with our host C compiler.
 */
#define __CONDITIONALMACROS__
#define TYPE_BOOL 1
#define EXTERN_API(x) x
#define EXTERN_API_C(x) x
#define CALLBACK_API(ret,name) ret (*name)
#define CALLBACK_API_C(ret,name) ret (*name)
#define ONEWORDINLINE(x)
#define TWOWORDINLINE(x,y)
#define THREEWORDINLINE(x,y,z)
#define FOUR_CHAR_CODE(x) (x)
#define PRAGMA_STRUCT_PACKPUSH 1

/* Can't use MacTypes.h either,
 * as older versions are hardcoded to 32 bit platforms.
 */
#define __MACTYPES__
typedef uint8_t 					UInt8;
typedef int8_t 					SInt8;
typedef uint16_t				UInt16;
typedef int16_t SInt16;
typedef uint32_t UInt32;
typedef int32_t SInt32;
typedef uint32_t OSType;
typedef int16_t OSErr;
typedef const unsigned char ConstStr63Param[64];
typedef const unsigned char ConstStr255Param[256];
typedef unsigned char Str255[256];
typedef unsigned char *StringPtr;
typedef char* Ptr;
typedef int16_t Boolean;
typedef void *LogicalAddress;

#define __FILES__
typedef struct {} FSSpec, *FSSpecPtr;

/* Definitions for PEF, from Apple's Universal Interfaces */
#include <PEFBinaryFormat.h>
#include <CodeFragments.h>


/* Deal with differences between versions of PEFBinaryFormat.h */
#ifndef PEFRelocComposeSetPosition_1st
#define PEFRelocComposeSetPosition_1st(fullOffset)  \
		( 0xA000 | ((UInt16) (((UInt32)(fullOffset)) >> 16) ) )
#define PEFRelocComposeSetPosition_2nd(fullOffset)  \
		( (UInt16) ((UInt32)(fullOffset) & 0xFFFF) )

#define PEFRelocComposeLgByImport_1st(fullIndex)    \
		( 0xA400 | ((UInt16) (((UInt32)(fullIndex)) >> 16) ) )
#define PEFRelocComposeLgByImport_2nd(fullIndex)    \
		( (UInt16) ((UInt32)(fullIndex) & 0xFFFF) )
#endif

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

DEFINE_ESWAP(CFragResource, "LLssLLLLss*")
DEFINE_ESWAP(CFragResourceMember, "Ls..LLLs..LLLsss*")

#endif // PEF_H
