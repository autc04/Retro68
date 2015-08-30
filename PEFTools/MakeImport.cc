#include <iostream>
#include <fstream>
#include <utility>
#include <vector>
#include <string>
#include <algorithm>

#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <assert.h>

#include "PEF.h"

#include "ResourceFile.h"

using std::cout;
using std::cerr;
using std::endl;
using std::pair;
using std::make_pair;
using std::vector;
using std::string;
using std::ofstream;
using std::ios_base;

UInt16 eu16(UInt16 x)
{
	int little = 1;
	if(*(char*)&little)
	{
		return (x << 8) | (x >> 8);
	}
	else
	{
		return x;
	}
}
UInt32 eu32(UInt32 x)
{
	int little = 1;
	if(*(char*)&little)
	{
		return (x << 24)
			 | ((x & 0xFF00) << 8)
			 | ((x >> 8) & 0xFF00)
			 | (x >> 24);
	}
	else
	{
		return x;
	}
}
SInt16 es16(SInt16 x) { return eu16(x); }
SInt32 es32(SInt32 x) { return eu32(x); }

void MakeImportLibrary(const char *pefptr, size_t pefsize, string libname, string name)
{
	PEFContainerHeader *containerHeader = (PEFContainerHeader*) pefptr;

	assert(eu32(containerHeader->tag1) == 'Joy!');
	assert(eu32(containerHeader->tag2) == 'peff');

	const PEFSectionHeader *sectionHeaders
		= (const PEFSectionHeader*) (pefptr + kPEFFirstSectionHeaderOffset);
	
	const PEFSectionHeader *loaderHeader = NULL;
	UInt16 n = eu16(containerHeader->sectionCount);
	for(UInt16 i=0; i < n; i++)
		if(sectionHeaders[i].sectionKind == kPEFLoaderSection)
			loaderHeader = &sectionHeaders[i];
	
	const PEFLoaderInfoHeader *loaderInfoHeader
		= (PEFLoaderInfoHeader*) (pefptr + eu32(loaderHeader->containerOffset));
		
	
	UInt32 hashTableSize = 1;
	UInt32 hashTablePower = eu32(loaderInfoHeader->exportHashTablePower);
	while(hashTablePower--)
		hashTableSize *= 2;
	
	UInt32 nSymbols = eu32(loaderInfoHeader->exportedSymbolCount);
	
	const char *symbols	/* use char pointer to avoid packing issues */
		=	(pefptr	+ eu32(loaderHeader->containerOffset)
					+ eu32(loaderInfoHeader->exportHashOffset)
					+ hashTableSize * sizeof(PEFExportedSymbolHashSlot)
					+ nSymbols * sizeof(PEFExportedSymbolKey));
	
	const char *stringTable = pefptr
						+ eu32(loaderHeader->containerOffset)
						+ eu32(loaderInfoHeader->loaderStringsOffset);
	const char *stringTableEnd = pefptr
					+ eu32(loaderHeader->containerOffset)
					+ eu32(loaderInfoHeader->exportHashOffset);
	vector< pair< const char *, UInt8 > > classesAndNamePtrs;
	
	for(UInt32 i=0; i < nSymbols; i++)
	{
		const PEFExportedSymbol sym = * (PEFExportedSymbol*) (symbols + 10*i);
		
		UInt8 symclass = PEFExportedSymbolClass(eu32(sym.classAndName));
		UInt32 nameoffset = PEFExportedSymbolNameOffset(eu32(sym.classAndName));
		
		const char *nameptr
			= stringTable + nameoffset;
		
		classesAndNamePtrs.push_back( make_pair(nameptr, symclass) );
	}
	std::sort(classesAndNamePtrs.begin(), classesAndNamePtrs.end());
	
	vector< pair<string, UInt8> > exportedSymbols;
	for(UInt32 i=0; i < nSymbols; i++)
	{
		UInt8 symclass = classesAndNamePtrs[i].second;
		const char *namestart = classesAndNamePtrs[i].first;
		
		string name;
		if(i + 1 < nSymbols)
		{
			const char *nameend = classesAndNamePtrs[i+1].first;
			name = string(namestart,nameend);
		}
		else
			name = string(namestart);
			
		//cout << (int) namestart << "-" << (int) nameend << endl;
		 
		//cout << (int)symclass << " " << name << endl;
		
		exportedSymbols.push_back( make_pair( name, symclass ) );
	}
	sort(exportedSymbols.begin(), exportedSymbols.end());
	
	{
		ofstream expFile("stub.exp");
		ofstream sFile("stub.s");
		sFile << "\t.toc\n";
		for(UInt32 i=0; i< nSymbols; i++)
		{
			string& sym = exportedSymbols[i].first;
			if(exportedSymbols[i].second == kPEFTVectorSymbol)
			{
				expFile << sym << endl;
				//cFile << "void " << sym << "() {}" << endl;
				sFile << ".text" << endl;
				sFile << "\t.globl " << sym << endl;
				sFile << "\t.globl ." << sym << endl;
				sFile << "\t.csect " << sym << "[DS]" << endl;
				sFile << sym << ':' << endl;
				sFile << ".long ." << sym << ", TOC[tc0], 0" << endl;
				sFile << ".text" << endl;
				sFile << '.' << sym << ':' << endl;
				sFile << "\tblr" << endl;
			}
			else if(exportedSymbols[i].second == kPEFDataSymbol)
			{
				expFile << sym << endl;
				//cFile << "int " << sym << " = 42;" << endl;
				sFile << "\t.globl " << sym << endl;
				sFile << "\t.csect .data[RW],3" << endl;
				sFile << "\t.align 2" << endl;
				sFile << sym << ':' << endl;
				sFile << "\t.long\t42" << endl;
			}
		}
		
		cerr << "Generating: " << name << " -> " << libname << endl;
		//system("powerpc-apple-macos-gcc -fno-builtin -c stub.c");
		system("powerpc-apple-macos-as stub.s -o stub.o");
		system(("powerpc-apple-macos-ld -shared --no-check-sections "
				"-bexport:stub.exp -o'"
				+ libname + "' stub.o").c_str());
		//system(("powerpc-apple-macos-ar cq '" + libname + "' '" + name + ".o'").c_str());
		//system(("powerpc-apple-macos-ar t '" + libname + "'").c_str());
		
		unlink("stub.exp");
		unlink("stub.o");
		unlink("stub.s");
		//unlink((name + ".o").c_str());
	}
}

void MakeImportLibraryMulti(const char *path, string libname)
{
	ResourceFile resFile(path);
	assert(resFile.read());

	const char *file = resFile.data.data();
	Resource& cfrgRes = resFile.resources.resources[ResRef("cfrg",0)];

	unlink(("lib" + libname + ".a").c_str());
	
	CFragResource *cfrg = (CFragResource *)cfrgRes.getData().data();
	CFragResourceMember *member = &(cfrg -> firstMember);
	
	for(UInt16 i = 0; i < eu16(cfrg->memberCount); i++)
	{
		string membername =
			string(member->name+1, member->name+1+member->name[0]);
		cout << i << ": " << membername	<< endl;
		if(eu32(member->architecture) == kPowerPCCFragArch
			|| eu32(member->architecture) == kAnyCFragArch)
		{
			if(member->usage == kStubLibraryCFrag
				|| member->usage == kImportLibraryCFrag)
				MakeImportLibrary(file + eu32(member->offset), eu32(member->length),
					libname, membername);
			else if(member->usage == kWeakStubLibraryCFrag)
				MakeImportLibrary(file + eu32(member->offset), eu32(member->length),
					libname, membername + "__weak");
			else
				std::cerr << "Inappropriate usage flag: "
						  << (int)member->usage << endl;
			//offset = member->offset;
			//length = member->length;
			//found = true;
			//break;
		}
		else
			std::cerr << "Inappropriate arch: "
				<< string((char*) &member->architecture,
						((char*) &member->architecture) + 4) << endl;
		
		member = (CFragResourceMember*)  (((char*)member) + eu16(member->memberSize));
	}
}

int main (int argc, char * const argv[])
{
	//printf("%d\n",argc);
	if(argc != 3)
	{
		cerr << "Usage: makeimport <peflib> <libname>" << endl;
		return 1;
	}
	
	int fd = open(argv[1], O_RDONLY, 0);
	if(fd < 0)
	{
		perror(argv[1]);
		return 1;
	}
	/*struct stat sb;
	fstat(fd, &sb);
	off_t filesize = sb.st_size;
	char *p = (char*) mmap(NULL, filesize, PROT_READ, MAP_FILE | MAP_PRIVATE, fd, 0);*/
	
	MakeImportLibraryMulti(argv[1], argv[2]);

	close(fd);
    return 0;
}
