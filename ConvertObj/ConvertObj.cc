#include <fstream>
#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <string>
#include "BinaryIO.h"
#include <stdint.h>
#include <vector>
#include <assert.h>
#include <ctype.h>
#include <sstream>
#include <memory>

using std::string;
using std::vector;
using std::unordered_map;

unordered_map<string,string>	sectionMap;
bool verbose = false;

enum RecordType {
	kPad = 0,
	kFirst = 1,
	kLast = 2,
    kComment = 3,
	kDictionary = 4,
	kModule = 5,
	kEntryPoint = 6,
	kSize = 7,
	kContent = 8,
	kReference = 9,
	kComputedRef = 10,
    kFilename = 11
};

enum ReferenceFlags {	// flags field of kReference
	k16BitPatch = 0x10,	// default 32Bit
	kFromData = 0x01,	// default fromCode
	kA5Relative = 0x80,	// default absolute

	kUnknownReferenceFlags = 0x6E	// rather a lot, isn't it?
	    // The following flags are known to exist from DumpOBJ,
	    // but their value is unkown as I haven't actually seen them yet:
	    // k32BitOffsets (default k16BitOffsets)
};

enum ComputedReferenceFlags {
	kDifference = 0x80
};

struct Reloc
{
	int size;
	string name1;
	string name2;

	int write(std::ostream& out, uint8_t *p);
};

int Reloc::write(std::ostream& out, uint8_t *p)
{
	if(size == 2)
	{
		out << "\t.short ";
		int val = (int)p[0] * 256 + p[1];

		out << name1;
		if(name2.size())
			out << " - " << name2;
		if(val > 0)
			out << " + " << val;
		else if(val < 0)
			out << " - " << -val;
		if(name2.size() == 0)
			out << "-.";
		out << std::endl;
		return 2;
	}
	else if(size == 4)
	{
		out << "\t.long ";
		int val = ((int)p[0] << 24) | ((int)p[1] << 16) | ((int)p[2] << 8) | p[3];

		out << name1;
		if(name2.size())
			out << " - " << name2;
		if(val > 0)
			out << " + " << val;
		else if(val < 0)
			out << " - " << -val;
		out << std::endl;
		return 4;
	}
	else
	{
		assert(false);
		return 1;
	}
}

struct Module
{
	string name;
	string segment;
	vector<uint8_t> bytes;
	unordered_map<uint32_t, vector<string>> labels;
	unordered_map<uint32_t, Reloc> relocs;

	std::vector<std::weak_ptr<Module>> nearrefs;

	void write(std::ostream& out);
};

bool isValidIdentifier(const string& s)
{
	if(s.empty())
		return false;
	if(s[0] != '_' && !isalpha(s[0]))
		return false;
	for(char c : s)
		if(c != '_' && !isalnum(c))
			return false;
	return true;
}

string encodeIdentifier(const string& s)
{
	if(isValidIdentifier(s))
		return s;

    if(s.empty())
        return "__z";

	std::ostringstream ss;

	if(isdigit(s[0]))
		ss << "__z";

	for(char c : s)
	{
		if(c == '_' || isalnum(c))
			ss << c;
		else
		{
			ss << "__z" << (int) c << "_";
		}
	}

	return ss.str();
}

void Module::write(std::ostream& out)
{
	uint32_t offset = 0;
	string encodedName = encodeIdentifier(sectionMap[name]);

	out << "\t.section	.text." << encodedName << ",\"ax\",@progbits\n";

	while(offset < bytes.size())
	{
		auto labelP = labels.find(offset);
		if(labelP != labels.end())
		{
			for(string rawLabel : labelP->second)
			{
				string label = encodeIdentifier(rawLabel);
				out << "\t.globl " << label << "\n";
				out << label << ":\n";
			}
		}

		auto relocP = relocs.find(offset);
		if(relocP != relocs.end())
		{
			offset += relocP->second.write(out, &bytes[offset]);
		}
		else
		{
			out << "\t.byte " << (int)bytes[offset] << "\n";
			offset++;
		}
	}
	out << "\t.section	.text." << encodedName << ".macsbug,\"ax\",@progbits\n";
	if(encodedName.size() < 32)
		out << "\t.byte " << (encodedName.size() | 0x80) << "\n";
	else
		out << "\t.byte 0x80\n"
			<< "\t.byte " << encodedName.size() << "\n";
	out << "\t.ascii \"" << encodedName << "\"\n";
	out << "\t.align 2,0\n\t.short 0\n";

	out << "# ######\n\n";
}

void sortModules(std::vector<std::shared_ptr<Module>>& modules)
{
	std::set<std::string> unemitted;
	for(auto& m : modules)
		unemitted.insert(m->name);
	
	std::unordered_map<std::string, std::shared_ptr<Module>> nameMap;
	for(auto& m : modules)
		for(auto& l : m->labels)
			for(auto& str : l.second)
				nameMap[str] = m;
	
	
	for(auto& m : modules)
		for(auto& r : m->relocs)
		{
			if(r.second.size != 2)
				continue;
			if(r.second.name2.empty())
			{
				std::shared_ptr<Module> m1;
				m1 = nameMap.find(r.second.name1)->second;
				m1->nearrefs.push_back(m);
				m->nearrefs.push_back(m1);
			}
			else
			{
				std::shared_ptr<Module> m1;
				m1 = nameMap.find(r.second.name1)->second;
				std::shared_ptr<Module> m2;
				m2 = nameMap.find(r.second.name2)->second;
				m1->nearrefs.push_back(m2);
				m2->nearrefs.push_back(m1);
			}
		}
	

	std::vector<std::shared_ptr<Module>> sorted;
	sorted.reserve(modules.size());
	
	auto p = sorted.begin();
	
	while(!unemitted.empty())
	{
		while(p != sorted.end())
		{
			for(auto& m2weak : (*p)->nearrefs)
			{
				if(std::shared_ptr<Module> m2 = m2weak.lock())
				{
					auto unemittedP = unemitted.find(m2->name);
					if(unemittedP != unemitted.end())
					{
						sorted.push_back(m2);
						unemitted.erase(unemittedP);
					}
				}
			}
			++p;
		}
        sorted.push_back(nameMap[*unemitted.begin()]);
		unemitted.erase(unemitted.begin());
	}
	
	sorted.swap(modules);
}

int main(int argc, char* argv[])
{
	if(argc != 2)
	{
		std::cerr << "Usage: ConvertOBJ mpw.o > retro68.s\n";
		return 1;
	}
	std::ifstream in(argv[1]);
	if(!in)
	{
		std::cerr << "Could not read imput file \"" << argv[1] << "\"\n";
		std::cerr << "Usage: ConvertOBJ mpw.o > retro68.s\n";
		return 1;
	}

	unordered_map<int,string>	stringDictionary;
	
	bool shouldSortModules = true;
	
	std::shared_ptr<Module> module;
	std::vector<std::shared_ptr<Module>> modules;

	std::cout << "\t.text\n\t.align 2\n";

	for(bool endOfObject = false; !endOfObject;) {
		if(verbose)
			std::cerr << std::hex << in.tellg() << ": ";
		int recordType = byte(in);
		if(!in)
		{
			std::cerr << "Unexpected End of File\n";
			return 1;
		}

		if(verbose)
			std::cerr << "Record: " << recordType << std::endl;


		switch(recordType)
		{
			case kPad:
				if(verbose)
					std::cerr << "Pad\n";
				break;
			case kFirst:
				{
					/*int flags =*/ byte(in);
					int version = word(in);
					if(verbose)
					{
						std::cerr << "First\n";
						std::cerr << "Version: " << version << std::endl;
					}
				}
				break;
            case kComment:
                {
					/*int flags =*/ byte(in);
					int size = word(in);
                    size -= 4;
                    if(verbose)
                        std::cerr << "Comment: ";
                    while(size-- > 0)
                    {
                        char c = byte(in);
                        if(verbose)
                            std::cerr << c;
                    }
                    if(verbose)
                        std::cerr << std::endl;
                }
                break;
			case kDictionary:
				{
					/*int flags =*/ byte(in);
					if(verbose)
						std::cerr << "Dictionary\n";
					int sz = word(in);
					int stringId = word(in);
					int end = (int)(in.tellg()) - 6 + sz;
					while(in.tellg() < end)
					{
						int n = byte(in);
						string s;
						for(int i = 0; i < n; i++)
							s += (char) byte(in);
						if(verbose)
							std::cerr << s << std::endl;
						stringDictionary[stringId++] = s;
					}
				}
				break;
			case kModule:
				{
					int flags = byte(in);
					string name = stringDictionary[word(in)];
					sectionMap[name] = name;
					string segment = stringDictionary[word(in)];
					if(verbose)
						std::cerr << "Module " << name << "(" << segment << "), flags = " << flags << "\n";

					module.reset(new Module());
					module->name = name;
					module->labels[0].push_back(name);
					modules.push_back(module);
				}
				break;
			case kContent:
				{
					int flags = byte(in);
					int sz = word(in) - 4;
					uint32_t offset = 0;
					if(flags & 0x08)
					{
					 	offset = longword(in);
						sz -= 4;
					}
					assert(module.get());
					if(module->bytes.size() < offset + sz)
						module->bytes.resize(offset + sz);
					in.read((char*) &module->bytes[offset], sz);
					if(verbose)
						std::cerr << "Content (offset = " << offset << ", size = " << sz << ")\n";
				}
				break;
			case kSize:
				{
					/*int flags =*/ byte(in);
					long size = longword(in);
					if(verbose)
						std::cerr << "Size " << size << "\n";
					assert(module.get());
					module->bytes.resize(size);
				}
				break;
			case kReference:
				{
					int flags = byte(in);
					int sz = word(in);
					int end = (int)(in.tellg()) - 4 + sz;
					string name = stringDictionary[word(in)];

					if(verbose)
						std::cerr << "Reference to " << name << " at\n";
					Reloc reloc;
					reloc.name1 = encodeIdentifier(name);

					if(flags & kUnknownReferenceFlags)
					{
						std::cerr << "Unknown relocation flags: 0x" << std::hex << flags << std::endl;
						std::cerr << "Cannot convert this file.\n";
						std::exit(1);
					}
					if(flags & kA5Relative)
					{
						std::cerr << "Unsupported relocation flags: 0x" << std::hex << flags << std::endl;
						std::cerr << "MPW .o files with near-model global variables or calls to imported functions will not work.\n";
						std::cerr << "Cannot convert this file.\n";
						std::exit(1);
					}
					flags &= ~kFromData;	// FIXME: sticking data bits in the text section, not nice, but might sometimes work

					reloc.size = (flags & k16BitPatch ? 2 : 4);

					assert(module);

					while(in.tellg() < end)
					{
						int offset = word(in);
						if(verbose)
							std::cerr << "  " << offset << std::endl;
						module->relocs[offset] = reloc;
					}
				}
				break;
			case kEntryPoint:
				{
					/*int flags =*/ byte(in);
					string name = stringDictionary[word(in)];
					long offset = longword(in);
					if(verbose)
						std::cerr << "EntryPoint " << name << " at offset " << offset << "\n";
					assert(module);
					module->labels[offset].push_back(name);
				}
				break;
			case kComputedRef:
				{
					int flags = byte(in);
					int sz = word(in);
					int end = (int)(in.tellg()) - 4 + sz;
					string name1 = stringDictionary[word(in)];
					string name2 = stringDictionary[word(in)];

					Reloc reloc;
					reloc.name1 = encodeIdentifier(name1);
					reloc.name2 = encodeIdentifier(name2);
					reloc.size = 2;

					assert(flags == 0x90);
					assert(module);

					string secName = sectionMap[name1];
					if(secName != "")
						sectionMap[module->name] = secName;
					if(verbose)
						std::cerr << "ComputedReference to " << name1 << " - " << name2 << " at\n";
					while(in.tellg() < end)
					{
						int offset = word(in);
						if(verbose)
							std::cerr << "  " << offset << std::endl;
						module->relocs[offset] = reloc;
					}
				}
				break;
            case kFilename:
                /* int flags = */ byte(in);
                /* short nameref = */ word(in);
                /* long date = */ longword(in);
                break;
			case kLast:
				byte(in);
				endOfObject = true;
				break;
			default:
				std::cerr << "Unknown record (type " << recordType << ") at " << std::hex << in.tellg() << std::endl;
				return 1;
		}
	}
	if(shouldSortModules)
		sortModules(modules);
	for(auto& m : modules)
		m->write(std::cout);
	return 0;
}
