/*
   Multi-segment C++ exception test.

   Exercises the interaction between segmented code and .eh_frame:
     - exceptions thrown and caught within one segment,
     - an exception thrown in a different segment and caught in the main
       segment (so the unwinder walks out of the segment-2 frame),
     - the same after that segment has been unloaded (exercising the
       per-segment __register_frame_info/__deregister_frame_info and the
       main segment's .eh_frame on its own), and
     - after reloading that segment.

   The segment-2 object additionally defines an unused throwing function so
   that --gc-sections has to drop an FDE from that segment's .eh_frame.
*/

#include "Test.h"

#include <SegLoad.h>
#include <Memory.h>

extern "C" void throwFromSeg2();

static int failures;

static void throwInMain()
{
    throw 42;
}

int main()
{
    MaxApplZone();
    MoreMasters();

    /* 1. throw and catch within the main segment */
    try { throwInMain(); TestLog("1: no throw"); ++failures; }
    catch (...) {}

    /* 2. throw in segment 2, catch in the main segment.  This loads
       segment 2 and makes the unwinder walk out of it. */
    try { throwFromSeg2(); TestLog("2: no throw"); ++failures; }
    catch (...) {}

    /* 3. unload segment 2, then throw and catch in the main segment
       again.  Segment 2's .eh_frame is deregistered here. */
    UnloadSeg((void*)&throwFromSeg2);
    try { throwInMain(); TestLog("3: no throw"); ++failures; }
    catch (...) {}

    /* 4. reload segment 2 and cross the segment boundary again */
    try { throwFromSeg2(); TestLog("4: no throw"); ++failures; }
    catch (...) {}

    UnloadSeg((void*)&throwFromSeg2);

    if (failures == 0)
        TestLog("OK");
    return failures == 0 ? 0 : 1;
}
