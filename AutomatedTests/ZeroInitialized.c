#include "Test.h"
#include <Events.h>

int zeroInitedArray[32768];
int commonSymbol;
int zeroInited = 0;
EventRecord e;

int main()
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
