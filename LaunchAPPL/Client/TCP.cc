#include "TCP.h"
#include "Launcher.h"
#include "Utilities.h"
#include "Stream.h"
#include "ServerProtocol.h"
#include <termios.h>
#include <arpa/inet.h>
#include <chrono>
#include <iostream>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

namespace po = boost::program_options;
using namespace std::literals::chrono_literals;

class TCPStream : public Stream
{

    static const long kReadBufferSize = 4096;
    uint8_t readBuffer[kReadBufferSize];
public:
    int fd;

    virtual void write(const void* p, size_t n) override;

    void wait();

    TCPStream(po::variables_map &options);
    ~TCPStream();
};

class TCPLauncher : public Launcher
{
    TCPStream stream;
    TCPStream& rStream = stream;
    std::vector<char> outputBytes;
    bool upgradeMode = false;
public:
	TCPLauncher(po::variables_map& options);
	virtual ~TCPLauncher();

	virtual bool Go(int timeout = 0);
	virtual void DumpOutput();

private:
    void write(const void *p, size_t n);
    ssize_t read(void * p, size_t n);
};


TCPStream::TCPStream(po::variables_map &options)
{
    fd = socket(AF_INET , SOCK_STREAM , 0);
    struct sockaddr_in addr;
    addr.sin_addr.s_addr = inet_addr(options["tcp-address"].as<std::string>().c_str());
    addr.sin_family = AF_INET;
    addr.sin_port = htons( 1984 );
 
    //Connect to remote server
    int result = connect(fd , (struct sockaddr *)&addr , sizeof(addr));
    if(result < 0)
        perror("connect");
}
TCPStream::~TCPStream()
{
    close(fd);
    // a little hack: delay 0.1 seconds so that LaunchAPPLServer has time to reopen the port
    usleep(100000);
}

void TCPStream::write(const void* p, size_t n)
{
    ::write(fd, p, n);
}

void TCPStream::wait()
{
    ssize_t n = ::read(fd, readBuffer, kReadBufferSize);
    if(n > 0)
        notifyReceive(readBuffer, n);
}


TCPLauncher::TCPLauncher(po::variables_map &options)
    : Launcher(options), stream(options)
{
    if(options.count("upgrade-server"))
        upgradeMode = true;
}

TCPLauncher::~TCPLauncher()
{
}

ssize_t TCPLauncher::read(void *p0, size_t n)
{
    uint8_t* p = (uint8_t*)p0;
    size_t gotBytes = rStream.read(p, n);
    while(gotBytes < n)
    {
        rStream.flushWrite();
        stream.wait();
        gotBytes += rStream.read(p + gotBytes, n - gotBytes);
    }
    return gotBytes;
}

void TCPLauncher::write(const void *p, size_t n)
{
    while(!rStream.readyToWrite())
        stream.wait();
    rStream.write(p, n);
}

bool TCPLauncher::Go(int timeout)
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
        std::cerr << "Transfering " << (data.size() + rsrc.size() + 1023) / 1024 << " KB." << std::endl;

        tmp = htonl(data.size());
        write(&tmp, 4);
        tmp = htonl(rsrc.size());
        write(&tmp, 4);

        write(data.data(), data.size());
        write(rsrc.data(), rsrc.size());
    }
    while(!rStream.allDataArrived())
        stream.wait();
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

void TCPLauncher::DumpOutput()
{
    std::cout.write(outputBytes.data(), outputBytes.size());
}

void TCP::GetOptions(options_description &desc)
{
    desc.add_options()
        ("tcp-address", po::value<std::string>(), "IP address of Mac")
        ;
}

bool TCP::CheckOptions(variables_map &options)
{
	return options.count("tcp-address") != 0;
}

std::unique_ptr<Launcher> TCP::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new TCPLauncher(options));
}
