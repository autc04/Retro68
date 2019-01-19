#include "MiniVMac.h"
#include "Launcher.h"
#include "Utilities.h"
#include "BinaryIO.h"

extern "C" {
#include "hfs.h"
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

class MiniVMacLauncher : public Launcher
{
    fs::path imagePath;
    fs::path systemImage;
    fs::path vmacDir;
    fs::path vmacPath;

    hfsvol *sysvol;
    hfsvol *vol;

    void CopySystemFile(const std::string& fn, bool required);
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
    imagePath = tempDir / "disk1.dsk";
    vmacDir = fs::absolute( options["minivmac-dir"].as<std::string>() );
    vmacPath = fs::absolute( options["minivmac-path"].as<std::string>(), vmacDir );

    systemImage = fs::absolute(options["system-image"].as<std::string>(), vmacDir);
    fs::path autoquitImage = fs::absolute(options["autoquit-image"].as<std::string>(), vmacDir);

    systemImage = ConvertImage(systemImage);
    autoquitImage = ConvertImage(autoquitImage);

    std::vector<unsigned char> bootblock1(1024);
    fs::ifstream(systemImage).read((char*) bootblock1.data(), 1024);

    if(bootblock1[0] != 'L' || bootblock1[1] != 'K' || bootblock1[0xA] > 15)
        throw std::runtime_error("Not a bootable Mac disk image: " + systemImage.string());

    string systemFileName(bootblock1.begin() + 0xB, bootblock1.begin() + 0xB + bootblock1[0xA]);


    int size = 5000*1024;

    fs::ofstream(imagePath, std::ios::binary | std::ios::trunc).seekp(size-1).put(0);
    hfs_format(imagePath.string().c_str(), 0, 0, "SysAndApp", 0, NULL);

    {
        bootblock1[0x1A] = 8;
        memcpy(&bootblock1[0x1B],"AutoQuit", 8);
        bootblock1[0x5A] = 3;
        memcpy(&bootblock1[0x5B],"App", 3);

        fs::fstream(imagePath, std::ios::in | std::ios::out | std::ios::binary)
                .write((const char*) bootblock1.data(), 1024);
    }


    vol = hfs_mount(imagePath.string().c_str(), 0, HFS_MODE_RDWR);
    assert(vol);

    sysvol = hfs_mount(systemImage.string().c_str(),0, HFS_MODE_RDONLY);
    assert(sysvol);
    hfsvolent ent;
    hfs_vstat(sysvol, &ent);
    hfs_setcwd(sysvol, ent.blessed);


    hfs_vstat(vol, &ent);
    ent.blessed = hfs_getcwd(vol);
    hfs_vsetattr(vol, &ent);



    CopySystemFile(systemFileName, true);
    CopySystemFile("MacsBug", false);

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
    CopySystemFile("AutoQuit", true);

    {
        hfsfile *file = hfs_create(vol, "out", "TEXT", "MPS ");
        hfs_close(file);
    }

    hfs_umount(sysvol); sysvol = NULL;
    hfs_umount(vol); vol = NULL;

    fs::path romFile = fs::absolute( options["minivmac-rom"].as<std::string>(), vmacDir );
    
    fs::create_symlink(
        romFile,
        tempDir / romFile.filename() );

    if(romFile.filename() != "vMac.ROM")
    {
        // If the ROM file is not named vMac.ROM, this might be for two different
        // reasons.
        // 1. The user didn't bother to rename it to the correct "vMac.ROM"
        // 2. The user is using a MacII version of Mini vMac and has named the
        //    ROM file MacII.ROM on purpose.
    
        // To be on the safe side, provide both the user-specified name and
        // the standard vMac.ROM.
    
        fs::create_symlink(
            romFile,
            tempDir / romFile.filename() );
    }

    /*
        Finally, we copy over the entire Mini vMac binary.
        Mini vMac looks for ROM (vMac.ROM) and disk images (disk1.dsk)
        in the directory next to its binary.
        The Mac version also ignores command line arguments.
        Having our own copy in our temp directory is just simpler.
        It is five times smaller than System 6, so this really does not
        matter.
    */
#ifdef __APPLE__
    /*
        A special case for the Mac:
        We are probably dealing with an entire application bundle.
    */
    if(vmacPath.extension().string() == ".app")
    {
        fs::path appPath = tempDir / "minivmac.app";
        
        copyDirectoryRecursively( vmacPath, appPath );
        
        // The following 30 lines of code should rather be written as:
        //   vmacPath = appPath / "Contents" / "MacOS" / Bundle(appPath).getExecutablePath();
        // But this is CoreFoundation, so it's a tiny little bit more verbose:
        
        CFStringRef appPathCF
            = CFStringCreateWithCString(
                kCFAllocatorDefault, appPath.string().c_str(), kCFStringEncodingUTF8);
        CFURLRef bundleURL = CFURLCreateWithFileSystemPath(
            kCFAllocatorDefault, appPathCF, kCFURLPOSIXPathStyle, true);
        
        CFBundleRef bundle = CFBundleCreate( kCFAllocatorDefault, bundleURL );
        
        CFURLRef executableURL = CFBundleCopyExecutableURL(bundle);
        
        CFStringRef executablePath = CFURLCopyFileSystemPath(executableURL, kCFURLPOSIXPathStyle);
        
        if(const char *ptr = CFStringGetCStringPtr(executablePath, kCFURLPOSIXPathStyle))
        {
            vmacPath = string(ptr);
        }
        else
        {
            vector<char> buffer(
                CFStringGetMaximumSizeForEncoding(
                    CFStringGetLength(executablePath), kCFStringEncodingUTF8) + 1);
            CFStringGetCString(executablePath, buffer.data(), buffer.size(), kCFStringEncodingUTF8);
            vmacPath = string(buffer.data());
        }
        vmacPath = appPath / "Contents" / "MacOS" / vmacPath;
        
        CFRelease(appPathCF);
        CFRelease(bundleURL);
        CFRelease(bundle);
        CFRelease(executableURL);
        CFRelease(executablePath);
    }
    else
#endif
    {
        fs::copy(vmacPath, tempDir / "minivmac");
        vmacPath = tempDir / "minivmac";
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


bool MiniVMacLauncher::Go(int timeout)
{
    fs::current_path(tempDir);
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
            ;
}

bool MiniVMac::CheckOptions(variables_map &options)
{
    return options.count("minivmac-path") != 0
        && options.count("minivmac-dir") != 0
        && options.count("minivmac-rom") != 0
        && options.count("system-image") != 0
        && options.count("autoquit-image") != 0;
}

std::unique_ptr<Launcher> MiniVMac::MakeLauncher(variables_map &options)
{
    return std::unique_ptr<Launcher>(new MiniVMacLauncher(options));
}
