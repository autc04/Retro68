#include "ResourceFiles.h"
#include "BinaryIO.h"

#include <iostream>
#include <map>
#include <vector>

void Resources::addResources(const Resources& res)
{
	for(auto& rr : res.resources)
		resources.insert(rr);
//	resources.insert(resources.end(),res.resources.begin(), res.resources.end());
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
	for(auto& rr : resources)
	{
		const Resource& r = rr.second;
		const std::string& data = r.getData();
		resourceInfos[ r.getType() ][ r.getID() ] = out.tellp() - datastart;
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

Resources::Resources(std::istream &in)
{
	std::streampos start = in.tellg();
	int resdataOffset = longword(in);
	int resmapOffset = longword(in);

	in.seekg(start + std::streampos(resmapOffset + 16 + 4 + 2 + 2));
	int typeListOffset = word(in);
	int nameListOffset = word(in);
	int nTypes = (word(in) + 1) & 0xFFFF;

	for(int i = 0; i < nTypes; i++)
	{
		in.seekg(start + std::streampos(resmapOffset + typeListOffset + 2 + i * 8));
		std::string type = ostype(in);
		int nRes = (word(in) + 1) & 0xFFFF;
		int refListOffset = word(in);

		for(int j = 0; j < nRes; j++)
		{
			in.seekg(start + std::streampos(resmapOffset + typeListOffset + refListOffset + j * 12));
			int id = word(in);
			int nameOffset = word(in);
			int attr = byte(in);
			int off1 = byte(in);
			int off2 = byte(in);
			int off3 = byte(in);
			int offset = (off1 << 16) | (off2 << 8) | off3;
			std::string name;
			if(nameOffset != 0xFFFF)
			{
				in.seekg(start + std::streampos(resmapOffset + nameListOffset + nameOffset));
				int nameLen = byte(in);
				char buf[256];
				in.read(buf, nameLen);
				name = std::string(buf, nameLen);
			}

			in.seekg(start + std::streampos(resdataOffset + offset));
			int size = longword(in);
			std::vector<char> tmp(size);
			in.read(tmp.data(), size);
			std::string data(tmp.data(), size);

			addResource(Resource(type, id, data, name, attr));
		}
	}
}
