/*
   Part of the multi-segment exception test.

   This file is placed in a separate segment by MultiSegExceptions.segmap.
   The functions are called from the main segment via the far jump table;
   calling one loads the segment, and UnloadSeg unloads it again.
*/

extern "C" void throwFromSeg2()
{
    throw 42;
}

/* Deliberately unreferenced: with -ffunction-sections its code section is
   dropped by --gc-sections, so the linker must also drop its FDE from this
   segment's .eh_frame. */
extern "C" void unusedThrowInSeg2()
{
    throw 43;
}
