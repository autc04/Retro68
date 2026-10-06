/*
    The 'cfrg' of a native driver built by add_ndrv().

    Mac OS reads it to find the PEF in the data fork, and silently skips
    a driver file that has none. One member, as the driver search accepts
    without further tagging; a drop-in addition rather than an application,
    and no 'SIZE', which only means something to a launched process.
*/

#include "CodeFragments.r"

#ifndef CFRAG_NAME
#define CFRAG_NAME "RetroPPC Driver"
#endif

resource 'cfrg' (0) {
	{
		kPowerPCCFragArch, kIsCompleteCFrag, kNoVersionNum, kNoVersionNum,
		kDefaultStackSize, kNoAppSubFolder,
		kDropInAdditionCFrag, kDataForkCFragLocator, kZeroOffset, kCFragGoesToEOF,
		CFRAG_NAME
	}
};
