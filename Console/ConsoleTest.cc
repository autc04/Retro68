#include "Console.h"
#include <string.h>

namespace Retro
{
	void InitConsole();
}

int main()
{
	Retro::InitConsole();
	const char *s = "Hello, world.\n";
	Retro::Console::currentInstance->write(s, strlen(s));
	Retro::Console::currentInstance->ReadLine();
	return 0;
}
