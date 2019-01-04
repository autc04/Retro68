#include <ConditionalMacros.h>
#if TARGET_API_MAC_CARBON
#define OTCARBONAPPLICATION 1
#endif

#include "OpenTptStream.h"

#include <OpenTransport.h>
#include <OpenTransportProviders.h>

#include <string.h>
#include <TextUtils.h>

OpenTptStream::OpenTptStream()
{
    InitOpenTransport();
    OSStatus err;


    //endpoint = OTOpenEndpoint(OTCreateConfiguration(kTCPName), 0, nullptr, &err);
    endpoint = OTOpenEndpoint(OTCreateConfiguration(kTCPName), 0, nullptr, &err);

    InetAddress addr, retAddr;
    OTInitInetAddress(&addr, 1984, 0);

    TBind req, ret;

    req.addr.len = sizeof(addr);
    req.addr.buf = (UInt8*) &addr;
    req.qlen = 1;
    ret.addr.maxlen = sizeof(retAddr);
    ret.addr.buf = (UInt8*) &retAddr;


    endpoint->Bind(&req, &ret);

    endpoint->SetSynchronous();
    endpoint->SetNonBlocking();
    tryListening();
}

void OpenTptStream::tryListening()
{
    if(connected)
        DebugStr("\pDouble connect");

    InetAddress clientAddr;
    memset(&call, 0, sizeof(call));
    call.addr.maxlen = sizeof(clientAddr);
    call.addr.len = sizeof(clientAddr);
    call.addr.buf = (UInt8*) &clientAddr;

    OSStatus err;

    err = endpoint->Listen(&call);
    if(err < 0)
        return; // hopefully, kOTNoData

    endpoint->SetBlocking();
            
    err = endpoint->Accept(endpoint, &call);
    endpoint->SetNonBlocking();

    connected = true;
    tryReading();
}

OpenTptStream::~OpenTptStream()
{
    endpoint->SetSynchronous();
    endpoint->SetNonBlocking();
    if(connected)
        endpoint->SndDisconnect(&call);
    endpoint->Unbind();
    OTCloseProvider(endpoint);
    CloseOpenTransport();
}

void OpenTptStream::write(const void* p, size_t n)
{
    endpoint->SetBlocking();
    endpoint->Snd((void*)p, n, 0);
    endpoint->SetNonBlocking();
}

void OpenTptStream::tryReading()
{
    OTResult result;
    OTFlags flags;
    do
    {
        result = endpoint->Rcv(readBuffer, kReadBufferSize, &flags);
        if(result > 0)
        {
            notifyReceive(readBuffer, result);
        }
    } while(result > 0);
}

void OpenTptStream::idle()
{
    OSStatus err;
    switch(endpoint->Look())
    {
        case T_DISCONNECT:
            endpoint->RcvDisconnect(nullptr);
            connected = false;
            tryListening();
            break;
        case T_ORDREL:
            err = endpoint->RcvOrderlyDisconnect();
            if(err == noErr)
                endpoint->SndOrderlyDisconnect();
            connected = false;
            tryListening();
            break;
        case T_LISTEN:
            tryListening();
            break;
        case T_DATA:
            tryReading();
            break;
    }
}

