#include <iostream>
#include <fstream>
#include <utility>
#include <vector>
#include <string>

#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "PEF.h"

using std::cout;
using std::cerr;
using std::endl;
using std::pair;
using std::make_pair;
using std::vector;
using std::string;
using std::ofstream;
using std::ios_base;

// Change this to support little-endian hosts:
UInt16 eu16(UInt16 x) { return x; }
UInt32 eu32(UInt32 x) { return x; }
SInt16 es16(SInt16 x) { return x; }
SInt32 es32(SInt32 x) { return x; }

void MakeImportLibrary(char *pefptr, size_t pefsize, string libname, string name)
{
	PEFContainerHeader *containerHeader = (PEFContainerHeader*) pefptr;

	assert(eu32(containerHeader->tag1) == 'Joy!');
	assert(eu32(containerHeader->tag2) == 'peff');

	PEFSectionHeader *sectionHeaders
		= (PEFSectionHeader*) (pefptr + kPEFFirstSectionHeaderOffset);
	
	PEFSectionHeader *loaderHeader = NULL;
	UInt16 n = eu16(containerHeader->sectionCount);
	for(UInt16 i=0; i < n; i++)
		if(sectionHeaders[i].sectionKind == kPEFLoaderSection)
			loaderHeader = &sectionHeaders[i];
	
	PEFLoaderInfoHeader *loaderInfoHeader
		= (PEFLoaderInfoHeader*) (pefptr + eu32(loaderHeader->containerOffset));
		
	
	UInt32 hashTableSize = 1;
	UInt32 hashTablePower = eu32(loaderInfoHeader->exportHashTablePower);
	while(hashTablePower--)
		hashTableSize *= 2;
	
	UInt32 nSymbols = eu32(loaderInfoHeader->exportedSymbolCount);
	
	char *symbols	/* use char pointer to avoid packing issues */
		=	(pefptr	+ eu32(loaderHeader->containerOffset)
					+ eu32(loaderInfoHeader->exportHashOffset)
					+ hashTableSize * sizeof(PEFExportedSymbolHashSlot)
					+ nSymbols * sizeof(PEFExportedSymbolKey));
	
	char *stringTable = pefptr
						+ eu32(loaderHeader->containerOffset)
						+ eu32(loaderInfoHeader->loaderStringsOffset);
	char *stringTableEnd = pefptr
					+ eu32(loaderHeader->containerOffset)
					+ eu32(loaderInfoHeader->exportHashOffset);
	vector< pair< const char *, UInt8 > > classesAndNamePtrs;
	
	for(UInt32 i=0; i < nSymbols; i++)
	{
		PEFExportedSymbol sym = * (PEFExportedSymbol*) (symbols + 10*i);
		
		UInt8 symclass = PEFExportedSymbolClass(eu32(sym.classAndName));
		UInt32 nameoffset = PEFExportedSymbolNameOffset(eu32(sym.classAndName));
		
		const char *nameptr
			= stringTable + nameoffset;
		
		classesAndNamePtrs.push_back( make_pair(nameptr, symclass) );
	}
	sort(classesAndNamePtrs.begin(), classesAndNamePtrs.end());
	
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
		//ofstream cFile("stub.c");
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
				+ name + ".o' stub.o").c_str());
		system(("powerpc-apple-macos-ar cq '" + libname + "' '" + name + ".o'").c_str());
		system(("powerpc-apple-macos-ar t '" + libname + "'").c_str());
		
		unlink("stub.exp");
		unlink("stub.o");
		unlink("stub.c");
		unlink((name + ".o").c_str());
	}

	/*{
		ofstream expFile((name + ".exp").c_str());
		ofstream cFile((name + ".stub.c").c_str());
		for(UInt32 i=0; i< nSymbols; i++)
		{
			if(exportedSymbols[i].second == kPEFTVectorSymbol)
			{
				expFile << exportedSymbols[i].first << endl;
				cFile << "void " << exportedSymbols[i].first << "() {}" << endl;
			}
			else if(exportedSymbols[i].second == kPEFDataSymbol)
			{
				expFile << exportedSymbols[i].first << endl;
				cFile << "int " << exportedSymbols[i].first << " = 42;" << endl;
			}
		}
		
		system(("powerpc-apple-macos-gcc -fno-builtin -c '" + name + ".stub.c'").c_str());
		system(("powerpc-apple-macos-ld -shared --no-check-sections '-bexport:"
				+ name + ".exp' -o '"
				+ name + ".o' '" + name + ".stub.o'").c_str());
		system(("powerpc-apple-macos-ar cq lib" + libname + ".a '" + name + ".o'").c_str());
		system(("powerpc-apple-macos-ar t lib" + libname + ".a").c_str());
		
		unlink((name + ".exp").c_str());
		unlink((name + ".stub.c").c_str());
		unlink((name + ".stub.o").c_str());
		//unlink((name + ".o").c_str());
	}*/
	/*
	{
		ofstream expFile("shared.exp",ios_base::app | ios_base::out);
		ofstream cFile("shared.stub.c",ios_base::app | ios_base::out);
		for(UInt32 i=0; i< nSymbols; i++)
		{
			if(exportedSymbols[i].second == kPEFTVectorSymbol)
			{
				expFile << exportedSymbols[i].first << endl;
				cFile << "void " << exportedSymbols[i].first << "() {}" << endl;
			}
			else if(exportedSymbols[i].second == kPEFDataSymbol)
			{
				expFile << exportedSymbols[i].first << endl;
				cFile << "int " << exportedSymbols[i].first << " = 42;" << endl;
			}
		}
		
	}*/

	/*{
		PEFSectionHeader *lastInstantiated =
			&sectionHeaders[eu16(containerHeader->instSectionCount)-1];
			
		UInt32 containerSize = eu32(lastInstantiated->containerOffset)
							 + eu32(lastInstantiated->containerLength);
		pefptr += containerSize;
		pefsize -= containerSize;
	}*/
}

bool FindPEFContainer(const char *path, const char *libname,
						UInt32& offset, UInt32& length)
{
	bool found = false;
	FSRef ref;
	FSPathMakeRef((const UInt8*) path, &ref, NULL);
	
	short refnum = FSOpenResFile(&ref, fsRdPerm);
	
	Handle h = Get1Resource('cfrg', 0);
	HLock(h);
	
	CFragResource *cfrg = (CFragResource*) *h;
	CFragResourceMember *member = &(cfrg -> firstMember);
	
	for(UInt16 i = 0; i < cfrg->memberCount; i++)
	{
		cout << i << ": " << string(member->name+1, member->name+1+member->name[0])
			<< endl;
		if((member->architecture == kPowerPCCFragArch
			|| member->architecture == kAnyCFragArch)
			&& (string(member->name+1, member->name+1+member->name[0])
				== libname))
		{
			offset = member->offset;
			length = member->length;
			found = true;
			break;
		}
		
		member = (CFragResourceMember*)  (((char*)member) + member->memberSize);
	}
	
	CloseResFile(refnum);
	
	return found;
}

void MakeImportLibraryMulti(char *file, const char *path, string libname)
{
	FSRef ref;
	FSPathMakeRef((const UInt8*) path, &ref, NULL);
	
	short refnum = FSOpenResFile(&ref, fsRdPerm);
	
	Handle h = Get1Resource('cfrg', 0);
	HLock(h);
	
	unlink(("lib" + libname + ".a").c_str());
	
	CFragResource *cfrg = (CFragResource*) *h;
	CFragResourceMember *member = &(cfrg -> firstMember);
	
	for(UInt16 i = 0; i < cfrg->memberCount; i++)
	{
		string membername =
			string(member->name+1, member->name+1+member->name[0]);
		cout << i << ": " << membername	<< endl;
		if(member->architecture == kPowerPCCFragArch
			|| member->architecture == kAnyCFragArch)
		{
			if(member->usage == kStubLibraryCFrag
				|| member->usage == kImportLibraryCFrag)
				MakeImportLibrary(file + member->offset, member->length,
					libname, membername);
			else if(member->usage == kWeakStubLibraryCFrag)
				MakeImportLibrary(file + member->offset, member->length,
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
		
		member = (CFragResourceMember*)  (((char*)member) + member->memberSize);
	}
	
	CloseResFile(refnum);
	/*
	system("powerpc-apple-macos-gcc -fno-builtin -c shared.stub.c");
	system("powerpc-apple-macos-ld -shared --no-check-sections -bexport:shared.exp "
			"-o shared.o shared.stub.o");
	system(("powerpc-apple-macos-ar cq lib" + libname + ".a shared.o").c_str());
	*/
	/*unlink("shared.exp");
	unlink("shared.stub.c");
	unlink("shared.stub.o");
	unlink("shared.o");*/
}

int main (int argc, char * const argv[])
{
	//printf("%d\n",argc);
	if(argc != 3)
	{
		cerr << "Usage: makeimport <peflib> [<libname>]" << endl;
		return 1;
	}
	
	int fd = open(argv[1], O_RDONLY, 0);
	if(fd < 0)
	{
		perror(argv[1]);
		return 1;
	}
	struct stat sb;
	fstat(fd, &sb);
	off_t filesize = sb.st_size;
	char *p = (char*) mmap(NULL, filesize, PROT_READ, MAP_FILE | MAP_PRIVATE, fd, 0);
	
	/*UInt32 offset, length;
	if(FindPEFContainer(argv[1], argv[2], offset, length))
	{
		MakeImportLibrary(p+offset, length, argv[2]);
	}
	else
	{
		cerr << "No cfrg resource found or specified library not found." << endl
			 << "Using first container." << endl;
		MakeImportLibrary(p, filesize, argv[2]);
	}*/
	MakeImportLibraryMulti(p,argv[1], argv[2]);

	close(fd);
    return 0;
}
