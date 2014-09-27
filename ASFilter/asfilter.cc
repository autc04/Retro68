/*
    Copyright 2012 Wolfgang Thaller.

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

#include <iostream>
#include <unistd.h>
#include <algorithm>
#include <vector>
#include <string>
#include <functional>
#include <errno.h>
#include <fstream>
#include <sys/types.h>
#include <sys/wait.h>

using namespace std::placeholders;

#ifdef USE_BOOST_REGEX
#include <boost/regex.hpp>
namespace rx = boost;
#else
#include <regex>
namespace rx = std;
#endif

int main(int argc, char *argv[])
{
	std::vector<std::string> argv2;
	std::vector<const char*> argv3;
	
	std::copy(argv, argv+argc, std::back_inserter(argv2));
	argv2[0] += ".real";
	
	std::string inputFileName;
	std::string tempFileName;
	
	char tempFileTemplate[] = "/tmp/filteredXXXXXX.s";
	int fd = mkstemps(tempFileTemplate, 2);
	tempFileName = tempFileTemplate;
	
	for(auto& p : argv2)
	{
		if(p.substr(p.length()-2) == ".s")
		{
			inputFileName = p;
			p = tempFileName;
			//std::cerr << "Temp file: " << tempFileName << std::endl;
		}
	}
	
	{
		std::ifstream in(inputFileName);
		std::ofstream out(tempFileName);
		
		rx::regex rts("\trts");
		rx::regex instruction("\t[a-z]+.*");
		rx::regex macsbug("# macsbug symbol");
		rx::regex rtd("\trtd #([0-9]+)");

		bool hadRts = false;
		bool macsbugSymbol = false, macsbugSymbol1;
		while(in)
		{
			std::string line;
			std::getline(in, line);
			if(!in)
				break;
			
			macsbugSymbol1 = false;

			rx::smatch match;
			// ******* 1. rtd hack
			// 
			// GCC currently generates rtd instructions when returning
			// from pascal functions. This instruction is not supported on the original 68000,
			// so let's replace it.
			// This should really be done by GCC itself.

			if(rx::regex_match(line, match, rtd))
			{
				out << "\tmove.l (%a7)+, %a0\n";
				out << "\tlea " + match[1].str() + "(%a7), %a7\n";
				out << "\tjmp (%a0)\n";
				hadRts = true;
			}

			// ******* 2. strip unneeded extra rts from "# macsbug symbol" paragraphs
			//
			// GCC is patched to add something like this to the end of every function:
			// # macsbug symbol
			//     rts
			//     .byte 132
			//     .ascii	"main"
			//     .align 2,0
			//     .short 0
			//     .size	main, .-main
			//
			// The rts is usually redundant as most functions already end in RTS.
			// The following removes the RTS if there has already been an RTS immediately before.
			else if(rx::regex_match(line, macsbug))
			{
				out << line << std::endl;
				macsbugSymbol1 = true;
			}
			else if(rx::regex_match(line, rts))
			{
				if(!macsbugSymbol || !hadRts)
					out << line << std::endl;
				hadRts = true;
			}
			else if(rx::regex_match(line, instruction))
			{
				hadRts = false;
				out << line << std::endl;
			}

			// Pass through everything else.
			else
				out << line << std::endl;

			macsbugSymbol = macsbugSymbol1;
		}
	}
	
	close(fd);
	
	std::transform(argv2.begin(), argv2.end(), std::back_inserter(argv3), 
		[](const std::string& str) { return str.c_str(); });

	argv3.push_back(NULL);
	
	pid_t pid = fork();
	if(pid > 0)
	{
		waitpid(pid, NULL, 0);
		unlink(tempFileName.c_str());
		return 0;
	}
	else if(pid == 0)
	{
		execvp(argv3[0], const_cast<char*const*>( argv3.data() ));
		perror("execvp");
	}
	else
		perror("fork");
	return 1;
}
