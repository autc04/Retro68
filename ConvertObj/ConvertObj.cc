#include <fstream>
#include <iostream>
#include <unordered_map>
#include <string>
#include "BinaryIO.h"
#include <stdint.h>
#include <vector>
#include <assert.h>
#include <ctype.h>
#include <sstream>

using std::string;
using std::vector;
using std::unordered_map;

enum RecordType {
	kPad = 0,
	kFirst = 1,
	kLast = 2,
	kDictionary = 4,
	kModule = 5,
	kEntryPoint = 6,
	kSize = 7,
	kContent = 8,
	kReference = 9,
	kComputedRef = 10
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
	assert(size == 2);
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

struct Module
{
	string name;
	string segment;
	vector<uint8_t> bytes;
	unordered_map<uint32_t, string> labels;
	unordered_map<uint32_t, Reloc> relocs;

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
	int offset = 0;

	out << "\t.section	.text." << encodeIdentifier(name) << ",\"ax\",@progbits\n";

	while(offset < bytes.size())
	{
		auto labelP = labels.find(offset);
		if(labelP != labels.end())
		{
			string label = encodeIdentifier(labelP->second);
			out << "\t.globl " << label << "\n";
			out << label << ":\n";

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
	out << "# ######\n\n";
}

int main(int argc, char* argv[])
{
	std::ifstream in(argv[1]);

	unordered_map<int,string>	stringDictionary;
	std::unique_ptr<Module> module;

	std::cout << "\t.text\n\t.align 2\n";

	for(bool endOfObject = false; !endOfObject;) {
		std::cerr << std::hex << in.tellg() << ": ";
		int recordType = byte(in);
		if(!in)
		{
			std::cerr << "Unexpected End of File\n";
			return 1;
		}

		std::cerr << "Record: " << recordType << std::endl;


		switch(recordType)
		{
			case kPad:
				std::cerr << "Pad\n";
				break;
			case kFirst:
				{
					int flags = byte(in);
					std::cerr << "First\n";
					std::cerr << "Version: " << word(in) << std::endl;
				}
				break;
			case kDictionary:
				{
					int flags = byte(in);
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
						std::cerr << s << std::endl;
						stringDictionary[stringId++] = s;
					}
				}
				break;
			case kModule:
				{
					int flags = byte(in);
					string name = stringDictionary[word(in)];
					string segment = stringDictionary[word(in)];
					std::cerr << "Module " << name << "(" << segment << "), flags = " << flags << "\n";

					if(module)
						module->write(std::cout);

					module.reset(new Module());
					module->name = name;
					module->labels[0] = name;
				}
				break;
			case kContent:
				{
					int flags = byte(in);
					int sz = word(in);
					int end = (int)(in.tellg()) - 4 + sz;
					long offset = longword(in);
					assert(module.get());
					if(module->bytes.size() < offset + sz)
						module->bytes.resize(offset + sz);
					in.read((char*) &module->bytes[offset], sz-8);
					//in.seekg(end);
					std::cerr << "Content\n";
				}
				break;
			case kSize:
				{
					int flags = byte(in);
					long size = longword(in);
					std::cerr << "Size\n";
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

					std::cerr << "Reference to " << name << " at\n";
					Reloc reloc;
					reloc.name1 = name;
					reloc.size = 2;

					assert(flags == 0x10);
					assert(module);

					while(in.tellg() < end)
					{
						int offset = word(in);
						std::cerr << "  " << offset << std::endl;
						module->relocs[offset] = reloc;
					}
				}
				break;
			case kEntryPoint:
				{
					int flags = byte(in);
					string name = stringDictionary[word(in)];
					long offset = longword(in);
					std::cerr << "EntryPoint " << name << " at offset " << offset << "\n";
					assert(module);
					module->labels[offset] = name;
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
					reloc.name1 = name1;
					reloc.name2 = name2;
					reloc.size = 2;

					assert(flags == 0x90);
					assert(module);

					std::cerr << "ComputedReference to " << name1 << " - " << name2 << " at\n";
					while(in.tellg() < end)
					{
						int offset = word(in);
						std::cerr << "  " << offset << std::endl;
						module->relocs[offset] = reloc;
					}
				}
				break;
			case kLast:
				byte(in);
				endOfObject = true;
				if(module)
					module->write(std::cout);
				break;
			default:
				std::cerr << "Unknown record at " << std::hex << in.tellg() << std::endl;
				return 1;
		}
	}

	return 0;
}
