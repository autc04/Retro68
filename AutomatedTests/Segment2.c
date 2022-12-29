extern int variable;
#include <SegLoad.h>
void Foo(void)
{
    variable *= 9;
}

void Bar(void)
{
    variable /= 9;
    variable *= 7;
}
