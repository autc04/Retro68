#include "Test.h"

void TestLog(const char *str)
{
	TEST_LOG_SIZED(str, strlen(str));
}
