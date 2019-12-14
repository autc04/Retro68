#include "retro/IConsole.h"
#include <string.h>

namespace retro
{
    void InitIConsole();
}

int main()
{
    retro::InitIConsole();
    std::string out = "Hello, \033[1mexternal world of true beauty and \033[4mgreatness\033[0m.\nEnter \"exit\" to quit.\n";
    retro::IConsole::currentInstance->write(out.data(), out.size());
    
    std::string in;
    do
    {
        in = retro::IConsole::currentInstance->ReadLine();
        out = "You Entered: " + in;
        retro::IConsole::currentInstance->write(out.data(), out.size());
    } while(in != "exit\n");
    return 0;
}
