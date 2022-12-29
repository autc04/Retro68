#include <FixMath.h>
#include "Test.h"

short calc(void)
{
    return FixRound(FixRatio(42,5));
}

int main(void)
{
    if(calc() == 8)
        TEST_LOG_OK();
    else
        TEST_LOG_NO();
    return 0;
}
