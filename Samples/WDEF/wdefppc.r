#include "MixedMode.r"

type 'WDEF' as 'rdes';

resource 'WDEF' (129) {
    0x00003BB0,                                     // ProcInfo
    $$Read("WDEF.pef")                    // Specify name of PEF file
};

