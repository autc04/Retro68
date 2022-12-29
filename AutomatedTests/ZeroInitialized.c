#include "Test.h"
#include <Events.h>
#include <Quickdraw.h>
#include <Windows.h>

int zeroInitedArray[32768];
int commonSymbol;
int zeroInited = 0;
EventRecord e;

int main(void)
{
    int i;
    if(commonSymbol)
    {
        TEST_LOG_NO();
        return 1;
    }
    if(zeroInited)
    {
        TEST_LOG_NO();
        return 1;
    }
    for(i = 0; i < 32768; i++)
    {
        if(zeroInitedArray[i])
        {
            TEST_LOG_NO();
            return 1;
        }
        zeroInitedArray[i] = 42;
    }
    
    // Initialize some of the Macintosh Toolbox
    // and maybe trigger a context switch, so we can be sure
    // our global variables were put in the right placce.
#if !TARGET_API_MAC_CARBON
    InitGraf(&qd.thePort);
    InitFonts();
    InitWindows();
#endif
    GetNextEvent(everyEvent, &e);

    for(i = 0; i < 32768; i++)
    {
        if(zeroInitedArray[i] != 42)
        {
            TEST_LOG_NO();
            return 1;
        }
    }
    TEST_LOG_OK();
    return 0;
}
