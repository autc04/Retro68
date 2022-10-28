#include "Test.h"

int main()
{
    const unsigned char *pstr = "\pHello, world.";
    const char *cstr = "Hello, world.";

    if (pstr[0] != 13)
    {
        TEST_LOG_NO();
        return 1;
    }

    for (int i = 0; cstr[i]; ++i)
    {
        if (cstr[i] != (char) pstr[i+1])
        {
            TEST_LOG_NO();
            return 1;
        }
    }

    TEST_LOG_OK();
    return 0;
}
