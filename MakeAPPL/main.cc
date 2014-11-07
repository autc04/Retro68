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

#include <fstream>
#include <iostream>
#include <sstream>
#include <cstdlib>
#include <string>
#include <cassert>
#include <vector>
#include <map>
#include <functional>
#include <cstring>

#include "ResourceFork.h"
#include "BinaryIO.h"
#include "ResourceFile.h"

std::string fromhex(std::string hex)
{
	std::string bin;
	int nibble;
	bool haveNibble = false;
	for(std::string::iterator p = hex.begin(); p != hex.end(); ++p)
	{
		if(std::isspace(*p))
			continue;
		assert(isdigit(*p) || (tolower(*p) >= 'a' && tolower(*p) <= 'f'));
		int digit;
		if(isdigit(*p))
			digit = *p - '0';
		else
			digit = tolower(*p) - 'a' + 0xA;
		
		if(haveNibble)
		{
			bin += (char) ((nibble << 4) | digit);
			haveNibble = false;
		}
		else
		{
			nibble = digit;
			haveNibble = true;
		}
	}
	return bin;
}

std::string readfile(std::string fn)
{
	std::ifstream in(fn.c_str(), std::ios::in|std::ios::binary);
	return std::string(std::istreambuf_iterator<char>(in),
					   std::istreambuf_iterator<char>());
}

int main(int argc, char *argv[])
{
	Resources rsrc;
	//Resource res("TEXT", 128, "Hello, world.");
	//rsrc.addResource(res);

	std::string outFileName = "Test";
	std::string binFileName = "Test.bin";
	std::string dskFileName = "Test.dsk";
	std::string creatorCode = "????";

	std::string curRType = "CODE";
	bool breakOnEntry = false;
	
	unsigned short sizeFlags = 0x80; // 32-bit clean
	unsigned long minimumSize = 384 * 1024;
	unsigned long preferredSize = 384 * 1024;

	for(int i = 1; i < argc;)
	{
		std::string arg(argv[i++]);
		if(arg == "-o")
		{
			assert(i < argc);
			outFileName = argv[i++];
			binFileName = outFileName + ".bin";
			dskFileName = outFileName + ".dsk";
		}
		else if(arg == "-t")
		{
			assert(i < argc);
			curRType = argv[i++];
		}
		else if(arg == "-r")
		{
			assert(i < argc);
			int id = atoi(argv[i++]);
			assert(i < argc);
			std::string fn = argv[i++];
			
			rsrc.addResource(Resource(curRType, id, readfile(fn)));
		}
		else if(arg == "-C")
		{
			assert(i < argc);
			creatorCode = argv[i++];
		}
		else if(arg == "-c")
		{
			assert(i < argc);
			std::string fn = argv[i++];
			std::string flt = readfile(fn);

			rsrc.addResource(Resource(ResType("CODE"), 0,
				fromhex(
					"00000028 00000000 00000008 00000020"
					"0000 3F3C 0001 A9F0"
				)
			));


			long entrypoint = (static_cast<unsigned char>(flt[ 8]) << 24)
							| (static_cast<unsigned char>(flt[ 9]) << 16) 
							| (static_cast<unsigned char>(flt[10]) <<  8) 
							| (static_cast<unsigned char>(flt[11]))
							;

			std::ostringstream code1;
	

			word(code1, 0);
			word(code1, 1);

			if(breakOnEntry)
				word(code1, 0xa9ff);
			longword(code1, 0x61000002);  // bsr *+2

			word(code1, 0x0697); // addi.l #_, (a7) 
			longword(code1, entrypoint + 8);
			word(code1, 0x4e75); // rts

			code1 << flt;

			rsrc.addResource(Resource("CODE", 1, code1.str()));
		 
			if(code1.str().size() + 128*1024 > minimumSize)
				minimumSize = code1.str().size() + 128*1024;
			if(minimumSize > preferredSize)
				preferredSize = minimumSize;
		}
		else if(arg == "-b")
			breakOnEntry = true;
		else if(arg == "--minimum")
		{
			assert(i < argc);
			int k = atoi(argv[i++]);
			minimumSize = k*1024;
			if(preferredSize < minimumSize)
				preferredSize = minimumSize;
		}
		else if(arg == "--preferred")
		{
			assert(i < argc);
			int k = atoi(argv[i++]);
			preferredSize = k*1024;
		}
		else if(arg == "--flags")
			{
			assert(i < argc);
			std::istringstream in(argv[i++]);
			in >> std::hex >> sizeFlags;
		}
		else if(arg == "--copy")
		{
			assert(i < argc);
			std::string fn = argv[i++];
			ResourceFile copyRsrc(fn);
			copyRsrc.read();
			rsrc.addResources(copyRsrc.resources);
		}
		else
		{
			std::cout << "unrecognized flag\n";
			return 1;
		}
	}

	{
		std::ostringstream size_1;
		word(size_1, sizeFlags);
		longword(size_1, minimumSize);
		longword(size_1, preferredSize);
		rsrc.addResource(Resource("SIZE", -1, size_1.str()));
	}
	
	ResourceFile file(binFileName, ResourceFile::Format::macbin);
	file.resources = rsrc;
	file.creator = creatorCode;
	file.type = "APPL";

	file.write();

	file.assign(dskFileName, ResourceFile::Format::diskimage);
	file.write();

#ifdef __APPLE__
	file.assign(outFileName + ".APPL", ResourceFile::Format::real);
	file.write();
#else
	file.assign(outFileName + ".APPL", ResourceFile::Format::basilisk);
	file.write();
#endif
	return 0;
}
