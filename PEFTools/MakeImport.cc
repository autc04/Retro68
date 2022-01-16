#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <utility>
#include <vector>
#include <string>
#include <algorithm>

#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>

#include <fcntl.h>
#include <unistd.h>
#include <assert.h>

#include "PEF.h"

#include "ResourceFile.h"

#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>

namespace fs = boost::filesystem;


using std::cout;
using std::cerr;
using std::endl;
using std::pair;
using std::make_pair;
using std::vector;
using std::string;
using std::ofstream;
using std::ios_base;

bool verboseFlag = false;

struct CFragMember
{
    string   name;
    uint32_t architecture;
    uint8_t  usage;
    char *data;
    uint32_t length;
    
    CFragMember() : architecture(0), usage(0), data(0), length(0) {}
    CFragMember(string n, uint32_t a, uint8_t u, char *d, uint32_t l)
        : name(n), architecture(a), usage(u), data(d), length(l)
    {
    }
};

void RunCommand(const char *command, std::vector<std::string> args)
{
    std::vector<const char*> ptrs;
    ptrs.push_back(command);
    for(auto& s : args)
        ptrs.push_back(s.c_str());
    ptrs.push_back(NULL);

    pid_t pid = fork();
    if(pid == -1)
    {
        perror(command);
        exit(1);
    }

    if(pid)
    {
        int status = 0;
        while(waitpid(pid, &status, 0) == -1 && errno == EINTR)
            ;
        if(!WIFEXITED(status) || WEXITSTATUS(status) != 0)
        {
            std::cerr << command << " failed.\n";
            exit(1);
        }
    }
    else
    {
        execvp(command, const_cast<char *const*>(ptrs.data()));
        perror("exec");
        exit(1);
    }
}

void MakeImportLibrary(char *pefptr, size_t pefsize, fs::path dest, fs::path tmpdir)
{
    PEFContainerHeader *containerHeader = (PEFContainerHeader*) pefptr;
    eswap(containerHeader);

    assert(containerHeader->tag1 == 'Joy!');
    assert(containerHeader->tag2 == 'peff');

    PEFSectionHeader *sectionHeaders
        = (PEFSectionHeader*) (pefptr + kPEFFirstSectionHeaderOffset);

    PEFSectionHeader *loaderHeader = NULL;
    uint16_t n = containerHeader->sectionCount;
    for(uint16_t i=0; i < n; i++)
    {
        eswap(&sectionHeaders[i]);
        if(sectionHeaders[i].sectionKind == kPEFLoaderSection)
            loaderHeader = &sectionHeaders[i];
    }

    PEFLoaderInfoHeader *loaderInfoHeader
        = (PEFLoaderInfoHeader*) (pefptr + loaderHeader->containerOffset);
    eswap(loaderInfoHeader);
    
    uint32_t hashTableSize = 1;
    uint32_t hashTablePower = loaderInfoHeader->exportHashTablePower;
    while(hashTablePower--)
        hashTableSize *= 2;
    
    uint32_t nSymbols = loaderInfoHeader->exportedSymbolCount;
    
    const char *symbols    /* use char pointer to avoid packing issues */
        =    (pefptr    + loaderHeader->containerOffset
                    + loaderInfoHeader->exportHashOffset
                    + hashTableSize * sizeof(PEFExportedSymbolHashSlot)
                    + nSymbols * sizeof(PEFExportedSymbolKey));
    
    const char *stringTable = pefptr
                        + loaderHeader->containerOffset
                        + loaderInfoHeader->loaderStringsOffset;
    /*const char *stringTableEnd = pefptr
                    + loaderHeader->containerOffset
                    + loaderInfoHeader->exportHashOffset;*/
    vector< pair< const char *, uint8_t > > classesAndNamePtrs;
    
    for(uint32_t i=0; i < nSymbols; i++)
    {
        PEFExportedSymbol *sym = (PEFExportedSymbol*) (symbols + 10*i);
        eswap(sym);

        uint8_t symclass = PEFExportedSymbolClass(sym->classAndName);
        uint32_t nameoffset = PEFExportedSymbolNameOffset(sym->classAndName);
        
        const char *nameptr
            = stringTable + nameoffset;
        
        classesAndNamePtrs.push_back( make_pair(nameptr, symclass) );
    }
    std::sort(classesAndNamePtrs.begin(), classesAndNamePtrs.end());
    
    vector< pair<string, uint8_t> > exportedSymbols;
    for(uint32_t i=0; i < nSymbols; i++)
    {
        uint8_t symclass = classesAndNamePtrs[i].second;
        const char *namestart = classesAndNamePtrs[i].first;
        
        string name;
        if(i + 1 < nSymbols)
        {
            const char *nameend = classesAndNamePtrs[i+1].first;
            name = string(namestart,nameend);
        }
        else
            name = string(namestart);
            
        exportedSymbols.push_back( make_pair( name, symclass ) );
    }
    std::sort(exportedSymbols.begin(), exportedSymbols.end());
    
    fs::path    stub_exp(tmpdir / "__stub.exp"),
                stub_s(tmpdir / "__stub.s"),
                stub_o(tmpdir / "__stub.o");

    {
        fs::ofstream expFile(stub_exp);
        fs::ofstream sFile(stub_s);
        sFile << "\t.toc\n";
        for(uint32_t i=0; i< nSymbols; i++)
        {
            string& sym = exportedSymbols[i].first;
            if(exportedSymbols[i].second == kPEFTVectorSymbol)
            {
                expFile << sym << endl;
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
                sFile << "\t.globl " << sym << endl;
                sFile << "\t.csect .data[RW],3" << endl;
                sFile << "\t.align 2" << endl;
                sFile << sym << ':' << endl;
                sFile << "\t.long\t42" << endl;
            }
        }
        
        //cerr << "Generating: " << name << " -> " << libname << endl;
        RunCommand("powerpc-apple-macos-as", std::vector<std::string> {
                       stub_s.string(), "-o", stub_o.string()
                   });
        RunCommand("powerpc-apple-macos-ld", std::vector<std::string> {
                       "-shared", "--no-check-sections", "-bexport:" + stub_exp.string(),
                       "-o", dest.string(), stub_o.string()
                   });
    }
}

bool MakeImportLibraryMulti(fs::path path, fs::path libname)
{
    ResourceFile resFile;
    bool readSuccess = resFile.read(path.string());

    if (!readSuccess)
    {
        std::cerr << "Could not read input file.\n";
        return false;
    }

    std::vector<char> data(resFile.data.begin(), resFile.data.end());

    char *dataPtr = data.data();
    
    std::vector<CFragMember> members;

    if(data.size() < 8 || std::string(data.begin(), data.begin()+8) != "Joy!peff")
    {
        std::cerr << "Not a PEF shared library. Ignoring.\n";
        return false;
    }
    
    if(resFile.resources.resources.find(ResRef("cfrg",0)) == resFile.resources.resources.end())
    {
        std::cerr << "No 'cfrg' resource found.\n";
        exit(1);
    }

    Resource& cfrgRes = resFile.resources.resources[ResRef("cfrg",0)];

    CFragResource *cfrg = (CFragResource *)cfrgRes.getData().data();
    eswap(cfrg);

    CFragResourceMember *member = &(cfrg -> firstMember);

    for(uint16_t i = 0; i < cfrg->memberCount; i++)
    {
        eswap(member);
        string membername =
            string(member->name+1, member->name+1+member->name[0]);
        members.emplace_back(
                membername,
                member->architecture,
                member->usage,
                dataPtr + member->offset,
                member->length);

        member = (CFragResourceMember*)  (((char*)member) + member->memberSize);
    }

    if(!std::any_of(members.begin(), members.end(), [](const auto& member) {
            return member.architecture == 'pwpc' || member.architecture == '\?\?\?\?';
        }))
    {
        std::cerr << "Does not contain a PowerPC variant. Ignoring.\n";
        return false;
    }

    fs::path tmpdir = libname.parent_path() / fs::unique_path("makeimport-tmp-%%%%-%%%%-%%%%-%%%%");
    fs::create_directory(tmpdir);
    try
    {
        fs::path archiveTmp(tmpdir / "__archive.a");
        std::vector<string> arArguments { "cq", archiveTmp.string() };

        int memberIndex = 0;
        
        for(auto &member : members)
        {
            std::ostringstream memberNameStream;
            
            // classic MacOS shared library names are in MacRoman and
            // may contain wierd characters; the shared library name is used
            // as the file name for the archive member, so there can be problems.
            // 
            // We encode the file name to hex (and add a human readable name).
            // MakePEF contains corresponding decoder logic.
            
            memberNameStream << "imp__";
            
            for(char c : member.name)
            {
                if(isalnum(c))
                    memberNameStream << c;
            }
            memberNameStream << "_";
            for(char c : member.name)
            {
                int cc = (unsigned char) c;
                memberNameStream << std::setw(2) << std::setfill('0') << std::hex
                    << cc;
            }
            memberNameStream << "_" << memberIndex++;
            string memberName = memberNameStream.str();
            
            if(member.usage == 0    /* import library */
                || member.usage == 3 /* stub library */)
                ;
            else if(member.usage == 4 /* weak stub library */)
                memberName += "__weak";
            
            if(verboseFlag)
            {
                char archStr[5];
                archStr[0] = member.architecture >> 24;
                archStr[1] = member.architecture >> 16;
                archStr[2] = member.architecture >> 8;
                archStr[3] = member.architecture;
                archStr[4] = 0;
                std::cerr << memberName << " (" << archStr << ")\n";
            }
            
            if(member.architecture == 'pwpc'
                || member.architecture == '\?\?\?\?')
            {

                fs::path shlib_file(tmpdir / (memberName + ".o"));
                MakeImportLibrary(member.data, member.length,
                                    shlib_file, tmpdir);
                arArguments.push_back(shlib_file.string());
            }
        }

        RunCommand("powerpc-apple-macos-ar", arArguments);
        fs::rename(archiveTmp, libname);
    }
    catch(...)
    {
        fs::remove_all(tmpdir);
        throw;
    }
    fs::remove_all(tmpdir);

    return true;
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
    
    if(!MakeImportLibraryMulti(argv[1], argv[2]))
        return 1;

    close(fd);
    return 0;
}
