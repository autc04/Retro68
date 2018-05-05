#include "Serial.h"
#include "Launcher.h"
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

class SerialStream : public Stream
{
    static const long kReadBufferSize = 4096;
    uint8_t readBuffer[kReadBufferSize];
public:
    int fd;
    int baud;

    virtual void write(const void* p, size_t n) override;

    void wait();

    SerialStream(po::variables_map &options);
    ~SerialStream();
};

class SerialLauncher : public Launcher
{
    SerialStream stream;
    ReliableStream rStream;
    std::vector<char> outputBytes;
    bool upgradeMode = false;
public:
	SerialLauncher(po::variables_map& options);
	virtual ~SerialLauncher();

	virtual bool Go(int timeout = 0);
	virtual void DumpOutput();

private:
    void write(const void *p, size_t n);
    ssize_t read(void * p, size_t n);
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
    : Launcher(options), stream(options), rStream(&stream)
{
    if(options.count("upgrade-server"))
        upgradeMode = true;
}

SerialLauncher::~SerialLauncher()
{
}

ssize_t SerialLauncher::read(void *p0, size_t n)
{
    uint8_t* p = (uint8_t*)p0;
    ssize_t gotBytes = rStream.read(p, n);
    while(gotBytes < n)
    {
        rStream.flushWrite();
        stream.wait();
        gotBytes += rStream.read(p + gotBytes, n - gotBytes);
    }
    return gotBytes;
}

void SerialLauncher::write(const void *p, size_t n)
{
    while(!rStream.readyToWrite())
        stream.wait();
    rStream.write(p, n);
}

bool SerialLauncher::Go(int timeout)
{
    uint32_t tmp;

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

void SerialLauncher::DumpOutput()
{
    std::cout.write(outputBytes.data(), outputBytes.size());
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
