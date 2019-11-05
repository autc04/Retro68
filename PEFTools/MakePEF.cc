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
#include <ctype.h>

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

#define AOUTHDR external_aouthdr
#include "rs6000.h"

bool verboseFlag = false;

inline int getI16(const void *xx)
{
    const unsigned char *x = (const unsigned char*)xx;
    return (x[0] << 8) | x[1];
}

inline int getI32(const void *xx)
{
    const unsigned char *x = (const unsigned char*)xx;
    return (x[0] << 24) | (x[1] << 16) | (x[2] << 8) | x[3];
}

inline int getI8(const void *xx)
{
    return *(const unsigned char*)xx;
}

template<typename ch, int n>
inline int get(const ch (&x) [n])
{
    switch(n)
    {
        case 1: return getI8(x);
        case 2: return getI16(x);
        case 4: return getI32(x);
        default: abort();
    }
}


class ImportLib
{
public:
    std::string path, base, mem;
    std::vector<std::string> imports;
    std::vector<int> xcoffImportIndices;

    int nameOffset;
    bool weak;
    
    std::vector<int> symNameOffsets;
    
    ImportLib(std::string path, std::string base, std::string mem)
        : path(path), base(base), mem(mem), weak(false)
    {
    }
};

void mkpef(const std::string& inFn, const std::string& outFn)
{
    std::ifstream in(inFn);

    external_filehdr xcoffHeader;
    external_aouthdr aoutHeader;

    in.read((char*) &xcoffHeader, sizeof(xcoffHeader));
    assert((size_t)get(xcoffHeader.f_opthdr) >= sizeof(aoutHeader));
    in.read((char*)&aoutHeader, sizeof(aoutHeader));
    in.seekg(get(xcoffHeader.f_opthdr) - sizeof(aoutHeader),std::ios_base::cur);
    
    if(verboseFlag)
    {
        std::cerr << "flags: " << std::hex << get(xcoffHeader.f_flags) << std::dec << std::endl;
        std::cerr << "symptr: " << get(xcoffHeader.f_symptr) << std::endl;
        std::cerr << "nsyms: " << get(xcoffHeader.f_nsyms) << std::endl;
    }


    std::map<std::string,external_scnhdr> xcoffSections;
    std::map<std::string, int> xcoffSectionNumbers;

    int nSections = get(xcoffHeader.f_nscns);
    for(int i=0;i<nSections;i++)
    {
        external_scnhdr xcoffSection;
                
        in.read((char*) &xcoffSection, sizeof(xcoffSection));

        if(verboseFlag)
        {
            std::cerr << "section: " << xcoffSection.s_name << std::endl;
            std::cerr << "  at: " << get(xcoffSection.s_scnptr) << std::endl;
            std::cerr << "  sz: " << get(xcoffSection.s_size) << std::endl;
        }
        xcoffSections[xcoffSection.s_name] = xcoffSection;
        xcoffSectionNumbers[xcoffSection.s_name] = i+1;
    }
    

    std::vector<ImportLib> importLibs;
    std::vector<int> importedSymbolIndices;
    int totalImportedSyms = 0;

    std::vector<unsigned short> relocInstructions;

    {
        external_scnhdr xcoffLoaderSection = xcoffSections[".loader"];
        external_ldhdr xcoffLoaderHeader;

        char * loaderSectionPtr = (char*)alloca(get(xcoffLoaderSection.s_size));
        in.seekg(get(xcoffLoaderSection.s_scnptr));
        in.read(loaderSectionPtr, get(xcoffLoaderSection.s_size));
        
        xcoffLoaderHeader = *(external_ldhdr*)loaderSectionPtr;

        char *p = loaderSectionPtr + get(xcoffLoaderHeader.l_impoff);
        for(int i=0; i<get(xcoffLoaderHeader.l_nimpid); i++)
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

        external_ldsym *syms = (external_ldsym*) (loaderSectionPtr + sizeof(external_ldhdr));
        for(int i=0; i<get(xcoffLoaderHeader.l_nsyms); i++)
        {
            std::string name;
            external_ldsym& sym = syms[i];

            if(get(sym._l._l_l._l_zeroes) == 0)
            {
                name = loaderSectionPtr + get(xcoffLoaderHeader.l_stoff)
                                        + get(sym._l._l_l._l_offset);
            }
            else
                name = sym._l._l_name;
            if(verboseFlag)
                std::cerr << "Loader Symbol: " << name << std::endl;
            
            if((get(sym.l_smtype) & 0xF8) == 0x40 /*L_IMPORT*/)
            {
                assert((get(sym.l_smtype) & 3) == 0 /*XTY_ER*/);
                if(verboseFlag)
                    std::cerr << "... from file: " << get(sym.l_ifile) << std::endl;
                importLibs[get(sym.l_ifile)].imports.push_back(name);
                importLibs[get(sym.l_ifile)].xcoffImportIndices.push_back(i);
                totalImportedSyms++;
            }
        }
        importedSymbolIndices.resize(get(xcoffLoaderHeader.l_nsyms));
        {
            int symbolIndex = 0;
            for(unsigned i=1;i<importLibs.size();i++)
            {
                for(unsigned j=0;j<importLibs[i].xcoffImportIndices.size();j++)
                {
                    importedSymbolIndices[importLibs[i].xcoffImportIndices[j]] = symbolIndex;
                    symbolIndex++;
                }
            }
        }

        int xcoffDataSecNumber = xcoffSectionNumbers[".data"];

        external_ldrel *rels = (external_ldrel*) (loaderSectionPtr + sizeof(external_ldhdr) + get(xcoffLoaderHeader.l_nsyms) * sizeof(external_ldsym));
        for(int i=0; i<get(xcoffLoaderHeader.l_nreloc); i++)
        {
            external_ldrel& rel = rels[i];

            if(verboseFlag)
            {
                std::cerr << "[" << i << "] reloc: " << std::hex << get(rel.l_vaddr) << " " << get(rel.l_symndx) << " " << get(rel.l_rtype) << " " << get(rel.l_rsecnm) << "\n";
            }
            assert(get(rel.l_rtype) == 0x1f00);
            assert(get(rel.l_rsecnm) == xcoffDataSecNumber);

            int vaddr = get(rel.l_vaddr);

            relocInstructions.push_back(
                PEFRelocComposeSetPosition_1st(vaddr));
            relocInstructions.push_back(
                PEFRelocComposeSetPosition_2nd(vaddr));
            if(get(rel.l_symndx) == 0)
                relocInstructions.push_back(PEFRelocComposeBySectC(1));
            else if(get(rel.l_symndx) == 1 || get(rel.l_symndx) == 2)
                relocInstructions.push_back(PEFRelocComposeBySectD(1));
            else
            {
                int importIndex = importedSymbolIndices[get(rel.l_symndx) - 3];
                relocInstructions.push_back(
                    PEFRelocComposeLgByImport_1st(importIndex));
                relocInstructions.push_back(
                    PEFRelocComposeLgByImport_2nd(importIndex));
            }
        }
    }
        
    PEFContainerHeader pefHeader;

    memset(&pefHeader,0,sizeof(pefHeader));

    pefHeader.tag1 = kPEFTag1;
    pefHeader.tag2 = kPEFTag2;
    pefHeader.architecture = 'pwpc';
    pefHeader.formatVersion = kPEFVersion;
    pefHeader.sectionCount = 3; // .text, .data, .loader
    pefHeader.instSectionCount = 2; // .text, .data

    PEFLoaderInfoHeader loaderInfoHeader;
    memset(&loaderInfoHeader, 0, sizeof(loaderInfoHeader));

    loaderInfoHeader.mainSection = -1;
    loaderInfoHeader.initSection = -1;
    loaderInfoHeader.termSection = -1;

    loaderInfoHeader.mainSection = 1;
    loaderInfoHeader.mainOffset = get(aoutHeader.entry);


    PEFSectionHeader textSectionHeader, dataSectionHeader, loaderSectionHeader;
    memset(&textSectionHeader, 0, sizeof(textSectionHeader));
    memset(&dataSectionHeader, 0, sizeof(dataSectionHeader));
    memset(&loaderSectionHeader, 0, sizeof(loaderSectionHeader));
    
    int textSize = get(xcoffSections[".text"].s_size);
    textSectionHeader.nameOffset = -1;
    textSectionHeader.defaultAddress = 0;
    textSectionHeader.totalLength = textSize;
    textSectionHeader.unpackedLength = textSize;
    textSectionHeader.containerLength = textSize;
    textSectionHeader.containerOffset = sizeof(PEFContainerHeader) + 3*sizeof(PEFSectionHeader);
    textSectionHeader.sectionKind = kPEFCodeSection;
    textSectionHeader.shareKind = kPEFGlobalShare;
    textSectionHeader.alignment = 2;

    int dataSize = get(xcoffSections[".data"].s_size);
    dataSectionHeader.nameOffset = -1;
    dataSectionHeader.defaultAddress = 0;
    dataSectionHeader.totalLength = dataSize + get(xcoffSections[".bss"].s_size);
    dataSectionHeader.unpackedLength = dataSize;
    dataSectionHeader.containerLength = dataSize;
    dataSectionHeader.containerOffset = sizeof(PEFContainerHeader) + 3*sizeof(PEFSectionHeader) + textSize;
    dataSectionHeader.sectionKind = kPEFUnpackedDataSection;
    dataSectionHeader.shareKind = kPEFProcessShare;
    dataSectionHeader.alignment = 2;

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
        
        if(name.length() > 5)
        {
                // the shared library name has been encoded as hex by MakeImport
                // in order to avoid potential file name issues
                // classic MacOS shared library names are in MacRoman and
                // may contain wierd characters; the shared library name is used
                // as the file name for the archive member, so there can be problems.
            if(name.substr(0,5) == "imp__")
            {
                std::string realName;
                
                int i;
                int n = name.size();
                for(i = 5; i < n && name[i] != '_'; i++)
                    ;
                ++i;
                for(; i + 1 < n && name[i] != '_'; i+=2)
                {
                    char c1 = tolower(name[i]);
                    char c2 = tolower(name[i+1]);
                    assert(isdigit(c1) || (c1 >= 'a' && c1 <= 'f'));
                    assert(isdigit(c2) || (c2 >= 'a' && c2 <= 'f'));
                    int c = (c1 >= 'a' ? c1 - 'a' + 10 : c1 - '0') * 16
                          + (c2 >= 'a' ? c2 - 'a' + 10 : c2 - '0');
                    realName += (char)c;
                }
                name = realName;
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
    
    std::ofstream out(outFn);
    if(verboseFlag)
        std::cerr << "Writing Headers..." << std::flush;

    eswap(&pefHeader);
    out.write((char*)&pefHeader, sizeof(pefHeader));
    eswap(&textSectionHeader);
    out.write((char*)&textSectionHeader, sizeof(textSectionHeader));
    eswap(&dataSectionHeader);
    out.write((char*)&dataSectionHeader, sizeof(dataSectionHeader));
    eswap(&loaderSectionHeader);
    out.write((char*)&loaderSectionHeader, sizeof(loaderSectionHeader));
    if(verboseFlag)
        std::cerr << "done.\nCopying text and data..." << std::flush;
    {
        char *buf = new char[textSize];
        
        in.seekg(get(xcoffSections[".text"].s_scnptr));
        in.read(buf, textSize);
        out.write(buf, textSize);
        delete[] buf;
    }
    {
        char *buf = new char[dataSize];
        
        in.seekg(get(xcoffSections[".data"].s_scnptr));
        in.read(buf, dataSize);
        out.write(buf, dataSize);
        delete[] buf;
    }
    if(verboseFlag)
        std::cerr << "done.\n";
    eswap(&loaderInfoHeader);
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
        
        eswap(&impLib);
        out.write((char*)&impLib, sizeof(impLib));
    }
    for(unsigned i=1;i<importLibs.size();i++)
    {
        for(unsigned j=0;j<importLibs[i].imports.size();j++)
        {
            PEFImportedSymbol sym;
            uint8_t weakflag = importLibs[i].weak ? 0x80 : 0;

            sym.classAndName = PEFComposeImportedSymbol(weakflag | kPEFTVectorSymbol /* ### */,
                                    importLibs[i].symNameOffsets[j]);
            eswap(&sym);
            out.write((char*)&sym, sizeof(sym));
        }
    }
    if(verboseFlag)
        std::cerr << "done.\n";
    
    if(verboseFlag)
        std::cerr << "relocations..." << std::flush;
    eswap(&dataRelocationHeader);
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
    mkpef(inputFn, outputFn);
    return 0;
}

