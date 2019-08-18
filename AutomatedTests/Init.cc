#include "Test.h"

class Constructed
{
public:
    Constructed()
    {
        TestLog("constructor");
    }
    ~Constructed()
    {
        TestLog("destructor");
    }
};

Constructed thing;

int main()
{
    TestLog("main");
    return 0;
}
