#include "Console.h"
#include <string.h>

namespace Retro
{
	void InitConsole();
}

int main()
{
	Retro::InitConsole();
	std::string out = "Hello, world.\nEnter \"exit\" to quit.\n";
	Retro::Console::currentInstance->write(out.data(), out.size());
	
	std::string in;
	do
	{
		in = Retro::Console::currentInstance->ReadLine();
		out = "You Entered: " + in;
		Retro::Console::currentInstance->write(out.data(), out.size());
	} while(in != "exit\n");
	return 0;
}
