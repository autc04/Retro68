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
#include <boost/regex.hpp>

using namespace std::placeholders;

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
			std::cerr << "Temp file: " << tempFileName << std::endl;
		}
	}
	
	{
		std::ifstream in(inputFileName);
		std::ofstream out(tempFileName);
		
		std::string wordS = "[0-9a-f][0-9a-f][0-9a-f][0-9a-f]";
		boost::regex jsr("\tjsr __magic_inline_(" + wordS + "(_" + wordS + ")*)");
		boost::regex word(wordS);
		//boost::regex size("\t\\.size\t([a-zA-Z0-9_]+), \\.-([a-zA-Z0-9_]+)");
		boost::regex globl("\t\\.globl\t([a-zA-Z0-9_]+)");
		boost::regex rts("\trts");
		
		std::string function_name = "__unknown";
		while(in)
		{
			std::string line;
			std::getline(in, line);
			if(!in)
				break;
			
			boost::smatch match;
			if(boost::regex_match(line, match, jsr))
			{
				const boost::sregex_token_iterator end;
				for (boost::sregex_token_iterator p(line.cbegin(), line.cend(), word);
					p != end;
					++p)
				{
					out << "\tdc.w 0x" << *p << std::endl;
				}
			}
			/*else if(boost::regex_match(line, match, size) && match[1] == match[2])
			{
				out << "\tdc.b 0x8e\n";
				out << "\t.string \"" << match[1] << "\"\n";
				out << "\t.align 2\n";
				out << line << std::endl;
			}*/
			else if(boost::regex_match(line, match, globl))
			{
				out << line << std::endl;
				function_name = match[1];
			}
			/*else if(boost::regex_match(line, rts))
			{
				out << line << std::endl;
				out << "\tdc.b 0x8e\n";
				out << "\t.string \"" << function_name << "\"\n";
				out << "\tdc.b 0x00\n";
				out << "\tdc.b 0x00\n";				
				out << "\t.align 2\n";
			}*/
			else
				out << line << std::endl;
		}
	}
	
	close(fd);
	
	std::transform(argv2.begin(), argv2.end(), std::back_inserter(argv3), std::bind(&std::string::c_str, _1));
	argv3.push_back(NULL);
	
	execvp(argv3[0], const_cast<char*const*>( argv3.data() ));
	perror("execvp");
	
	return 1;
}
