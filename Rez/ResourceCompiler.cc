#include "ResourceCompiler.h"
#include <iostream>

ResourceCompiler::ResourceCompiler()
{
}

void ResourceCompiler::write(int nBits, int value)
{
	std::cout << "[" << nBits << " bits] = " << std::hex << value << std::dec << std::endl;
}
