/*
    Copyright 2018 Wolfgang Thaller.

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

#include <Quickdraw.h>
#include <Windows.h>
#include <Menus.h>
#include <Fonts.h>
#include <Resources.h>
#include <TextEdit.h>
#include <TextUtils.h>
#include <Dialogs.h>
#include <Devices.h>


#include "MacSerialStream.h"
#include <ReliableStream.h>
#include <Processes.h>
#include <string.h>
#include <stdio.h>

#include <UnreliableStream.h>

enum
{
    kMenuApple = 128,
    kMenuFile,
    kMenuEdit,
    kMenuSpeed
};

enum
{
    kItemAbout = 1,

    kItemQuit = 1
};

long gBaud = 19200;

void SetBaud(long baud);

void ShowAboutBox()
{
    WindowRef w = GetNewWindow(128, NULL, (WindowPtr) -1);
#if !TARGET_API_MAC_CARBON
    MacMoveWindow(w,
        qd.screenBits.bounds.right/2 - w->portRect.right/2,
        qd.screenBits.bounds.bottom/2 - w->portRect.bottom/2,
        false);
#endif
    ShowWindow(w);
#if TARGET_API_MAC_CARBON
    SetPortWindowPort(w);
#else
    SetPort(w);
#endif

    Handle h = GetResource('TEXT', 128);
    HLock(h);
#if TARGET_API_MAC_CARBON
    Rect r;
    GetWindowPortBounds(w,&r);
#else
    Rect r = w->portRect;
#endif
    InsetRect(&r, 10,10);
    TETextBox(*h, GetHandleSize(h), &r, teJustLeft);

    ReleaseResource(h);
    while(!Button())
        ;
    while(Button())
        ;
    FlushEvents(everyEvent, 0);
    DisposeWindow(w);
}

void UpdateMenus()
{
    MenuRef m = GetMenu(kMenuFile);
    WindowRef w = FrontWindow();

#if TARGET_API_MAC_CARBON
    #define EnableItem EnableMenuItem
    #define DisableItem DisableMenuItem
#endif

    m = GetMenu(kMenuEdit);
    if(w && GetWindowKind(w) < 0)
    {  
        // Desk accessory in front: Enable edit menu items
        EnableItem(m,1);
        EnableItem(m,3);
        EnableItem(m,4);
        EnableItem(m,5);
        EnableItem(m,6);
    }
    else
    {   
        // Application window or nothing in front, disable edit menu
        DisableItem(m,1);
        DisableItem(m,3);
        DisableItem(m,4);
        DisableItem(m,5);
        DisableItem(m,6);
    }

    m = GetMenu(kMenuSpeed);
    for(int i = 1; i <= CountMenuItems(m); i++)
    {
        Str255 str;
        long baud;
        GetMenuItemText(m, i, str);
        StringToNum(str, &baud);
        CheckMenuItem(m, i, baud == gBaud);
    }
}

void DoMenuCommand(long menuCommand)
{
    Str255 str;
    WindowRef w;
    short menuID = menuCommand >> 16;
    short menuItem = menuCommand & 0xFFFF;
    if(menuID == kMenuApple)
    {
        if(menuItem == kItemAbout)
            ShowAboutBox();
#if !TARGET_API_MAC_CARBON
        else
        {
            GetMenuItemText(GetMenu(128), menuItem, str);
            OpenDeskAcc(str);
        }
#endif
    }
    else if(menuID == kMenuFile)
    {
        switch(menuItem)
        {
            case kItemQuit:
                ExitToShell();
                break;
        }
    }
    else if(menuID == kMenuEdit)
    {
#if !TARGET_API_MAC_CARBON
        if(!SystemEdit(menuItem - 1))
#endif
        {
            // edit command not handled by desk accessory
        }
    }
    else if(menuID == kMenuSpeed)
    {
        GetMenuItemText(GetMenu(menuID), menuItem, str);
        StringToNum(str, &gBaud);
        SetBaud(gBaud);
    }
    HiliteMenu(0);
}


WindowPtr statusWindow;
Str255 statusString = "\p";
int progressDone, progressTotal = 0;

void DoUpdate(WindowRef w)
{
    if(w != statusWindow)
        return;

#if TARGET_API_MAC_CARBON
    SetPortWindowPort(w);
#else
    SetPort(w);
#endif
    BeginUpdate(w);
    EraseRect(&w->portRect);

    MoveTo(10,20);
    DrawString(statusString);

    Rect r;
    
    if(progressTotal)
    {
        SetRect(&r, 10, 40, w->portRect.right-10, 60);
        FrameRect(&r);
        SetRect(&r, 10, 40, 10 + (w->portRect.right-20) * progressDone / progressTotal, 60);
        PaintRect(&r);
    }

    EndUpdate(w);
}

enum class AppStatus
{
    ready = 1,
    downloading = 2,
    running = 3,
    uploading = 4
};

void SetStatus(AppStatus stat, int done = 0, int total = 0)
{
    GetIndString(statusString,128,(short)stat);

    progressTotal = total;
    progressDone = done;
    SetPort(statusWindow);
    InvalRect(&statusWindow->portRect);
}

ProcessSerialNumber psn;

class LaunchServer : public StreamListener
{
    Stream* stream;

    uint32_t dataSize, rsrcSize;
    uint32_t remainingSize;
    short refNum;
public:
    LaunchServer(Stream* stream) : stream(stream)
    {
        stream->setListener(this);
    }

    enum class State
    {
        size,
        data,
        rsrc,
        launch,
        wait,
        respond
    };
    State state = State::size;

    void onReset()
    {
        SetStatus(AppStatus::ready, 0, 0);
        state = State::size;
    }

    size_t onReceive(const uint8_t* p, size_t n)
    {
        switch(state)
        {
            case State::size:
                {
                    if(n < 8)
                        return 0;
                    dataSize = *(const uint32_t*)p;
                    rsrcSize = *(const uint32_t*)(p+4);

                    SetStatus(AppStatus::downloading, 0, dataSize + rsrcSize);
                    printf("Data Size: %u / %u\n", dataSize, rsrcSize);

                    FSDelete("\pRetro68App", 0);
                    Create("\pRetro68App", 0, '????', 'APPL');
                    OpenDF("\pRetro68App", 0, &refNum);
                    FSDelete("\pout", 0);
                    Create("\pout", 0, 'ttxt', 'TEXT');

                    state = State::data;
                    remainingSize = dataSize;
                    return 8;
                }

            case State::data:
                {
                    long count = n < remainingSize ? n : remainingSize;
                
                    FSWrite(refNum, &count, p);
                    remainingSize -= count;

                    SetStatus(AppStatus::downloading, dataSize - remainingSize, dataSize + rsrcSize);

                    if(remainingSize)
                        return count;

                    FSClose(refNum);
                    OpenRF("\pRetro68App", 0, &refNum);
                    state = State::rsrc;
                    remainingSize = rsrcSize;


                    return count;
                }

            case State::rsrc:
                {
                    long count = n < remainingSize ? n : remainingSize;
                
                    FSWrite(refNum, &count, p);
                    remainingSize -= count;

                    SetStatus(AppStatus::downloading, dataSize + rsrcSize - remainingSize, dataSize + rsrcSize);

                    if(remainingSize)
                        return count;

                    FSClose(refNum);

                    SetStatus(AppStatus::running);

                    state = State::launch;
                    return count;
                }
        }
    }
};

short outRefNum;
long outSize, outSizeRemaining;
MacSerialStream *gSerialStream;
int nullEventCounter = 0;

void SetBaud(long baud)
{
    gSerialStream->setBaud(baud);
}

int main()
{
#if !TARGET_API_MAC_CARBON
    InitGraf(&qd.thePort);
    InitFonts();
    InitWindows();
    InitMenus();
    TEInit();
    InitDialogs(NULL);
#endif

    SetMenuBar(GetNewMBar(128));
    AppendResMenu(GetMenu(128), 'DRVR');
    DrawMenuBar();

    InitCursor();

    statusWindow = GetNewWindow(129, NULL, (WindowPtr) -1);
    SetStatus(AppStatus::ready);
    MacSerialStream stream;
    gSerialStream = &stream;

//#define SIMULATE_ERRORS
#ifdef SIMULATE_ERRORS
    UnreliableStream uStream(stream);
    ReliableStream rStream(&uStream);
#else
    ReliableStream rStream(&stream);
#endif

    LaunchServer server(&rStream);


    for(;;)
    {
        EventRecord e;
        WindowRef win;
        
#if 0 && !TARGET_API_MAC_CARBON
        SystemTask();
        if(GetNextEvent(everyEvent, &e))
#else
        // actually, we should be using WaitNextEvent
        // on everything starting from System 7
        if(WaitNextEvent(everyEvent, &e, 10, NULL))
#endif
        {
            switch(e.what)
            {
                case keyDown:
                    if(e.modifiers & cmdKey)
                    {
                        UpdateMenus();
                        DoMenuCommand(MenuKey(e.message & charCodeMask));
                    }
                    break;
                case mouseDown:
                    switch(FindWindow(e.where, &win))
                    {
                        case inGoAway:
                            if(TrackGoAway(win, e.where))
                                DisposeWindow(win);
                            break;
                        case inDrag:
                            DragWindow(win, e.where, &qd.screenBits.bounds);
                            break;
                        case inMenuBar:
                            UpdateMenus();
                            DoMenuCommand( MenuSelect(e.where) );
                            break;
                        case inContent:
                            SelectWindow(win);
                            break;
#if !TARGET_API_MAC_CARBON                            
                        case inSysWindow:
                            SystemClick(&e, win);
                            break;
#endif
                    }
                    break;
                case updateEvt:
                    DoUpdate((WindowRef)e.message);
                    break;
            }
        }
        else
            nullEventCounter++;

        stream.idle();
    
        if(server.state == LaunchServer::State::launch)
        {
            //
            {
                LaunchParamBlockRec lpb;
                memset(&lpb, 0, sizeof(lpb));

#if 1
                lpb.reserved1 = (unsigned long) "\pRetro68App";
                lpb.reserved2 = 0;
                lpb.launchBlockID = extendedBlock;
                lpb.launchEPBLength = 6;
                lpb.launchFileFlags = 0;
                lpb.launchControlFlags = 0xC000;
               // stream.close();
#else
                FSSpec spec;
                FSMakeFSSpec(0,0,"\pRetro68App",&spec);
                lpb.launchBlockID = extendedBlock;
                lpb.launchEPBLength = extendedBlockLen;
                lpb.launchFileFlags = 0;
                lpb.launchControlFlags = launchContinue;
                lpb.launchAppSpec = &spec;
#endif

                OSErr err = LaunchApplication(&lpb);

                if(err < 0)
                {
                    server.state = LaunchServer::State::size;
                    SetStatus(AppStatus::ready, 0, 0);
                }
                else
                {
                    psn = lpb.launchProcessSN;
                    server.state = LaunchServer::State::wait;
                    nullEventCounter = 0;

                    SetStatus(AppStatus::running, 0, 0);
                }
            }
        }
        else if(server.state == LaunchServer::State::wait && nullEventCounter > 3)
        {
            bool running = false;

#if 0 
            ProcessInfoRec info;
            memset(&info, 0, sizeof(info));
            info.processInfoLength = sizeof(info);
            OSErr err = GetProcessInformation(&psn,&info);
            running = (err == noErr);
#else
            {
                uint8_t *fcbs = *(uint8_t**)0x34E; // FCBSPtr;

                uint16_t bufSize = * (uint16_t*) fcbs;
                uint8_t *end = fcbs + bufSize;

                
                
                for(uint8_t *fcb = fcbs + 2; fcb < end; fcb += 94)
                {
                    if(*(uint32_t*) fcb == 0)
                        continue;
                    if(*(OSType*) (fcb + 0x32) != 'APPL')
                        continue;
                    if(EqualString(fcb + 0x3E, "\pRetro68App", true, true))
                    {
                        running = true;
                        break;
                    }
                }
            }
#endif
            if(!running)
            {
                server.state = LaunchServer::State::respond;
                uint32_t zero = 0;
                rStream.write(&zero, 4);

                OpenDF("\pout", 0, &outRefNum);
                GetEOF(outRefNum, &outSize);
                outSizeRemaining = outSize;
                SetStatus(AppStatus::uploading, 0, outSize);
                
                rStream.write(&outSize, 4);
                rStream.flushWrite();
            }
        }
        else if(server.state == LaunchServer::State::respond)
        {
            while(outSizeRemaining && rStream.readyToWrite())
            {
                char buf[1024];
                long count = outSizeRemaining > 1024 ? 1024 : outSizeRemaining;
                FSRead(outRefNum, &count, buf);
                rStream.write(buf, count);
                outSizeRemaining -= count;
            }
            SetStatus(AppStatus::uploading, outSize - outSizeRemaining, outSize);

            if(outSizeRemaining == 0)
            {
                FSClose(outRefNum);
            }
            if(outSizeRemaining == 0 && rStream.allDataArrived())
            {
                server.state = LaunchServer::State::size;
                SetStatus(AppStatus::ready, 0, 0);
                rStream.reset(0);
            }
        }

        //if(someoneExited)
        //    SetStatus(AppStatus::running, 50, 100);
    }
	return 0;
}
