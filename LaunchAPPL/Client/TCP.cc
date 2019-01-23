#include "TCP.h"
#include "StreamBasedLauncher.h"
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

class TCPStream : public WaitableStream
{

    static const long kReadBufferSize = 4096;
    uint8_t readBuffer[kReadBufferSize];
public:
    int fd;

    virtual void write(const void* p, size_t n) override;

    virtual void wait() override;

    TCPStream(po::variables_map &options);
    ~TCPStream();
};

class TCPLauncher : public StreamBasedLauncher
{
    TCPStream stream;
public:
	TCPLauncher(po::variables_map& options);
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
    : StreamBasedLauncher(options), stream(options)
{
    SetupStream(&stream);
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
