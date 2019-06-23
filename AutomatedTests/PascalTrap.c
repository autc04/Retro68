#include <FixMath.h>
#include "Test.h"

short calc()
{
    return FixRound(FixRatio(42,5));
}

int main()
{
    if(calc() == 8)
        TEST_LOG_OK();
    else
        TEST_LOG_NO();
    return 0;
}
