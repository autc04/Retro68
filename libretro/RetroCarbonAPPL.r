#include "Processes.r"
#include "CodeFragments.r"

#ifndef CFRAG_NAME
#define CFRAG_NAME "RetroPPC Application"
#endif

resource 'cfrg' (0) {
	{
		kPowerPCCFragArch, kIsCompleteCFrag, kNoVersionNum, kNoVersionNum,
		kDefaultStackSize, kNoAppSubFolder,
		kApplicationCFrag, kDataForkCFragLocator, kZeroOffset, kCFragGoesToEOF,
		CFRAG_NAME
	}
};

type 'carb' {
};

resource 'carb' (0) {
};

resource 'SIZE' (-1) {
	reserved,
	acceptSuspendResumeEvents,
	reserved,
	canBackground,
	doesActivateOnFGSwitch,
	backgroundAndForeground,
	dontGetFrontClicks,
	ignoreChildDiedEvents,
	is32BitCompatible,
	isHighLevelEventAware,
	onlyLocalHLEvents,
	notStationeryAware,
	dontUseTextEditServices,
	reserved,
	reserved,
	reserved,
	1024 * 1024,
	1024 * 1024
};
