/*
     Copyright 2017 Wolfgang Thaller.

     This file is part of Retro68.

     Retro68 is free software: you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation, either version 3 of the License, or
     (at your option) any later version.

     Retro68 is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.

     You should have received a copy of the GNU General Public License
     along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "Elf2Mac.h"
#include "SegmentMap.h"

#include <gelf.h>

#include <err.h>

#include <string>
#include <vector>
#include <fstream>
#include <iostream>

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <boost/algorithm/string/predicate.hpp>

#include "Object.h"

using std::string;
using std::vector;
using std::ofstream;

string realLdPath;

void RealLD(vector<string> args)
{
    vector<const char*> argv;
    argv.push_back(realLdPath.c_str());
    for(string& s : args)
        argv.push_back(s.c_str());
    argv.push_back(NULL);

    pid_t pid = fork();
    if(pid < 0)
    {
        perror("unable to fork");
        exit(-1);
    }
    else if(pid == 0)
    {
        execvp(argv[0], const_cast<char* const *> (argv.data()));
        perror("exec failed");
        exit(-1);
    }
    else
    {
        int wstatus;
        int result = 0;
        do
        {
            result = waitpid(pid, &wstatus, 0);
        } while(result == -1 && errno == EINTR);
        if(!WIFEXITED(wstatus))
        {
            errx(EXIT_FAILURE, "ld process did not exit properly");
        }
        else
        {
            int exitcode = WEXITSTATUS(wstatus);
            if(exitcode)
                exit(exitcode);
        }
    }

}

int main(int argc, char *argv[])
{
    vector<string> args;
    std::copy(argv + 1, argv+argc, std::back_inserter(args));
    realLdPath = string(argv[0]) + ".real";

    if (char *path = getenv("RETRO68_REAL_LD"); path && path[0])
        realLdPath = path;

    string outputFile = "a.out";
    string entryPoint = "_start";
    bool elf2mac = false;
    bool flatoutput = false;
    bool segments = true;
    bool stripMacsbug = false;
    bool saveLdScript = false;

    SegmentMap segmentMap;

    vector<string> args2;
    for(auto p = args.begin(), e = args.end(); p != e; ++p)
    {
        if(*p == "--elf2mac-real-ld")
        {
            ++p;
            if(p == e)
                errx(EXIT_FAILURE, "--elf2mac-real-ld missing argument");
            realLdPath = *p;
        }
        else if(*p == "-o")
        {
            ++p;
            if(p == e)
                errx(EXIT_FAILURE, "-o missing argument");
            outputFile = *p;
        }
        else if(boost::algorithm::starts_with(*p, "-o"))
        {
            outputFile = (*p).substr(2);
        }
        else if(*p == "-elf2mac" || *p == "--elf2mac")
        {
            elf2mac = true;
        }
        else if(*p == "-e")
        {
            ++p;
            if(p == e)
                errx(EXIT_FAILURE, "-e missing argument");
            entryPoint = *p;
        }
        else if(boost::algorithm::starts_with(*p, "-e"))
        {
            entryPoint = (*p).substr(2);
        }
        else if(*p == "--mac-flat")
        {
            elf2mac = true;
            flatoutput = true;
            segments = false;
        }
        else if(*p == "--mac-single")
        {
            elf2mac = true;
            flatoutput = false;
            segments = false;
        }
        else if(*p == "--mac-segments")
        {
            elf2mac = true;
            if(flatoutput)
                errx(EXIT_FAILURE, "--mac-segments can't be used with --mac-flat");
            ++p;
            if(p == e)
                errx(EXIT_FAILURE, "--mac-segments missing argument");
            segmentMap = SegmentMap(*p);
        }
        else if(*p == "--mac-strip-macsbug")
        {
            stripMacsbug = true;
        }
        else if(*p == "--mac-keep-ldscript")
        {
            saveLdScript = true;
        }
        else
        {
            args2.push_back(*p);
        }
    }

    if(elf2mac)
    {
        char tmpfile[] = "/tmp/ldscriptXXXXXX";
        int fd = mkstemp(tmpfile);
        if(fd < 0)
            err(EXIT_FAILURE, "can't create temp file");

        {
            ofstream out(tmpfile);
            if(segments)
            {
                segmentMap.CreateLdScript(out, entryPoint, stripMacsbug);
            }
            else
            {
                CreateFlatLdScript(out, entryPoint, stripMacsbug);
            }
        }
 
        args2.push_back("--no-warn-rwx-segments");
        args2.push_back("-o");
        args2.push_back(outputFile + ".gdb");
        args2.push_back("-T");
        args2.push_back(tmpfile);
        RealLD(args2);
        if(saveLdScript)
            std::cerr << "Ld Script at: " << tmpfile << std::endl;
        else
            unlink(tmpfile);
        Object theObject(outputFile + ".gdb");
        if(flatoutput)
            theObject.FlatCode(outputFile);
        else if(segments)
            theObject.MultiSegmentApp(outputFile, segmentMap);
        else
            theObject.SingleSegmentApp(outputFile);
    }
    else
    {
        RealLD(args);
    }
    return 0;
}
