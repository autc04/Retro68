#include "MacTCPStream.h"
#include <Devices.h>
#include <string.h>

MacTCPStream::MacTCPStream()
{
    OpenDriver("\p.IPP",&refNum);

    memset(&readPB, 0, sizeof(readPB));
    readPB.ioCRefNum = refNum;
    readPB.csCode = TCPCreate;
    readPB.csParam.create.rcvBuff = inputBuffer;
    readPB.csParam.create.rcvBuffLen = kInputBufferSize;
    OSErr err = PBControlSync((ParmBlkPtr)&readPB);
    tcpStream = readPB.tcpStream;
    if(err == 0)
        ;//DebugStr("\pTCPCreate noError");
    else
        DebugStr("\pTCPCreate error");

    memset(&writePB, 0, sizeof(writePB));

    startListening();
}

void MacTCPStream::startListening()
{
    memset(&readPB, 0, sizeof(readPB));
    readPB.ioCRefNum = refNum;
    readPB.tcpStream = tcpStream;

	readPB.csCode = TCPPassiveOpen;
	readPB.ioResult = 1;
	readPB.csParam.open.ulpTimeoutValue = 5;// ###
	readPB.csParam.open.ulpTimeoutAction = 1;
	readPB.csParam.open.validityFlags = 0xC0;
	readPB.csParam.open.commandTimeoutValue = 0;
	readPB.csParam.open.localPort = 1984;
    PBControlAsync((ParmBlkPtr)&readPB);
}

MacTCPStream::~MacTCPStream()
{
    TCPiopb pb;

    memset(&pb, 0, sizeof(pb));
    pb.ioCRefNum = refNum;
    pb.tcpStream = tcpStream;
    pb.csCode = TCPAbort;
    PBControlSync((ParmBlkPtr)&pb);

    while(readPB.ioResult > 0 || writePB.ioResult > 0)
        ;

    memset(&pb, 0, sizeof(pb));
    pb.ioCRefNum = refNum;
    pb.tcpStream = tcpStream;
	pb.csCode = TCPRelease;
    PBControlSync((ParmBlkPtr)&pb);
}

void MacTCPStream::write(const void* p, size_t n)
{
    memset(&writePB, 0, sizeof(writePB));
    writePB.ioCRefNum = refNum;
    writePB.tcpStream = tcpStream;


    writePB.csCode = TCPSend;
    writePB.ioResult = 1;
    writePB.csParam.send.ulpTimeoutValue = 0;
    writePB.csParam.send.ulpTimeoutAction = 1;
    writePB.csParam.send.validityFlags = 0xC0;
    writePB.csParam.send.pushFlag = false;
    writePB.csParam.send.urgentFlag = false;

    struct wdsEntry wds[2] = { {(unsigned short)n, (Ptr)p}, {0, nullptr} };
    writePB.csParam.send.wdsPtr = (Ptr)&wds;
    PBControlSync((ParmBlkPtr)&writePB);

}

void MacTCPStream::startReading()
{
    memset(&readPB, 0, sizeof(readPB));
    readPB.ioCRefNum = refNum;
    readPB.tcpStream = tcpStream;


    readPB.csCode = TCPRcv;
    readPB.ioResult = 1;
    readPB.csParam.receive.rcvBuff = readBuffer;
    readPB.csParam.receive.rcvBuffLen = kReadBufferSize;
    readPB.csParam.receive.commandTimeoutValue = 0;
    PBControlAsync((ParmBlkPtr)&readPB);
}

void MacTCPStream::idle()
{
    if(!connected)
    {
        if(readPB.ioResult == 0)
        {
            connected = true;
            notifyReset();
            startReading();
        }
    }
    else
    {
        if(readPB.ioResult == 0)
        {
            if(readPB.csParam.receive.rcvBuffLen > 0)
                notifyReceive((uint8_t*)readBuffer, readPB.csParam.receive.rcvBuffLen);
            startReading();
        }
        else if(readPB.ioResult == connectionClosing || readPB.ioResult == connectionTerminated)
        {
            connected = false;

            memset(&readPB, 0, sizeof(readPB));
            readPB.ioCRefNum = refNum;
            readPB.tcpStream = tcpStream;

            readPB.csCode = TCPClose;
            readPB.csParam.close.ulpTimeoutValue = 5;
            readPB.csParam.close.ulpTimeoutAction = 1;
            readPB.csParam.close.validityFlags = 0xC0;
            PBControlSync((ParmBlkPtr)&readPB);

            readPB.csCode = TCPAbort;
            PBControlSync((ParmBlkPtr)&readPB);

            startListening();
        }
    }
}

