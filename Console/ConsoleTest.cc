#include "retro/Console.h"
#include <string.h>

namespace retro
{
    void InitConsole();
}

int main()
{
    retro::InitConsole();
    std::string out = "Hello, \033[1mexternal world of \033[0m\033[3mtrue beauty and \033[4mgreatness\033[0m.\nEnter \"exit\" to quit.\n";
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
