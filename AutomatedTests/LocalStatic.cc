#include "Test.h"

/*
 
This test case is intended to check for one particular binutils/xcoff problem:

Without a patch, GNU ld fails to allocate space for weak uninitialized csects [BS],
and therefore puts both at the same address.

Minimal example:

	.weak	_one[BS]
	.csect _one[BS]
_one:
	.space 4
	.weak	_two[BS]
	.csect _two[BS]
_two:
	.space 4

 
powerpc-apple-macos-as test.s > test.o
powerpc-apple-macos-ld -r test.o -o linked.o
powerpc-apple-macos-objdump -t -h linked.o

Observe the size of the .bss section and the addresses of symbols _one and _two.

This test case tests for it using a thread-safe local static variable in an inline
function, which boils down to a pair of weakly-linked uninitialized csects as above.

 */


// noinline so that it doesn't get optimized away
__attribute__((noinline)) int foo()
{
    return 42;
}

// the `inline` triggers a problem.
// the static var and its guard variable are marked `.weak`,
// and the XCOFF linker puts them at the same address.
inline int bar()
{
    static int cachedFoo = foo();
    return cachedFoo;
}

// wrap it in a noinline function to make reading the assembly easier.
 __attribute__((noinline)) int baz()
{
    return bar();
}

int main()
{
    if (baz() != 42)
        TestLog("NO");
    else
        TestLog("OK");
}
