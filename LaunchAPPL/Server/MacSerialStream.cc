#include "MacSerialStream.h"

#include <Serial.h>
#include <Devices.h>

#include <string.h>

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
    }
}
