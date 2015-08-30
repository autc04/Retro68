#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <set>
#include <string.h>
#include <alloca.h>

#include <assert.h>
#include <stdint.h>

#include "powerpc.h"

#include "PEF.h"

typedef unsigned bfd_size_type;
typedef unsigned bfd_vma;
#define SYMNMLEN 8
#define PARAMS(x) x
struct bfd_link_hash_entry {};
struct bfd_link_hash_table {};
typedef int bfd;
typedef int asection;
typedef int bfd_boolean;
typedef char bfd_byte;

#include "xcoff.h"

																					/* n_sclass storage classes:									*/
#define C_EFCN			0xFFU									/* 		physical end of function 		 <obsolete> */
#define C_NULL			0U										/*    														 						*/
#define C_AUTO			1U										/* 		automatic variable					 <obsolete> */
#define C_EXT				2U										/* 		external symbol													*/
#define C_STAT			3U										/* 		static symbol														*/
#define C_REG			 	4U										/* 		register variable						 <obsolete> */
#define C_EXTDEF	 	5U										/* 		external definition					 <obsolete> */
#define C_LABEL		 	6U										/* 		label																		*/
#define C_ULABEL	 	7U										/* 		undefined label							 <obsolete> */
#define C_MOS			 	8U										/* 		structure member						 <obsolete> */
#define C_ARG			 	9U										/* 		function argument						 <obsolete> */
#define C_STRTAG	 10U										/* 		structure tag								 <obsolete> */
#define C_MOU			 11U										/* 		union member								 <obsolete> */
#define C_UNTAG		 12U										/* 		union tag										 <obsolete> */
#define C_TPDEF		 13U										/* 		type definition							 <obsolete> */
#define C_USTATIC	 14U										/* 		uninitialized static				 <obsolete> */
#define C_ENTAG		 15U										/* 		enumeration tag							 <obsolete> */
#define C_MOE			 16U										/* 		enumeration member					 <obsolete> */
#define C_REGPARM	 17U										/* 		register argument						 <obsolete> */
#define C_FIELD		 18U										/* 		bit field										 <obsolete> */
#define C_BLOCK		100U										/* 		".bb" or ".eb"													*/
#define C_FCN			101U										/* 		".bf" or ".ef"													*/
#define C_EOS			102U										/* 		end of structure						 <obsolete> */
#define C_FILE		103U										/* 		file name																*/
#define C_LINE		104U										/*		utility program use (?)			 <obsolete> */
#define C_ALIAS		105U										/* 		duplicate tag								 <obsolete> */
#define C_HIDDEN	106U										/* 		unnamed static symbol				 <obsolete> */
#define	C_HIDEXT	107U										/* 		unnamed external symbol									*/
#define	C_BINCL		108U										/* 		beginning of include file								*/
#define	C_EINCL		109U										/* 		end of include file											*/
//#define C_INFO		110U										/*		special information											*/


bool verboseFlag = false;

inline int getI16(char *x)
{
	return (((unsigned short)x[0]) << 8) | (unsigned short)x[1];
}

inline int getI32(char *x)
{
	return (((unsigned char)x[0]) << 24) | (((unsigned char)x[1]) << 16)
		|  (((unsigned char)x[2]) << 8) | ((unsigned char)x[3]);
}

template <typename T>
void eswap(T *data, const char * format)
{
	int endianTest = 1;
	if(*(char*)&endianTest == 0)
		return;

	char *p = reinterpret_cast<char*>(data);
	const char *q = format;
	while(char c = *q++)
	{
		if(c == 'L')
		{
			std::swap(p[0], p[3]);
			std::swap(p[1], p[2]);
			p += 4;
		}
		else if(c == 's')
		{
			std::swap(p[0], p[1]);
			p += 2;
		}
		else
		{
			assert(c == '.');
			++p;
		}
	}

	//assert(p == reinterpret_cast<char*>(data+1));
	assert(p == reinterpret_cast<char*>(data) + sizeof(T));
}

const char *SwapPEFContainerHeader = "LLLLLLLLssL";
const char *SwapPEFSectionHeader = "LLLLLL....";
const char *SwapPEFLoaderInfoHeader = "LLLLLLLLLLLLLL";
const char *SwapPEFImportedLibrary = "LLLLL..s";
const char *SwapPEFImportedSymbol = "L";
const char *SwapPEFLoaderRelocationHeader = "ssLL";

class ImportLib
{
public:
	std::string path, base, mem;
	std::vector<std::string> imports;
	
	int nameOffset;
	bool weak;
	
	std::vector<int> symNameOffsets;
	
	ImportLib(std::string path, std::string base, std::string mem)
		: path(path), base(base), mem(mem), weak(false)
	{
	}
};

void mkpef(std::istream& in, std::ostream& out, std::string mainSymbol = "__start" )
{
	external_filehdr xcoffHeader;
	
	in.read((char*) &xcoffHeader, sizeof(xcoffHeader));
	in.seekg(getI16(xcoffHeader.f_opthdr),std::ios_base::cur);
	
	if(verboseFlag)
		std::cerr << "flags: " << std::hex << getI16(xcoffHeader.f_flags) << std::dec << std::endl;
	if(verboseFlag)
	{
		std::cerr << "symptr: " << getI32(xcoffHeader.f_symptr) << std::endl;
		std::cerr << "nsyms: " << getI32(xcoffHeader.f_nsyms) << std::endl;
	}

	int nSections = getI16(xcoffHeader.f_nscns);

	PEFContainerHeader pefHeader;
	
	memset(&pefHeader,0,sizeof(pefHeader));
	
	pefHeader.tag1 = kPEFTag1;
	pefHeader.tag2 = kPEFTag2;
	pefHeader.architecture = 'pwpc';
	pefHeader.formatVersion = kPEFVersion;
	pefHeader.sectionCount = 3; // .text, .data, .loader
	pefHeader.instSectionCount = 2; // .text, .data
	
	std::map<std::string,external_scnhdr> xcoffSections;
	std::map<std::string, int> xcoffSectionNumbers;
	std::map<int, std::string> xcoffSectionNames;
	std::map<std::string, int> pefSectionNumbers;
	
	pefSectionNumbers[".text"] = 0;
	pefSectionNumbers[".data"] = 1;
	
	for(int i=0;i<nSections;i++)
	{
		external_scnhdr xcoffSection;
				
		in.read((char*) &xcoffSection, sizeof(xcoffSection));

		if(verboseFlag)
		{
			std::cerr << "section: " << xcoffSection.s_name << std::endl;
			std::cerr << "  at: " << getI32(xcoffSection.s_scnptr) << std::endl;
			std::cerr << "  sz: " << getI32(xcoffSection.s_size) << std::endl;
		}
		xcoffSections[xcoffSection.s_name] = xcoffSection;
		xcoffSectionNumbers[xcoffSection.s_name] = i+1;
		xcoffSectionNames[i+1] = xcoffSection.s_name;
	}
	
	std::vector<ImportLib> importLibs;
	std::vector<unsigned short> relocInstructions;
	std::map<std::string, int> importSources;
	std::map<std::string, int> importedSymbolIndices;
	std::set<std::string> importedSymbolSet;
	int totalImportedSyms = 0;
	{
		external_scnhdr xcoffLoaderSection = xcoffSections[".loader"];
		internal_ldhdr xcoffLoaderHeader;

		char * loaderSectionPtr = (char*)alloca(getI32(xcoffLoaderSection.s_size));
		in.seekg(getI32(xcoffLoaderSection.s_scnptr));
		in.read(loaderSectionPtr, getI32(xcoffLoaderSection.s_size));
		
		xcoffLoaderHeader = *(internal_ldhdr*)loaderSectionPtr;
		eswap(&xcoffLoaderHeader, "LLLLLLLLLL");

		char *p = loaderSectionPtr + xcoffLoaderHeader.l_impoff;
		for(unsigned i=0; i<xcoffLoaderHeader.l_nimpid; i++)
		{
			std::string path = p;
			p += strlen(p) + 1;
			std::string base = p;
			p += strlen(p) + 1;
			std::string mem = p;
			p += strlen(p) + 1;
			importLibs.push_back(ImportLib(path,base,mem));
			if(verboseFlag)
				std::cerr << "Import: " << path << ", " << base << ", " << mem << '\n';
		}

		internal_ldsym *syms = (internal_ldsym*) (loaderSectionPtr + 32);
		for(unsigned i=0; i<xcoffLoaderHeader.l_nsyms; i++)
		{
			std::string name;
			internal_ldsym sym = syms[i];

			eswap(&sym, "........Ls..LL");
			if(sym._l._l_l._l_zeroes == 0)
			{
				eswap(&sym._l._l_l._l_offset,"L");
				name = loaderSectionPtr + xcoffLoaderHeader.l_stoff
										+ sym._l._l_l._l_offset;
			}
			else
				name = sym._l._l_name;
			if(verboseFlag)
				std::cerr << "Loader Symbol: " << name << std::endl;
			
			if((sym.l_smtype & 0xF8) == L_IMPORT)
			{
				assert((sym.l_smtype & 3) == XTY_ER);
				if(verboseFlag)
					std::cerr << "from file: " << sym.l_ifile << std::endl;
				importLibs[sym.l_ifile].imports.push_back(name);
				importSources[name] = totalImportedSyms;
				importedSymbolSet.insert(name);
				totalImportedSyms++;
			}
		}
		{
			int symbolIndex = 0;
			for(unsigned i=1;i<importLibs.size();i++)
			{
				for(unsigned j=0;j<importLibs[i].imports.size();j++)
				{
					importedSymbolIndices[importLibs[i].imports[j]] = symbolIndex++;
				}
			}
		}
	}
	
	PEFLoaderInfoHeader loaderInfoHeader;
	memset(&loaderInfoHeader, 0, sizeof(loaderInfoHeader));

	loaderInfoHeader.mainSection = -1;
	loaderInfoHeader.initSection = -1;
	loaderInfoHeader.termSection = -1;
	
	{

		in.seekg(getI32(xcoffHeader.f_symptr) +
			getI32(xcoffHeader.f_nsyms) * sizeof(external_syment));
		int stringTableLen = 0;

		if(verboseFlag)
			std::cerr << "tell: " << in.tellg() << std::endl;
		in.read((char*)&stringTableLen, 4);
		eswap(&stringTableLen, "L");

		if(verboseFlag)
			std::cerr << "string table len: " << stringTableLen << std::endl;
		char *stringTable = new char[stringTableLen+1];
		if(stringTableLen != 0)
		{
			*(int*)stringTable = stringTableLen;
			if(stringTableLen > 4)
				in.read(stringTable+4, stringTableLen-5);
			stringTable[stringTableLen-1] = 0;
		}

		if(verboseFlag)
		{
			std::cerr << "tell: " << in.tellg() << std::endl;
			std::cerr << "seeking to symptr: " << getI32(xcoffHeader.f_symptr) << std::endl;
		}
		in.seekg(getI32(xcoffHeader.f_symptr),std::ios::beg);

		if(verboseFlag)
			std::cerr << "tell: " << in.tellg() << std::endl;

		int nSymEntries = getI32(xcoffHeader.f_nsyms);
		std::vector<external_syment> syms(nSymEntries);
		in.read((char*) &syms[0], sizeof(external_syment)*nSymEntries);
		
		std::vector<std::string> symNames;

		for(int i=0; i < nSymEntries; i++)
		{
			external_syment ent = syms[i];
			
			std::string name;
			if(getI32(ent.e.e.e_zeroes) == 0)
			{
			    if(getI16(ent.e_scnum) == -2)
			        name = "#debug#";
			    else
				    name = stringTable + getI32(ent.e.e.e_offset);
				
			}
			else
				name = ent.e.e_name;
			if(verboseFlag)
			{
				std::cerr << "[" << i << "] Symbol: " << name << std::hex
						<< " e_value: " << getI32(ent.e_value)
						<< " e_scnum: " << getI16(ent.e_scnum)
						<< " e_type: " << getI16(ent.e_type)
						<< " e_sclass: " << (int)ent.e_sclass[0]
						<< std::dec << std::endl;
			}
			symNames.push_back(name);
			for(int j=0; j<ent.e_numaux[0]; j++)
			{
				i++;
				symNames.push_back("#aux#");
			}

			if(getI16(ent.e_scnum) != 0)
			{
				if(name == mainSymbol)
				{
					std::string secName = xcoffSectionNames[getI16(ent.e_scnum)];
					loaderInfoHeader.mainSection = pefSectionNumbers[secName];
					loaderInfoHeader.mainOffset = getI32(ent.e_value) - getI32(xcoffSections[secName].s_vaddr);
				}
			}
		}
		
		
		delete[] stringTable;

		{
			external_scnhdr xcoffDataSection = xcoffSections[".data"];
			in.seekg(getI32(xcoffDataSection.s_relptr));
			
			int nRelocs = getI16(xcoffDataSection.s_nreloc);
			external_reloc *relocs = new external_reloc[nRelocs];
			in.read((char*) relocs,sizeof(external_reloc)*nRelocs);
			
			if(verboseFlag)
				std::cerr << nRelocs << " relocs\n";
			for(int i=0;i<nRelocs;i++)
			{
				if(verboseFlag)
				{
					std::cerr << "reloc " << std::hex << getI32(relocs[i].r_vaddr)
							<< " " << getI32(relocs[i].r_symndx)
							<< " " << getI16(relocs[i].r_type)
							<< std::dec << std::endl;
				}
				assert(getI16(relocs[i].r_type) == 0x1f00);
				int vaddr = getI32(relocs[i].r_vaddr);

				relocInstructions.push_back(
					PEFRelocComposeSetPosition_1st(vaddr));
				relocInstructions.push_back(
					PEFRelocComposeSetPosition_2nd(vaddr));
				
				int symndx = getI32(relocs[i].r_symndx);
				if(importedSymbolSet.count(symNames[symndx]))
				{
					//int importIndex = importSources[symNames[symndx]];
					int importIndex = importedSymbolIndices[symNames[symndx]];
					assert(importIndex != -1);
					relocInstructions.push_back(
						PEFRelocComposeLgByImport_1st(importIndex));
					relocInstructions.push_back(
						PEFRelocComposeLgByImport_2nd(importIndex));
				}
				else if(getI16(syms[symndx].e_scnum) == xcoffSectionNumbers[".text"])
					relocInstructions.push_back(PEFRelocComposeBySectC(1));
				else if(getI16(syms[symndx].e_scnum) == xcoffSectionNumbers[".data"])
					relocInstructions.push_back(PEFRelocComposeBySectD(1));
				else if(getI16(syms[symndx].e_scnum) == xcoffSectionNumbers[".bss"])
					relocInstructions.push_back(PEFRelocComposeBySectD(1));
				else
					assert(false);
			}
			delete[] relocs;
		}
	}
	
	PEFSectionHeader textSectionHeader, dataSectionHeader, loaderSectionHeader;
	memset(&textSectionHeader, 0, sizeof(textSectionHeader));
	memset(&dataSectionHeader, 0, sizeof(dataSectionHeader));
	memset(&loaderSectionHeader, 0, sizeof(loaderSectionHeader));
	
	int textSize = getI32(xcoffSections[".text"].s_size);
	textSectionHeader.nameOffset = -1;
	textSectionHeader.defaultAddress = 0;
	textSectionHeader.totalLength = textSize;
	textSectionHeader.unpackedLength = textSize;
	textSectionHeader.containerLength = textSize;
	textSectionHeader.containerOffset = sizeof(PEFContainerHeader) + 3*sizeof(PEFSectionHeader);
	textSectionHeader.sectionKind = kPEFCodeSection;
	textSectionHeader.shareKind = kPEFGlobalShare;
	textSectionHeader.alignment = 2;

	int dataSize = getI32(xcoffSections[".data"].s_size);
	dataSectionHeader.nameOffset = -1;
	dataSectionHeader.defaultAddress = 0;
	dataSectionHeader.totalLength = dataSize + getI32(xcoffSections[".bss"].s_size);
	dataSectionHeader.unpackedLength = dataSize;
	dataSectionHeader.containerLength = dataSize;
	dataSectionHeader.containerOffset = sizeof(PEFContainerHeader) + 3*sizeof(PEFSectionHeader) + textSize;
	dataSectionHeader.sectionKind = kPEFUnpackedDataSection;
	dataSectionHeader.shareKind = kPEFProcessShare;
	dataSectionHeader.alignment = 2;

	if(verboseFlag)
	{
		std::cerr << getI32(xcoffSections[".text"].s_size) << std::endl;
		std::cerr << getI32(xcoffSections[".data"].s_size) << std::endl;
		std::cerr << getI32(xcoffSections[".bss"].s_size) << std::endl;
	}
	
	std::vector<std::string> loaderStringTable;
	int loaderStringTableSize = 0;
	
	for(unsigned i=1;i<importLibs.size();i++)
	{
		ImportLib& imp = importLibs[i];
		std::string name;
		
		if(imp.mem != "")
			name = imp.mem;
		else
			name = imp.base;


		if(verboseFlag)
		{
			std::cerr << "XCOFF name \"" << name << '"';
		}
		int dotIndex = name.rfind('.');
		if(dotIndex)
		{
			name = name.substr(0,dotIndex);
			if(name.substr(0,3) == "lib")
				name = name.substr(3);
		}

		if(name.length() > 6)
		{
			if(name.substr(name.length()-6,6) == "__weak")
			{
				name = name.substr(0,name.length()-6);
				imp.weak = true;
			}
		}
		
		if(verboseFlag)
		{
			std::cerr << "PEF name \"" << name << '"';
			if(imp.weak)
				std::cerr << " (weak)";
			std::cerr << " at " << std::hex << loaderStringTableSize << std::dec
						<< std::endl;
		}
		importLibs[i].nameOffset = loaderStringTableSize;
		loaderStringTable.push_back(name);
		loaderStringTableSize += name.length() + 1;
		
		for(unsigned j=0;j<importLibs[i].imports.size();j++)
		{
			name = importLibs[i].imports[j];
			if(verboseFlag)
				std::cerr << "Sym name \"" << name << "\" at " << std::hex
						<< loaderStringTableSize << std::dec << std::endl;
			importLibs[i].symNameOffsets.push_back(loaderStringTableSize);
			loaderStringTable.push_back(name);
			loaderStringTableSize += name.length() + 1;
		}
	}

	loaderInfoHeader.importedLibraryCount = importLibs.size()-1;
	loaderInfoHeader.totalImportedSymbolCount = totalImportedSyms;
	loaderInfoHeader.relocSectionCount = 1; // data only
	loaderInfoHeader.relocInstrOffset = sizeof(PEFLoaderInfoHeader)
									  + sizeof(PEFImportedLibrary)*(importLibs.size()-1)
									  + sizeof(PEFImportedSymbol)*totalImportedSyms
									  + sizeof(PEFLoaderRelocationHeader);
	if(verboseFlag)
	{
		std::cerr << "reloc instr offset: " << loaderInfoHeader.relocInstrOffset
			<< " = " << sizeof(PEFLoaderInfoHeader)
			<< " + " << sizeof(PEFImportedLibrary)*(importLibs.size()-1)
			<< " + " << sizeof(PEFImportedSymbol)*totalImportedSyms
			<< " + " << sizeof(PEFLoaderRelocationHeader)
			<< std::endl;
	}
	loaderInfoHeader.loaderStringsOffset = loaderInfoHeader.relocInstrOffset
									  + relocInstructions.size() * 2;
	loaderInfoHeader.exportHashOffset = loaderInfoHeader.loaderStringsOffset
									  + loaderStringTableSize;

	PEFLoaderRelocationHeader dataRelocationHeader;
	dataRelocationHeader.sectionIndex = 1;
	dataRelocationHeader.reservedA = 0;
	dataRelocationHeader.relocCount = relocInstructions.size();
	dataRelocationHeader.firstRelocOffset = 0;

	
	loaderSectionHeader.nameOffset = -1;
	loaderSectionHeader.defaultAddress = 0;
	loaderSectionHeader.totalLength = 0;
	loaderSectionHeader.unpackedLength = 0;
	loaderSectionHeader.containerLength = loaderInfoHeader.exportHashOffset + 4;
	loaderSectionHeader.containerOffset = sizeof(PEFContainerHeader) + 3*sizeof(PEFSectionHeader)
											+ textSize + dataSize;
	loaderSectionHeader.sectionKind = kPEFLoaderSection;
	loaderSectionHeader.shareKind = kPEFGlobalShare;
	loaderSectionHeader.alignment = 2;
	
	if(verboseFlag)
		std::cerr << "Writing Headers..." << std::flush;

	eswap(&pefHeader, SwapPEFContainerHeader);
	out.write((char*)&pefHeader, sizeof(pefHeader));
	eswap(&textSectionHeader, SwapPEFSectionHeader);
	out.write((char*)&textSectionHeader, sizeof(textSectionHeader));
	eswap(&dataSectionHeader, SwapPEFSectionHeader);
	out.write((char*)&dataSectionHeader, sizeof(dataSectionHeader));
	eswap(&loaderSectionHeader, SwapPEFSectionHeader);
	out.write((char*)&loaderSectionHeader, sizeof(loaderSectionHeader));
	if(verboseFlag)
		std::cerr << "done.\nCopying text and data..." << std::flush;
	{
		char *buf = new char[textSize];
		
		in.seekg(getI32(xcoffSections[".text"].s_scnptr));
		in.read(buf, textSize);
		out.write(buf, textSize);
		delete[] buf;
	}
	{
		char *buf = new char[dataSize];
		
		in.seekg(getI32(xcoffSections[".data"].s_scnptr));
		in.read(buf, dataSize);
		out.write(buf, dataSize);
		delete[] buf;
	}
	if(verboseFlag)
		std::cerr << "done.\n";
	eswap(&loaderInfoHeader, SwapPEFLoaderInfoHeader);
	out.write((char*)&loaderInfoHeader, sizeof(loaderInfoHeader));
	
	int firstImportedSymbol = 0;
	
	if(verboseFlag)
		std::cerr << "imports..." << std::flush;
	for(unsigned i=1;i<importLibs.size();i++)
	{
		PEFImportedLibrary impLib;
		memset(&impLib,0,sizeof(impLib));
		impLib.nameOffset = importLibs[i].nameOffset;
		impLib.importedSymbolCount = importLibs[i].imports.size();
		impLib.firstImportedSymbol= firstImportedSymbol;
		firstImportedSymbol += impLib.importedSymbolCount;
		
		if(importLibs[i].weak)
			impLib.options = kPEFWeakImportLibMask;
		
		eswap(&impLib, SwapPEFImportedLibrary);
		out.write((char*)&impLib, sizeof(impLib));
	}
	for(unsigned i=1;i<importLibs.size();i++)
	{
		for(unsigned j=0;j<importLibs[i].imports.size();j++)
		{
			PEFImportedSymbol sym;
			sym.classAndName = PEFComposeImportedSymbol(kPEFTVectorSymbol /* ### */,
									importLibs[i].symNameOffsets[j]);
			eswap(&sym, SwapPEFImportedSymbol);
			out.write((char*)&sym, sizeof(sym));
		}
	}
	if(verboseFlag)
		std::cerr << "done.\n";
	
	if(verboseFlag)
		std::cerr << "relocations..." << std::flush;
	eswap(&dataRelocationHeader, SwapPEFLoaderRelocationHeader);
	out.write((char*)&dataRelocationHeader, sizeof(dataRelocationHeader));
	for(unsigned i=0;i<relocInstructions.size();i++)
	{
		short insn = relocInstructions[i];
		eswap(&insn, "s");
		out.write((char*)&insn, sizeof(insn));
	}
	if(verboseFlag)
	{
		std::cerr << "done.\n";
		std::cerr << "strings..." << std::flush;
	}
	for(unsigned i=0;i<loaderStringTable.size();i++)
	{
		out.write(loaderStringTable[i].c_str(),loaderStringTable[i].length()+1);
	}
	if(verboseFlag)
		std::cerr << "done.\n";
	
	{
		int zero = 0;
		out.write((char*)&zero, 4);
	}
}

int main (int argc, char * const argv[]) {
	bool hadInput = false;
	std::string inputFn;
	bool hadOutput = false;
	std::string outputFn = "";
	
	for(int i=1;i<argc;i++)
	{
		std::string arg = argv[i];
		if(arg == "-v")
			verboseFlag = true;
		else if(arg == "-o")
		{
			i++;
			if(i >= argc)
			{
				std::cerr << "makepef: -o requires an argument.\n";
				return 1;
			}
			if(hadOutput)
			{
				std::cerr << "makepef: -o can only be used once.\n";
				return 1;
			}
			outputFn = argv[i];
			hadOutput = true;
		}
		else
		{
			if(hadInput)
			{
				std::cerr << "makepef: can only handle one input file.\n";
				return 1;
			}
			inputFn = argv[i];
			hadInput = true;
		}
	}
	if(!hadInput)
	{
		std::cerr << "makepef: no input file specified.\n";
		return 1;
	}
	
	if(!hadOutput)
	{
		std::cerr << "makepef: no output file specified.\n";
		return 1;
	}
	std::ifstream in(inputFn.c_str());
	std::ofstream out(outputFn.c_str());
	mkpef(in, out);
    return 0;
}

