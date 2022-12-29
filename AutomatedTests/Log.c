#include "Test.h"

char readWriteData[6] = "Three";

int main(void)
{
        // constant initialized data
    TEST_LOG_SIZED("One",3);
    TEST_LOG_SIZED("Two",3);
        // read-write initialized data
    TEST_LOG_SIZED(readWriteData,5);
    return 0;
}
