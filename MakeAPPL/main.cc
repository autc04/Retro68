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

std::string commandPath;

void wrapMacBinary(std::string macBinaryFile, std::string diskImagePath)
{
	int size = static_cast<int>(
			std::ifstream(macBinaryFile.c_str()).seekg(0,std::ios::end).tellg()
		);

	size += 20 * 1024;
	size += 800*1024 - size % (800*1024);

	std::ofstream(diskImagePath.c_str(), std::ios::binary | std::ios::trunc).seekp(size-1).put(0);
	
	std::system((commandPath + "hformat " + diskImagePath + " > /dev/null").c_str());
	std::system((commandPath + "hcopy -m " + macBinaryFile + " :").c_str());
}

class Resource
{
	std::string type;
	int id;
	std::string name;
	std::string data;
public:
	Resource(std::string type, int id, std::string data)
		: type(type), id(id), data(data) {}

	const std::string& getData() const { return data; }
	inline std::string getType() const { return type; }
	inline int getID() const { return id; }
};

class Fork
{
public:
	 virtual void writeFork(std::ostream& out) const { }
	 virtual ~Fork() {}
};

class Resources : public Fork
{
	std::vector<Resource> resources;
public:
	void writeFork(std::ostream& out) const;
	void addResource(Resource res) { resources.push_back(res); }
};

void byte(std::ostream& out, int byte)
{
	out.put((unsigned char)byte);
}
void word(std::ostream& out, int word)
{
	byte(out,(word >> 8) & 0xFF);
	byte(out,word & 0xFF);
}
void ostype(std::ostream& out, std::string type)
{
	assert(type.size() == 4);
	out << type;
}
void longword(std::ostream& out, int longword)
{
	byte(out,(longword >> 24) & 0xFF);
	byte(out,(longword >> 16) & 0xFF);
	byte(out,(longword >> 8) & 0xFF);
	byte(out,longword & 0xFF);
}


void Resources::writeFork(std::ostream& out) const
{
	std::streampos start = out.tellp();
	longword(out,0x100);
	longword(out,0);
	longword(out,0);
	longword(out,0);
	out.seekp(start + std::streampos(0x100));
	std::map< std::string, std::map<int, int> > resourceInfos;
	std::streampos datastart = out.tellp();
	for(std::vector<Resource>::const_iterator p = resources.begin(); p != resources.end(); ++p)
	{
		const std::string& data = p->getData();
		resourceInfos[ p->getType() ][ p->getID() ] = out.tellp() - datastart;
		longword(out, data.size());
		out << data;
	}
	std::streampos dataend = out.tellp();
//   while(out.tellp() % 0x100)
//      out.put(0);
	std::streampos resmap = out.tellp();
	out.seekp(16+4+2+2, std::ios::cur);
	word(out,16+4+2+2+2+2); // offset to resource type list
	std::streampos resnameOffset = out.tellp();
	word(out,0);
	std::streampos typelist = out.tellp();
	word(out,resourceInfos.size() - 1);
	for(std::map< std::string, std::map<int, int> >::iterator p = resourceInfos.begin();
			p != resourceInfos.end(); ++p)
	{
		if(p->second.size())
		{
			ostype(out,p->first);
			word(out,p->second.size()-1);
			word(out,0); // replaced later
		}
	}
	int typeIndex = 0;
	for(std::map< std::string, std::map<int, int> >::iterator p = resourceInfos.begin();
			p != resourceInfos.end(); ++p)
	{
		if(p->second.size())
		{
			std::streampos pos = out.tellp();
			out.seekp((int)typelist + 2 + 8 * typeIndex + 6);
			word(out, pos - typelist);
			out.seekp(pos);
			typeIndex++;

			for(std::map<int,int>::iterator q = p->second.begin(); q != p->second.end(); ++q)
			{
				word(out,q->first);
				word(out,-1);
				longword(out,q->second);
				longword(out,0);
			}
		}
	}
	std::streampos resnames = out.tellp();
	out.seekp(resnameOffset);
	word(out, resnames - resmap);
	out.seekp(resnames);
	std::streampos end = out.tellp();
	out.seekp(start + std::streampos(4));
	longword(out, resmap - start);
	longword(out, dataend - start - std::streampos(0x100));
	longword(out, end - resmap);
	out.seekp(end);
}

// CRC 16 table lookup array
static unsigned short CRC16Table[256] =
	{0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,
	0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
	0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,
	0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
	0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,
	0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
	0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,
	0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
	0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,
	0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
	0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,
	0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
	0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,
	0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
	0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,
	0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
	0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,
	0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
	0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,
	0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
	0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,
	0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
	0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,
	0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
	0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,
	0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
	0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,
	0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
	0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,
	0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
	0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,
	0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0};

// CalculateCRC 
static unsigned short CalculateCRC(unsigned short CRC, const char* dataBlock, int dataSize)
{       
	while (dataSize)
	{
		CRC = (CRC << 8) ^ CRC16Table[((*dataBlock) ^ (CRC >> 8)) & 0x00FF];
		dataBlock++;
		dataSize--;
	}

	return CRC;
}


void writeMacBinary(std::ostream& out, std::string filename, 
						  std::string type, std::string creator,
						  const Fork& rsrc, const Fork& data)
{
	out.seekp(128);
	data.writeFork(out);
	std::streampos dataend = out.tellp();
	std::streampos rsrcstart = ((int)dataend + 0x7F) & ~0x7F;
	rsrc.writeFork(out);
	
	std::streampos rsrcend = out.tellp();
	while((int)out.tellp() % 128)
		byte(out,0);
	
	std::ostringstream header;
	byte(header, 0);
	byte(header, filename.size());
	header << filename;
	while((int)header.tellp() < 65)
		byte(header,0);
	ostype(header, type);
	ostype(header, creator);
	byte(header, 0); // flags
	byte(header, 0);
	word(header, 0);  // position.v
	word(header, 0); // position.h
	word(header, 0); // folder id
	byte(header, 0); // protected flag
	byte(header, 0);
	longword(header, ((int)dataend - 128));
	longword(header, (int) (rsrcend - rsrcstart));
	longword(header, 0); // creation date
	longword(header, 0); // modification date
	while((int)header.tellp() < 124)
		byte(header,0);

	out.seekp(0);
	std::string headerData = header.str();
//   out.write(&headerData[0], headerData.size());
	out << headerData;
	word(out, CalculateCRC(0, &headerData[0], headerData.size()));
	word(out, 0);
	//longword(out,0);
	out.seekp(0, std::ios::end);
}

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

	std::string curRType = "CODE";
	bool breakOnEntry = false;
	
	unsigned short sizeFlags = 0x80; // 32-bit clean
	unsigned long minimumSize = 384 * 1024;
	unsigned long preferredSize = 384 * 1024;

	if(char *lastSlash = std::strrchr(argv[0], '/'))
	{
		commandPath = std::string(argv[0], lastSlash + 1);
	}

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
		else if(arg == "-c")
		{
			assert(i < argc);
			std::string fn = argv[i++];
			std::string flt = readfile(fn);

			rsrc.addResource(Resource("CODE", 0,
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
		 
			if(code1.str().size() + 64*1024 > minimumSize)
				minimumSize = code1.str().size() + 64*1024;
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
	
	{
		std::ofstream out(binFileName.c_str());
		
		writeMacBinary(out, outFileName, "APPL", "????",
					   rsrc, Fork());
	}
	wrapMacBinary(binFileName, dskFileName);
	return 0; 
}
