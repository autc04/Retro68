#include "StreamBasedLauncher.h"
#include "Stream.h"
#include "ServerProtocol.h"
#include <iostream>

StreamBasedLauncher::StreamBasedLauncher(boost::program_options::variables_map &options)
    : Launcher(options)
{
    if(options.count("upgrade-server"))
        upgradeMode = true;
}

StreamBasedLauncher::~StreamBasedLauncher()
{
}

void StreamBasedLauncher::SetupStream(WaitableStream* aStream, Stream* wrapped)
{
    this->stream = aStream;
    this->rStream = wrapped ? wrapped : aStream;
}

ssize_t StreamBasedLauncher::read(void *p0, size_t n)
{
    uint8_t* p = (uint8_t*)p0;
    size_t gotBytes = rStream->read(p, n);
    while(gotBytes < n)
    {
        rStream->flushWrite();
        stream->wait();
        gotBytes += rStream->read(p + gotBytes, n - gotBytes);
    }
    return gotBytes;
}

void StreamBasedLauncher::write(const void *p, size_t n)
{
    while(!rStream->readyToWrite())
        stream->wait();
    rStream->write(p, n);
}

bool StreamBasedLauncher::Go(int timeout)
{
    uint32_t tmp;

    {
        RemoteCommand cmd = upgradeMode ? RemoteCommand::upgradeLauncher : RemoteCommand::launchApp;
        write(&cmd, 1);

        write(std::string(app.type).data(), 4);
        write(std::string(app.creator).data(), 4);
        
        std::ostringstream rsrcOut;
        app.resources.writeFork(rsrcOut);
        std::string rsrc = rsrcOut.str();
        std::string& data = app.data;
        std::cerr << "Transferring " << (data.size() + rsrc.size() + 1023) / 1024 << " KB." << std::endl;

        tmp = htonl(data.size());
        write(&tmp, 4);
        tmp = htonl(rsrc.size());
        write(&tmp, 4);

        write(data.data(), data.size());
        write(rsrc.data(), rsrc.size());
    }

    while(!rStream->allDataArrived())
        stream->wait();
    std::cerr << "Running Appliation..." << std::endl;
    read(&tmp, 4);
    uint32_t result = ntohl(tmp);
    std::cerr << "Finished (result = " << result << ")." << std::endl;
    
    if(result == 0)
    {
        read(&tmp, 4);
        uint32_t size = ntohl(tmp);
        outputBytes.resize(size);
        if(size > 0)
            read(outputBytes.data(), size);
    }

    return result == 0;
}

void StreamBasedLauncher::DumpOutput()
{
    std::cout.write(outputBytes.data(), outputBytes.size());
}
