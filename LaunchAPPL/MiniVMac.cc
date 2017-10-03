#include "MiniVMac.h"
#include "Launcher.h"

extern "C" {
#include "hfs.h"
}

#include <iostream>
#include <fstream>
#include <boost/filesystem/fstream.hpp>

namespace fs = boost::filesystem;
using std::string;
using std::vector;

namespace po = boost::program_options;
namespace fs = boost::filesystem;

class MiniVMacLauncher : public Launcher
{
	fs::path imagePath;
	fs::path systemImage;

	hfsvol *sysvol;
	hfsvol *vol;

	void CopySystemFile(const char* fn, const char *dstfn = NULL);
public:
	MiniVMacLauncher(po::variables_map& options);
	virtual ~MiniVMacLauncher();

	virtual bool Go(int timeout = 0);
	virtual void DumpOutput();
};


MiniVMacLauncher::MiniVMacLauncher(po::variables_map &options)
    : Launcher(options, ResourceFile::Format::percent_appledouble),
      sysvol(NULL), vol(NULL)
{
	imagePath = fs::absolute(tempDir / "image.dsk");
	systemImage = fs::absolute(options["system-image"].as<std::string>());
	fs::path autoquitImage = fs::absolute(options["autoquit-image"].as<std::string>());

	sysvol = hfs_mount(systemImage.string().c_str(),0, HFS_MODE_RDONLY);
	assert(sysvol);
	hfsvolent ent;
	hfs_vstat(sysvol, &ent);
	hfs_setcwd(sysvol, ent.blessed);


	int size = 5000*1024;

	fs::ofstream(imagePath, std::ios::binary | std::ios::trunc).seekp(size-1).put(0);
	hfs_format(imagePath.string().c_str(), 0, 0, "SysAndApp", 0, NULL);

	{
		extern unsigned char bootblock[1024];
		std::vector<unsigned char> bootblock1(bootblock, bootblock+1024);

		bootblock1[0x1A] = 8;
		memcpy(&bootblock1[0x1B],"AutoQuit", 8);
		bootblock1[0x5A] = 3;
		memcpy(&bootblock1[0x5B],"App", 3);

		std::fstream(imagePath.string(), std::ios::in | std::ios::out | std::ios::binary)
		        .write((const char*) bootblock1.data(), 1024);
	}


	vol = hfs_mount(imagePath.string().c_str(), 0, HFS_MODE_RDWR);
	assert(vol);

	hfs_vstat(vol, &ent);
	ent.blessed = hfs_getcwd(vol);
	hfs_vsetattr(vol, &ent);



	CopySystemFile("System");
	CopySystemFile("Finder");
	CopySystemFile("MacsBug");

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
	assert(sysvol);
	CopySystemFile("AutoQuit");

	{
		hfsfile *file = hfs_create(vol, "out", "TEXT", "MPS ");
		hfs_close(file);
	}

	hfs_umount(sysvol); sysvol = NULL;
	hfs_umount(vol); vol = NULL;
}

MiniVMacLauncher::~MiniVMacLauncher()
{
	if(sysvol)
		hfs_umount(sysvol);
	if(vol)
		hfs_umount(vol);

}

void MiniVMacLauncher::CopySystemFile(const char *fn, const char *dstfn)
{
	if(!dstfn)
		dstfn = fn;
	hfsdirent fileent;
	if(hfs_stat(sysvol, fn, &fileent) < 0)
		return;
	hfsfile *in = hfs_open(sysvol, fn);
	hfsfile *out = hfs_create(vol, dstfn, fileent.u.file.type,fileent.u.file.creator);

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
	fs::path minivmacdir = fs::absolute( options["minivmac-dir"].as<std::string>() );
	std::string minivmacpath = options["minivmac-path"].as<std::string>();

	fs::current_path(minivmacdir);

	return ChildProcess(minivmacpath, { imagePath.string() }, timeout) == 0;
}

void MiniVMacLauncher::DumpOutput()
{
	sleep(1);
	vol = hfs_mount(imagePath.string().c_str(), 0, HFS_MODE_RDONLY);
	hfsdirent fileent;
	int statres = hfs_stat(vol, "out", &fileent);
	std::cerr << "stat: " << statres << "\n";
	std::cerr << "out: " << fileent.u.file.dsize << " bytes\n";

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
	        ("system-image", po::value<std::string>(),"path to disk image with system")
	        ("autoquit-image", po::value<std::string>(),"path to autoquit disk image, available from the minivmac web site")
	        ;
}

bool MiniVMac::CheckOptions(variables_map &options)
{
	return options.count("minivmac-path") != 0
	    && options.count("minivmac-dir") != 0
	    && options.count("system-image") != 0
	    && options.count("autoquit-image") != 0;
}

std::unique_ptr<Launcher> MiniVMac::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new MiniVMacLauncher(options));
}
