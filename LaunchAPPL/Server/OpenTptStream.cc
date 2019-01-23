/*
    Copyright 2019 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <ConditionalMacros.h>
#if TARGET_API_MAC_CARBON
#define OTCARBONAPPLICATION 1
#endif

#include "OpenTptStream.h"

#include <OpenTransport.h>
#include <OpenTransportProviders.h>

#include <string.h>
#include <TextUtils.h>

#ifdef DEBUG_CONSOLE
#include <stdio.h>
#endif

OpenTptStream::OpenTptStream()
{
    InitOpenTransport();
    OSStatus err;


    listenerEndpoint = OTOpenEndpoint(OTCreateConfiguration(kTCPName), 0, nullptr, &err);
    endpoint = nullptr;

    InetAddress addr, retAddr;
    OTInitInetAddress(&addr, 1984, 0);

    TBind req, ret;

    req.addr.len = sizeof(addr);
    req.addr.buf = (UInt8*) &addr;
    req.qlen = 1;
    ret.addr.maxlen = sizeof(retAddr);
    ret.addr.buf = (UInt8*) &retAddr;


    listenerEndpoint->Bind(&req, &ret);

    listenerEndpoint->SetSynchronous();
    
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
    
    listenerEndpoint->SetNonBlocking();
    err = listenerEndpoint->Listen(&call);
#ifdef DEBUG_CONSOLE
    printf("Listen: err = %d.\n", (int)err);
#endif

    if(err < 0)
        return; // hopefully, kOTNoData

    if(!endpoint)
    {
        endpoint = OTOpenEndpoint(OTCreateConfiguration(kTCPName), 0, nullptr, &err);
        endpoint->SetSynchronous();
    }

    listenerEndpoint->SetBlocking();
            
    err = listenerEndpoint->Accept(endpoint, &call);
#ifdef DEBUG_CONSOLE
    printf("Accept: err = %d.\n", (int)err);
#endif

    endpoint->SetNonBlocking();

    connected = true;
    tryReading();
}

OpenTptStream::~OpenTptStream()
{
    if(endpoint)
    {
        endpoint->SetNonBlocking();
        if(connected)
        	endpoint->SndDisconnect(&call);
        endpoint->Unbind();
        OTCloseProvider(endpoint);
    }
    listenerEndpoint->SetNonBlocking();
    listenerEndpoint->Unbind();
    OTCloseProvider(listenerEndpoint);
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
    if(connected)
    {
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
            case T_DATA:
                tryReading();
                break;
        }
    }
    else
    {
        switch(listenerEndpoint->Look())
        {
            case T_LISTEN:
                tryListening();
                break;
        }
    }
}
