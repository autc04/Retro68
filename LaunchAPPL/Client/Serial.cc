#include "Serial.h"
#include "Launcher.h"
#include "Utilities.h"
#include "Stream.h"
#include "ReliableStream.h"
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <arpa/inet.h>
#include <poll.h>

namespace po = boost::program_options;


class SerialStream : public Stream
{
    static const long kReadBufferSize = 4096;
    uint8_t readBuffer[kReadBufferSize];
public:
    int fd;

    virtual void write(const void* p, size_t n) override;

    void wait();

    SerialStream(po::variables_map &options);
    ~SerialStream();
};

class SerialLauncher : public Launcher
{
    SerialStream stream;
    ReliableStream rStream;
public:
	SerialLauncher(po::variables_map& options);
	virtual ~SerialLauncher();

	virtual bool Go(int timeout = 0);

private:
    void write(const void *p, size_t n) { rStream.write(p, n); }
    ssize_t read(void * p, size_t n);
};


SerialStream::SerialStream(po::variables_map &options)
{
    std::string port = options["serial-port"].as<std::string>();
    fd = open(port.c_str(), O_RDWR | O_NOCTTY | O_NDELAY );
    if(fd < 0)
        throw std::runtime_error("Cannot open serial port.\n");

    struct termios tios;
    tcgetattr(fd,&tios);

    tios.c_cflag = B19200 | CRTSCTS | CS8 | CLOCAL | CREAD;
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
    : Launcher(options), stream(options), rStream(stream)
{
}

SerialLauncher::~SerialLauncher()
{
}

ssize_t SerialLauncher::read(void *p, size_t n)
{
    ssize_t available = rStream.read(p, n);
    while(!available)
    {
        rStream.flushWrite();
        stream.wait();
        available = rStream.read(p, n);
    }
    return available;
}

bool SerialLauncher::Go(int timeout)
{
    uint32_t tmp;

    {
        std::ostringstream rsrcOut;
        app.resources.writeFork(rsrcOut);
        std::string rsrc = rsrcOut.str();
        std::string& data = app.data;

        tmp = htonl(data.size());
        write(&tmp, 4);
        tmp = htonl(rsrc.size());
        write(&tmp, 4);

        write(data.data(), data.size());
        write(rsrc.data(), rsrc.size());
    }

    read(&tmp, 4);
    tmp = ntohl(tmp);

    return false;
}


void Serial::GetOptions(options_description &desc)
{
    desc.add_options()
        ("serial-port", po::value<std::string>()->default_value("/dev/ttyUSB0"), "serial port to use")
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
