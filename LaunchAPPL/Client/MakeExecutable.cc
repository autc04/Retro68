#include <string>
#include <iostream>
#include <fstream>
#include <boost/filesystem.hpp>
#include <stdlib.h>

#include "ResourceFile.h"

using std::string;
namespace fs = boost::filesystem;

void MakeExecutable(string fn)
{
    ResourceFile rsrcFile;
    if(!rsrcFile.read(fn))
    {
        std::cerr << "Cannot read application file: " << fn << std::endl;
        exit(1);
    }
    if(!rsrcFile.hasPlainDataFork())
    {
        std::cerr << "--make-executable can not be used with this data format.\n";
        exit(1);
    }

    string headerString = "#!" RETRO68_PREFIX "/bin/LaunchAPPL\n";

    bool hadShebang = false;
    if(rsrcFile.data.size())
    {
        if(headerString.substr(2) == "#!")
        {
            string::size_type eol = headerString.find('\n');
            if(eol != string::npos && eol >= 13 && eol < 4096)
            {
                if(headerString.substr(eol-11,11) == "/LaunchAPPL")
                    hadShebang = true;
            }
        }

        if(!hadShebang)
        {
            std::cerr << "Unfortunately, the application already has a data fork.\n";
            std::cerr << "LaunchAPPL --make-executable does not currently work for PowerPC apps.\n";
            // TODO: if it's a PEF container, move it back a little and update cfrg
            exit(1);
        }
    }

    std::fstream(fn, std::ios::in | std::ios::out | std::ios::binary) << headerString;

    fs::permissions(fs::path(fn), fs::owner_exe | fs::group_exe | fs::others_exe | fs::add_perms);
}
