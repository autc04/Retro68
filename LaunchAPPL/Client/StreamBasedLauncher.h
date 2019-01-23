#pragma once
#include "Launcher.h"
#include <vector>

class Stream;
class WaitableStream;

class StreamBasedLauncher : public Launcher
{
    WaitableStream *stream;
    Stream *rStream;
    std::vector<char> outputBytes;
    bool upgradeMode = false;
public:
	StreamBasedLauncher(boost::program_options::variables_map& options);
	virtual ~StreamBasedLauncher();

	virtual bool Go(int timeout = 0);
	virtual void DumpOutput();

protected:
    void SetupStream(WaitableStream* aStream, Stream* wrapped = nullptr);
private:
    void write(const void *p, size_t n);
    ssize_t read(void * p, size_t n);
};
