
#include <stdio.h>
#include <Serial.h>
#include <Devices.h>
#include <Events.h>
#include <string.h>

#include <Stream.h>
#include <ReliableStream.h>
#include <Processes.h>

class MacSerialStream : public Stream
{
    static const long kInputBufferSize = 4096;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short outRefNum, inRefNum;
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    MacSerialStream();
    ~MacSerialStream();

    void close();
};

MacSerialStream::MacSerialStream()
{
	OSErr err;
    err = OpenDriver("\p.AOut", &outRefNum);
	err = OpenDriver("\p.AIn", &inRefNum);
	SerSetBuf(inRefNum, inputBuffer, kInputBufferSize);


	SerShk shk;
	memset(&shk, 0, sizeof(shk));
	shk.fCTS = true;
	Control(outRefNum, kSERDHandshake, &shk);
	
	SerReset(outRefNum, baud19200 | data8 | noParity | stop10);
}

void MacSerialStream::close()
{
    if(inRefNum == 0)
        return;
	SerSetBuf(inRefNum, NULL, 0);
	
	CloseDriver(inRefNum);
	CloseDriver(outRefNum);
    inRefNum = outRefNum = 0;
}

MacSerialStream::~MacSerialStream()
{
    close();
}

void MacSerialStream::write(const void* p, size_t n)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = outRefNum;
	pb.ioParam.ioBuffer = (Ptr)p;
	pb.ioParam.ioReqCount = n;
	OSErr err = PBWriteSync(&pb);
}

void MacSerialStream::idle()
{
    long count = 0;
	SerGetBuf(inRefNum, &count);
    while(count > 0)
    {
        printf("something received.\n");
        long count1 = count > kReadBufferSize ? kReadBufferSize : count;
        ParamBlockRec pb;
        memset(&pb, 0, sizeof(pb));
        pb.ioParam.ioRefNum = inRefNum;
        pb.ioParam.ioBuffer = (Ptr)&readBuffer;
        pb.ioParam.ioReqCount = count1;
        OSErr err = PBReadSync(&pb);
        if(err)
            return;
        count -= count1;

        notifyReceive((uint8_t*)readBuffer, count1);
        Delay(20,nullptr);
    }
}

/*
class DumpToConsole : public StreamListener
{
public:
    size_t onReceive(const uint8_t* p, size_t n)
    {
        for(int i = 0; i < n; i++)
            putchar(p[i]);
        return n;
    }
};*/

class Listener : public StreamListener
{
    uint32_t size;
    short refNum;
public:
    enum class State
    {
        dataSize,
        data,
        rsrcSize,
        rsrc,
        launch,
        stop
    };
    State state = State::dataSize;


    size_t onReceive(const uint8_t* p, size_t n)
    {
        switch(state)
        {
            case State::dataSize:
                {
                    if(n < 4)
                        return 0;
                    size = *(const uint32_t*)p;

                    printf("Data Size: %u\n", size);

                    FSDelete("\pRetro68App", 0);
                    Create("\pRetro68App", 0, '????', 'APPL');
                    OpenDF("\pRetro68App", 0, &refNum);
                    state = State::data;
                    return 4 + onReceive(p+4, n-4);
                }

            case State::data:
                {
                    long count = n < size ? n : size;
                
                    FSWrite(refNum, &count, p);
                    if(count < size)
                        return count;
                    FSClose(refNum);
                    state = State::rsrcSize;
                    return count;
                }

            case State::rsrcSize:
                {
                    if(n < 4)
                        return 0;
                    size = *(const uint32_t*)p;

                    printf("Rsrc Size: %u\n", size);

                    OpenRF("\pRetro68App", 0, &refNum);
                    state = State::rsrc;
                    return 4;
                }

            case State::rsrc:
                {
                    long count = n < size ? n : size;
                
                    FSWrite(refNum, &count, p);
                    if(count < size)
                    {
                        size -= count;
                        return count;
                    }
                    FSClose(refNum);


                    state = State::launch;
                    return count;
                }
        }
    }
};

int main()
{
	OSErr err;
	short outRefNum, inRefNum;
	
	printf("Hello.\n");
	
    {
        MacSerialStream stream;
        ReliableStream rStream(stream);
        stream.setListener(&rStream);
        Listener listener;
        rStream.setListener(&listener);

        while(!Button())
        {
            stream.idle();
        
            if(listener.state == Listener::State::launch)
            {
                stream.close();
                {
                    LaunchParamBlockRec lpb;
                    memset(&lpb, 0, sizeof(lpb));

                    lpb.reserved1 = (unsigned long) "\pRetro68App";
                    lpb.reserved2 = 0;
                    lpb.launchBlockID = extendedBlock;
                    lpb.launchEPBLength = 6;
                    lpb.launchFileFlags = 0;
                    lpb.launchControlFlags = 0xC000;

                    printf("Launching...\n");
                    OSErr err = LaunchApplication(&lpb);
                    printf("Still here after launch (err = %d). Press Enter to exit.\n", (int)err);
                    getchar();
                    return 0;
                }
            }
        }
    }

	return 0;
}

