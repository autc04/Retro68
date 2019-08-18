#include "Test.h"
#include <SegLoad.h>
#include <Memory.h>
#include <stdio.h>

int variable;

void Foo();
void Bar();

Boolean Test(Boolean unloadFoo, Boolean unloadBar, Boolean compact)
{
    variable = 6;
    Foo();
    if(variable != 54)
    {
        TestLog("Expected 54 after Foo().");
        return false;
    }

    if(unloadFoo)
        UnloadSeg(&Foo);
    if(unloadBar)
        UnloadSeg(&Bar);

    Size grow;
    if(compact)
        MaxMem(&grow);

    Bar();
    if(variable != 42)
    {
        TestLog("Expected 42 after Bar().");
        return false;
    }
    return true;
}

int main()
{
    Size grow, maxblock, maxblock2, freemem, freemem2;

    MaxApplZone();    // just to keep things simple and predictable
    MoreMasters();

    maxblock = MaxMem(&grow);
    freemem = FreeMem();

    TestLog("1. No unloading");
    if(!Test(false, false, false))
        return 1;

    maxblock2 = MaxMem(&grow);


    TestLog("2. UnloadSeg(&Foo)");
    if(!Test(true, false, false))
        return 1;
    TestLog("3. UnloadSeg(&Bar)");
    if(!Test(false, true, false))
        return 1;
    TestLog("4. UnloadSeg(&Foo); UnloadSeg(&Bar)");
    if(!Test(true, true, false))
        return 1;

    TestLog("5. UnloadSeg(&Foo); MaxMem()");
    if(!Test(true, false, true))
        return 1;
    TestLog("6. UnloadSeg(&Bar); MaxMem()");
    if(!Test(false, true, true))
        return 1;
    TestLog("7. UnloadSeg(&Foo); UnloadSeg(&Bar); MaxMem()");
    if(!Test(true, true, true))
        return 1;

    UnloadSeg(&Foo);

    maxblock2 = MaxMem(&grow);
    freemem2 = FreeMem();

    if(maxblock2 < maxblock || freemem2 < freemem)
    {
        TestLog("Leak");
        char s[256];
        sprintf(s, "maxblock: %d (delta %d), freemem: %d (delta %d)",
                maxblock2, maxblock2-maxblock, freemem2, freemem2-freemem);
        TestLog(s);
        return 1;
    }
    else if(maxblock2 > maxblock || freemem2 > freemem)
        TestLog("Magic Memory");

    TestLog("OK");

    return 0;
}
