extern int variable;
#include <SegLoad.h>
void Foo()
{
    variable *= 9;
}

void Bar()
{
    variable /= 9;
    variable *= 7;
}
