
#include <stdio.h>
#include <Serial.h>
#include <Devices.h>
#include <Events.h>
#include <string.h>

#include "Stream.h"

class MacSerialStream : public Stream
{
    static const long kInputBufferSize = 4096;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short outRefNum, inRefNum;
public:
    virtual void send(const Block& b) override;

    void idle();

    MacSerialStream();
    ~MacSerialStream();
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

MacSerialStream::~MacSerialStream()
{
	SerSetBuf(inRefNum, NULL, 0);
	
	CloseDriver(inRefNum);
	CloseDriver(outRefNum);
}

void MacSerialStream::send(const Block& b)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = outRefNum;
	pb.ioParam.ioBuffer = (Ptr)b.begin();
	pb.ioParam.ioReqCount = b.size();
	OSErr err = PBWriteSync(&pb);

}

void MacSerialStream::idle()
{
    long count = 0;
	SerGetBuf(inRefNum, &count);

    while(count > 0)
    {
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

        onReceive(Block((uint8_t*)readBuffer, count1));
    }
}


class DumpToConsole : public StreamListener
{
public:
    void onReceive(const Block& b)
    {
        for(uint8_t c : b)
            putchar(c);
    }
};

int main()
{
	OSErr err;
	short outRefNum, inRefNum;
	
	printf("Hello.\n");
	
    {
        MacSerialStream stream;
        DumpToConsole listener;
        stream.setListener(&listener);

        while(!Button())
            stream.idle();
    }

	return 0;
}

