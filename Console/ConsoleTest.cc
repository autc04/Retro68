#include "retro/Console.h"
#include <string.h>

namespace retro
{
    void InitConsole();
}

int main()
{
    retro::InitConsole();
    std::string out = "Hello, world.\nEnter \"exit\" to quit.\n";
    retro::Console::currentInstance->write(out.data(), out.size());
    
    std::string in;
    do
    {
        in = retro::Console::currentInstance->ReadLine();
        out = "You Entered: " + in;
        retro::Console::currentInstance->write(out.data(), out.size());
    } while(in != "exit\n");
    return 0;
}
