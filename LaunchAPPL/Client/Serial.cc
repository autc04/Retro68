#include "Serial.h"
#include "StreamBasedLauncher.h"
#include "Utilities.h"
#include "Stream.h"
#include "ReliableStream.h"
#include "ServerProtocol.h"
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <arpa/inet.h>
#include <poll.h>
#include <chrono>
#include <iostream>

namespace po = boost::program_options;
using namespace std::literals::chrono_literals;

class SerialStream : public WaitableStream
{
    static const long kReadBufferSize = 4096;
    uint8_t readBuffer[kReadBufferSize];
public:
    int fd;
    int baud;

    virtual void write(const void* p, size_t n) override;

    virtual void wait() override;

    SerialStream(po::variables_map &options);
    ~SerialStream();
};

class SerialLauncher : public StreamBasedLauncher
{
    SerialStream stream;
    ReliableStream rStream;
public:
	SerialLauncher(po::variables_map& options);
};


SerialStream::SerialStream(po::variables_map &options)
{
    std::string port = options["serial-port"].as<std::string>();
    baud = options["serial-baud"].as<int>();
    fd = open(port.c_str(), O_RDWR | O_NOCTTY | O_NDELAY );
    if(fd < 0)
        throw std::runtime_error("Cannot open serial port.\n");

    struct termios tios;
    tcgetattr(fd,&tios);

    tios.c_cflag = CRTSCTS | CS8 | CLOCAL | CREAD;

    switch(baud)
    {
        case 9600:      tios.c_cflag |= B9600; break;
        case 19200:     tios.c_cflag |= B19200; break;
        case 38400:     tios.c_cflag |= B38400; break;
        case 57600:     tios.c_cflag |= B57600; break;
        case 115200:    tios.c_cflag |= B115200; break;
        case 230400:    tios.c_cflag |= B230400; break;
        default:
            throw std::runtime_error("Unsupported baud rate.\n");
    }

    tios.c_iflag = 0;//IGNPAR | ICRNL;
    tios.c_lflag = 0;
    tios.c_oflag = 0;
    tios.c_cc[VTIME]    = 0;   /* inter-character timer unused */
    tios.c_cc[VMIN]     = 1;   /* blocking read until 1 chars received */
    tcsetattr(fd,TCSANOW,&tios);
    usleep(500000);
}
SerialStream::~SerialStream()
{
    tcdrain(fd);
    usleep(500000);
    close(fd);
}

void SerialStream::write(const void* p, size_t n)
{
    while(n)
    {
        struct pollfd pfd;
        pfd.fd = fd;
        pfd.events = POLLOUT;
        pfd.revents = 0;
        poll(&pfd, 1, 1000);
        if(pfd.revents & POLLOUT)
        {
            ssize_t written = ::write(fd, p, n);
            if(written > 0)
            {
                p = (const void*) ( (const char*)p + written );
                n -= written;
            }
        }
    }
}

void SerialStream::wait()
{
    struct pollfd pfd;
    pfd.fd = fd;
    pfd.events = POLLIN;
    pfd.revents = 0;
    poll(&pfd, 1, 1000);
    if(pfd.revents & POLLIN)
    {
        ssize_t n = ::read(fd, readBuffer, kReadBufferSize);
        if(n > 0)
        {
            notifyReceive(readBuffer, n);
        }
    }
}

SerialLauncher::SerialLauncher(po::variables_map &options)
    : StreamBasedLauncher(options), stream(options), rStream(&stream)
{
    SetupStream(&stream, &rStream);

    do
    {
        rStream.reset(1);
        std::cerr << "Connecting... (" << stream.baud << " baud)" << std::endl;
        using clock = std::chrono::steady_clock;
        auto startTime = clock::now();
        while(!rStream.resetResponseArrived() && clock::now() - startTime < 5s)
            stream.wait();
    } while(!rStream.resetResponseArrived());

    std::cerr << "Connected." << std::endl;
}

void Serial::GetOptions(options_description &desc)
{
    desc.add_options()
        ("serial-port", po::value<std::string>()->default_value("/dev/ttyUSB0"), "serial port to use")
        ("serial-baud", po::value<int>()->default_value(19200), "serial port speed")
        ;
}

bool Serial::CheckOptions(variables_map &options)
{
	return true;
}

std::unique_ptr<Launcher> Serial::MakeLauncher(variables_map &options)
{
	return std::unique_ptr<Launcher>(new SerialLauncher(options));
}
