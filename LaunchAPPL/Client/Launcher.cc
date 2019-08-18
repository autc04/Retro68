#include "Launcher.h"
#include <boost/filesystem/fstream.hpp>
#include <iostream>
#include <sstream>


namespace fs = boost::filesystem;
using std::string;
using std::vector;

Launcher::Launcher(boost::program_options::variables_map &options)
    : options(options)
{
    string fn = options["application"].as<std::string>();
    
    if(fn == "-")
    {
        std::stringstream tmp;
        tmp << std::cin.rdbuf();
        if(!app.read(tmp, ResourceFile::Format::macbin))
            throw std::runtime_error("Could not load application from stdin.");
    }
    else
    {
        app.assign(fn);
        if(!app.read())
            throw std::runtime_error("Could not load application file.");
    }
    
    tempDir = fs::absolute(fs::unique_path());
    fs::create_directories(tempDir);

    appPath = tempDir / "Application";
    outPath = tempDir / "out";

    fs::ofstream out(outPath);
}

Launcher::Launcher(boost::program_options::variables_map &options, ResourceFile::Format f)
    : Launcher(options)
{
    app.assign(appPath.string(), f);
    app.write();
}

void Launcher::DumpOutput()
{
    fs::ifstream in(outPath);
    std::cout << in.rdbuf();
}

Launcher::~Launcher()
{
    fs::remove_all(tempDir);
}



