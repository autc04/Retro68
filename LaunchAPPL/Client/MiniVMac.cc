#include "MiniVMac.h"
#include "Launcher.h"
#include "Utilities.h"
#include "BinaryIO.h"
#include "ResourceFile.h"

extern "C" {
#include "hfs.h"
#include <arpa/inet.h>
#define HAVE_MKTIME
#ifdef HAVE_MKTIME
#include <time.h>
#endif
}

#include <iostream>
#include <fstream>
#include <boost/filesystem/fstream.hpp>


#ifdef __APPLE__
#define ResType MacResType
#include <CoreFoundation/CoreFoundation.h>
#endif

namespace fs = boost::filesystem;
using std::string;
using std::vector;

namespace po = boost::program_options;
namespace fs = boost::filesystem;


/* Adapted from http://sebastien.kirche.free.fr/python_stuff/MacOS-aliases.txt */
typedef struct
{
    uint16_t type;                          /* type of data */
    uint16_t size;                          /* length of variable-length data */
    char data[];                            /* actual data */
} VarData;

#pragma pack(push,1)
typedef struct
{
    /* Type Code: alis */
    char userType[4] = {0, 0, 0, 0};        /* for application use, can be zeros */
    uint16_t size;                          /* alias record size, including variable-length data */
    int16_t version = htons(2);             /* alias version, current 2 */
    int16_t type = htons(0);                /* file = 0, directory = 1 */
    char volumeNameSize;                    /* length of volume name */
    char volumeName[27];                    /* volume name padded with null bytes */
    uint32_t volumeCreationDate;            /* volume creation date, seconds since 1904 */
    uint16_t volumeSig = htons(0x4244);     /* volume signature MFS = RW, HFS = BD */
    int16_t volumeType = htons(5);          /* [HD] = 0, Foreign = 1, Floppy: 400K, 800K, 1400K = 2-4, OtherEjectable = 5 */
    int32_t parentDirID;                    /* parent directory ID, 0 for relative searches */
    char fileNameSize;                      /* length of file or directory name */
    char fileName[63];                      /* file or directory name padded with null bytes */
    int32_t fileNum;                        /* file number or directory ID */
    uint32_t fileCreationDate;              /* file or directory creation date, seconds since 1904 */
    char typeCode[4];                       /* file type */
    char creatorCode[4];                    /* file's creator */
    int16_t nlvlFrom = htons(0);            /* next level up from alias, used in relative searches */
    int16_t nlvlTo = htons(0);              /* next level down to target, ditto */
    uint32_t volumeAttr = htonl(0);         /* various flags (locked, ejectable), see link above */
    int16_t volumeFSID = htons(0);          /* file system ID for the volume, 0 for MFS, HFS */
    int16_t unused = htons(0);
    uint32_t unused1 = htonl(0);
    uint32_t unused2 = htonl(0);
    VarData vdata[1] = {                    /* variable-length data, see link above */
        {htons(0xFFFF), htons(0)}           /* end of variable-length data marker, length 0 */
    };
} AliasData;
#pragma pack(pop)


/* Begin code copied from libhfs/data.c */

# define TIMEDIFF  2082844800UL

static
time_t tzdiff = -1;

/*
 * NAME:	calctzdiff()
 * DESCRIPTION:	calculate the timezone difference between local time and UTC
 */
static
void calctzdiff(void)
{
# ifdef HAVE_MKTIME

  time_t t;
  int isdst;
  struct tm tm;
  const struct tm *tmp;

  time(&t);
  isdst = localtime(&t)->tm_isdst;

  tmp = gmtime(&t);
  if (tmp)
    {
      tm = *tmp;
      tm.tm_isdst = isdst;

      tzdiff = t - mktime(&tm);
    }
  else
    tzdiff = 0;

# else

  tzdiff = 0;

# endif
}

/*
 * NAME:	data->mtime()
 * DESCRIPTION:	convert local time to MacOS time
 */
unsigned long d_mtime(time_t ltime)
{
  if (tzdiff == -1)
    calctzdiff();

  return (unsigned long) (ltime + tzdiff) + TIMEDIFF;
}

/* End code copied from libhfs/data.c */


class MiniVMacLauncher : public Launcher
{
    fs::path imagePath;
    fs::path systemImage;
    fs::path vmacDir;
    fs::path vmacPath;
#ifdef __APPLE__
    bool vmacIsAppBundle;
#endif

    hfsvol *sysvol;
    hfsvol *vol;
    std::unique_ptr<Resources> systemRes;

    void CopySystemFile(const std::string& fn, bool required);
    void ReadSystemResources(const std::string& systemFileName);
    uint16_t GetSystemVersion();
    std::string FindFolder(const std::string& folderType);
    void MakeAlias(const std::string& dest, const std::string& src);
    fs::path ConvertImage(const fs::path& path);
public:
    MiniVMacLauncher(po::variables_map& options);
    virtual ~MiniVMacLauncher();

    virtual bool Go(int timeout = 0);
    virtual void DumpOutput();
};


/*
 * Recursive directory copy from https://stackoverflow.com/a/39146566
 */ 
#ifdef __APPLE__
static void copyDirectoryRecursively(const fs::path& sourceDir, const fs::path& destinationDir)
{
    if (!fs::exists(sourceDir) || !fs::is_directory(sourceDir))
    {
        throw std::runtime_error("Source directory " + sourceDir.string() + " does not exist or is not a directory");
    }
    if (fs::exists(destinationDir))
    {
        throw std::runtime_error("Destination directory " + destinationDir.string() + " already exists");
    }
    if (!fs::create_directory(destinationDir))
    {
        throw std::runtime_error("Cannot create destination directory " + destinationDir.string());
    }

    for (const auto& dirEnt : fs::recursive_directory_iterator{sourceDir})
    {
        auto path = dirEnt.path();
        auto relativePathStr = path.string().substr(sourceDir.string().size());
        auto dst = destinationDir / relativePathStr;

        if(fs::is_directory(path))
            fs::create_directory(dst);
        else
            fs::copy_file(path, dst);
    }
}
#endif

fs::path MiniVMacLauncher::ConvertImage(const fs::path& path)
{
    fs::ifstream in(path);
    
    in.seekg(0x40);
    uint32_t diskCopyLength = longword(in);

    in.seekg(0x52);
    uint16_t diskCopySig = word(in);

    //in.seekg(1024);
    //uint16_t rawHFSSig = word(in);

    in.seekg(0x54 + 1024);
    uint16_t diskCopyHFSSig = word(in);

    in.seekg(0, std::ios::end);
    uint32_t actualSize = in.tellg();

    if(diskCopySig == 0x0100 && actualSize == diskCopyLength + 0x54
        && diskCopyLength % 512 == 0 && diskCopyHFSSig == 0x4244)
    {
        auto outPath = tempDir / fs::unique_path();
        
        fs::ofstream out(outPath);

        in.seekg(0x54);

        char buf[4096];

        while(in.read(buf, sizeof(buf)), in.gcount() > 0)
            out.write(buf, in.gcount());

        return outPath;
    }
    else
        return path;
}


MiniVMacLauncher::MiniVMacLauncher(po::variables_map &options)
    : Launcher(options),
      sysvol(NULL), vol(NULL)
{
    vmacDir = fs::absolute( options["minivmac-dir"].as<std::string>() );
    vmacPath = fs::absolute( options["minivmac-path"].as<std::string>(), vmacDir );

    fs::path dataDir;
#ifdef __APPLE__
    vmacIsAppBundle = vmacPath.extension().string() == ".app";
    if(vmacIsAppBundle)
    {
        dataDir = tempDir / "minivmac.app" / "Contents" / "mnvm_dat";
    }
    else
#endif
    {
        dataDir = tempDir;
    }
    imagePath = dataDir / "disk1.dsk";

    systemImage = fs::absolute(options["system-image"].as<std::string>(), vmacDir);
    systemImage = ConvertImage(systemImage);

    std::vector<unsigned char> bootblock1(1024);
    fs::ifstream(systemImage).read((char*) bootblock1.data(), 1024);

    if(bootblock1[0] != 'L' || bootblock1[1] != 'K' || bootblock1[0xA] > 15)
        throw std::runtime_error("Not a bootable Mac disk image: " + systemImage.string());

    sysvol = hfs_mount(systemImage.string().c_str(),0, HFS_MODE_RDONLY);
    assert(sysvol);
    hfsvolent ent;
    hfs_vstat(sysvol, &ent);
    hfs_setcwd(sysvol, ent.blessed);

    string systemFileName(bootblock1.begin() + 0xB, bootblock1.begin() + 0xB + bootblock1[0xA]);
    ReadSystemResources(systemFileName);
    uint16_t sysver = GetSystemVersion();

    bool usesAutQuit7 = (sysver >= 0x700);
    std::string optionsKey = usesAutQuit7 ? "autquit7-image" : "autoquit-image";
    if(options.count(optionsKey) == 0)
    {
        std::ostringstream str;
        str << "'" << optionsKey << "' not configured for Mini vMac and System version " << (sysver >> 8); 
        throw std::runtime_error(str.str());
    }

    fs::path autoquitImage = fs::absolute(options[optionsKey].as<std::string>(), vmacDir);
    autoquitImage = ConvertImage(autoquitImage);

    /*
        Copy over the entire Mini vMac program.
        Mini vMac looks for ROM (vMac.ROM) and disk images (disk1.dsk)
        in the directory next to its binary or in the case of the Mac
        version in the mnvm_dat directory in the Contents directory in
        the app bundle.
        The Mac version also ignores command line arguments.
        Having our own copy in our temp directory is just simpler.
        It is five times smaller than System 6, so this really does not
        matter.
    */
    fs::path vmacCopy;
#ifdef __APPLE__
    if(vmacIsAppBundle)
    {
        vmacCopy = tempDir / "minivmac.app";
        copyDirectoryRecursively(vmacPath, vmacCopy);
        vmacPath = vmacCopy;
        boost::filesystem::create_directories(dataDir);
    }
    else
#endif
    {
        vmacCopy = tempDir / "minivmac";
        fs::copy(vmacPath, vmacCopy);
        vmacPath = vmacCopy;
    }

    int size = 5000*1024;

    fs::ofstream(imagePath, std::ios::binary | std::ios::trunc).seekp(size-1).put(0);
    hfs_format(imagePath.string().c_str(), 0, 0, "SysAndApp", 0, NULL);

    if(!usesAutQuit7)
    {
        std::string finderName = std::string("AutoQuit");
        bootblock1[0x1A] = finderName.size();
        memcpy(&bootblock1[0x1B], finderName.c_str(), finderName.size());
        bootblock1[0x5A] = 3;
        memcpy(&bootblock1[0x5B],"App", 3);
    }
    fs::fstream(imagePath, std::ios::in | std::ios::out | std::ios::binary)
            .write((const char*) bootblock1.data(), 1024);


    vol = hfs_mount(imagePath.string().c_str(), 0, HFS_MODE_RDWR);
    assert(vol);

    hfs_vstat(vol, &ent);
    ent.blessed = hfs_getcwd(vol);
    hfs_vsetattr(vol, &ent);



    CopySystemFile(systemFileName, true);
    string debuggerFileName(bootblock1.begin() + 0x2B, bootblock1.begin() + 0x2B + bootblock1[0x2A]);
    CopySystemFile(debuggerFileName, false);

    if (usesAutQuit7)
    {
        string finderFileName(bootblock1.begin() + 0x1B, bootblock1.begin() + 0x1B + bootblock1[0x1A]);
        CopySystemFile(finderFileName, true);
        CopySystemFile("System 7.5 Update", false);
        std::string extensionsFolderName = FindFolder("extn");
        if(hfs_chdir(sysvol, extensionsFolderName.c_str()) != -1)
        {
            hfs_mkdir(vol, extensionsFolderName.c_str());
            if(hfs_chdir(vol, extensionsFolderName.c_str()) != -1)
            {
                CopySystemFile("Appearance Extension", false);
                CopySystemFile("System 7 Tuner", false);
                CopySystemFile("System Update", false);
                hfs_chdir(vol, "::");
            }
            hfs_chdir(sysvol, "::");
        }
    }
    else
    {
        CopySystemFile("32-Bit QuickDraw", false);
        CopySystemFile("TrueType\xaa 1.0", false);
    }

    {
        std::ostringstream rsrcOut;
        app.resources.writeFork(rsrcOut);
        std::string rsrc = rsrcOut.str();
        std::string& data = app.data;

        hfsfile *file = hfs_create(vol, "App","APPL","????");
        hfs_setfork(file, 0);
        hfs_write(file, data.data(), data.size());
        hfs_setfork(file, 1);
        hfs_write(file, rsrc.data(), rsrc.size());
        hfs_close(file);
    }

    hfs_umount(sysvol);
    sysvol = hfs_mount(autoquitImage.string().c_str(),0, HFS_MODE_RDONLY);
    if(!sysvol)
        throw std::runtime_error("Cannot open disk image: " + autoquitImage.string());
    assert(sysvol);
    if (usesAutQuit7)
    {
        CopySystemFile("AutQuit7", true);
        MakeAlias("AutQuit7 alias", "AutQuit7");
        std::string startupItemsFolderName = FindFolder("strt");
        hfs_mkdir(vol, startupItemsFolderName.c_str());
        hfs_rename(vol, "AutQuit7 alias", startupItemsFolderName.c_str());
    }
    else
    {
        CopySystemFile("AutoQuit", true);
    }

    {
        hfsfile *file = hfs_create(vol, "out", "TEXT", "MPS ");
        hfs_close(file);
    }
    hfs_umount(sysvol); sysvol = NULL;
    hfs_umount(vol); vol = NULL;

    fs::path romFile = fs::absolute( options["minivmac-rom"].as<std::string>(), vmacDir );
    
    fs::create_symlink(
        romFile,
        dataDir / romFile.filename() );

    if(romFile.filename() != "vMac.ROM")
    {
        // If the ROM file is not named vMac.ROM, this might be for two different
        // reasons.
        // 1. The user didn't bother to rename it to the correct "vMac.ROM"
        // 2. The user is using a version of Mini vMac that is not emulating
        //    a Macintosh Plus and has named the ROM file accordingly.
    
        // To be on the safe side, provide both the user-specified name and
        // the standard vMac.ROM.
    
        fs::create_symlink(
            romFile,
            dataDir / "vMac.ROM" );
    }
}

MiniVMacLauncher::~MiniVMacLauncher()
{
    if(sysvol)
        hfs_umount(sysvol);
    if(vol)
        hfs_umount(vol);

}

void MiniVMacLauncher::CopySystemFile(const std::string &fn, bool required)
{
    hfsdirent fileent;
    if(hfs_stat(sysvol, fn.c_str(), &fileent) < 0)
    {
        if(required)
            throw std::runtime_error(string("File ") + fn + " not found in disk image");
        else
            return;
    }
    hfsfile *in = hfs_open(sysvol, fn.c_str());
    hfsfile *out = hfs_create(vol, fn.c_str(), fileent.u.file.type,fileent.u.file.creator);

    std::vector<uint8_t> buffer(std::max(fileent.u.file.dsize, fileent.u.file.rsize));
    hfs_setfork(in, 0);
    hfs_setfork(out, 0);
    hfs_read(in, buffer.data(), fileent.u.file.dsize);
    hfs_write(out, buffer.data(), fileent.u.file.dsize);
    hfs_setfork(in, 1);
    hfs_setfork(out, 1);
    hfs_read(in, buffer.data(), fileent.u.file.rsize);
    hfs_write(out, buffer.data(), fileent.u.file.rsize);
    hfs_close(in);
    hfs_close(out);
}

void MiniVMacLauncher::MakeAlias(const std::string& dest, const std::string& src)
{
    hfsdirent ent;
    hfsvolent vent;

    hfs_stat(vol, src.c_str(), &ent);
    hfs_vstat(vol, &vent);

    AliasData alias;
    alias.size = htons(sizeof(AliasData));
    alias.volumeNameSize = strlen(vent.name);
    memcpy(&(alias.volumeName), vent.name, alias.volumeNameSize);
    memset(&(alias.volumeName[0]) + alias.volumeNameSize, 0, 27 - alias.volumeNameSize);
    alias.volumeCreationDate = htonl(d_mtime(vent.crdate));
    alias.parentDirID = htonl(ent.parid);
    alias.fileNameSize = strlen(ent.name);
    memcpy(&(alias.fileName), ent.name, alias.fileNameSize);
    memset(&(alias.fileName[0]) + alias.fileNameSize, 0, 63 - alias.fileNameSize);
    alias.fileNum = htonl(ent.cnid);
    alias.fileCreationDate = htonl(d_mtime(ent.crdate));
    memcpy(&(alias.typeCode), ent.u.file.type, 4);
    memcpy(&(alias.creatorCode), ent.u.file.creator, 4);

    std::ostringstream roalias;
    Resources res;
    res.addResource(Resource("alis", 0, std::string((char*)&alias, sizeof(AliasData))));
    res.writeFork(roalias);
    std::string ralias = roalias.str();

    hfsfile *falias = hfs_create(vol, dest.c_str(), "adrp", ent.u.file.creator);
    hfs_setfork(falias, 1);
    hfs_write(falias, ralias.data(), ralias.size());
    hfs_fstat(falias, &ent);
    ent.fdflags |= HFS_FNDR_ISALIAS;
    hfs_fsetattr(falias, &ent);
    hfs_close(falias);
}


void MiniVMacLauncher::ReadSystemResources(const std::string& systemFileName)
{
    hfsdirent fileent;
    hfs_stat(sysvol, systemFileName.c_str(), &fileent);
    hfsfile* system = hfs_open(sysvol, systemFileName.c_str());
    std::vector<uint8_t> buffer(fileent.u.file.rsize);
    hfs_setfork(system, 1);
    hfs_read(system, buffer.data(), fileent.u.file.rsize);
    hfs_close(system);
    std::istringstream systemResStream(std::string((char*)buffer.data(), buffer.size()));
    systemRes = std::make_unique<Resources>(systemResStream);
}


uint16_t MiniVMacLauncher::GetSystemVersion()
{
    Resource vers = systemRes->resources[ResRef('vers', 1)];
    return (uint16_t)vers.getData()[0] << 8 | vers.getData()[1];
}


std::string MiniVMacLauncher::FindFolder(const std::string& folderType)
{
    Resource fld = systemRes->resources[ResRef('fld#', 0)];
    size_t i = 0;
    while (i < fld.getData().size())
    {
        unsigned char len = fld.getData()[i + 7];
        if (fld.getData().substr(i, 4) == folderType)
            return fld.getData().substr(i + 8, len);
        i += 8 + len + len % 2;
    }
    return "unknown";
}


bool MiniVMacLauncher::Go(int timeout)
{
    fs::current_path(tempDir);
#ifdef __APPLE__
    if(vmacIsAppBundle)
        return ChildProcess("open", {"-nWa", vmacPath.string()}, timeout) == 0;
#endif
    return ChildProcess(vmacPath.string(), {}, timeout) == 0;
}

void MiniVMacLauncher::DumpOutput()
{
    vol = hfs_mount(imagePath.string().c_str(), 0, HFS_MODE_RDONLY);
    hfsdirent fileent;
    int statres = hfs_stat(vol, "out", &fileent);
    if(statres)
        return;
    
    hfsfile *out = hfs_open(vol, "out");
    if(!out)
        return;
    std::vector<char> buffer(fileent.u.file.dsize);
    hfs_setfork(out, 0);
    hfs_read(out, buffer.data(), fileent.u.file.dsize);
    hfs_close(out);
    std::cout << string(buffer.begin(), buffer.end());
    hfs_umount(vol); vol = NULL;
}


void MiniVMac::GetOptions(options_description &desc)
{
    desc.add_options()
            ("minivmac-dir", po::value<std::string>(),"directory containing vMac.ROM")
            ("minivmac-path", po::value<std::string>()->default_value("./minivmac"),"relative path to minivmac")
            ("minivmac-rom", po::value<std::string>()->default_value("./vMac.ROM"),"minivmac ROM file")
            ("system-image", po::value<std::string>(),"path to disk image with system")
            ("autoquit-image", po::value<std::string>(),"path to autoquit disk image, available from the minivmac web site")
            ("autquit7-image", po::value<std::string>(),"path to autquit7 disk image, available from the minivmac web site")
            ;
}

bool MiniVMac::CheckOptions(variables_map &options)
{
    return options.count("minivmac-path") != 0
        && options.count("minivmac-dir") != 0
        && options.count("minivmac-rom") != 0
        && options.count("system-image") != 0
        && options.count("autoquit-image") + options.count("autquit7-image") > 0;
}

std::unique_ptr<Launcher> MiniVMac::MakeLauncher(variables_map &options)
{
    return std::unique_ptr<Launcher>(new MiniVMacLauncher(options));
}
