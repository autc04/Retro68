#include "Processes.r"
#include "Retro68.r"

resource 'CODE' (0) RETRO68_JUMP_TABLE;

resource 'CODE' (1) {
	dontBreakAtEntry, $$read(FLT_FILE_NAME);
};

resource 'SIZE' (-1) {
	dontSaveScreen,
	acceptSuspendResumeEvents,
	enableOptionSwitch,
	canBackground,
	multiFinderAware,
	backgroundAndForeground,
	dontGetFrontClicks,
	ignoreChildDiedEvents,
	is32BitCompatible,
	reserved,
	reserved,
	reserved,
	reserved,
	reserved,
	reserved,
	reserved,
	1024 * 1024,
	1024 * 1024
};
