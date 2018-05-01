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
#include <Traps.h>

#include "MacSerialStream.h"
#include "AppLauncher.h"

#include <ReliableStream.h>
#include <Processes.h>
#include <string.h>
#include <stdio.h>
#include <memory>

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

struct Prefs
{
    long baud = 19200;
    bool inSubLaunch = false;
};

Prefs gPrefs;
bool gQuitting = false;

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
        CheckMenuItem(m, i, baud == gPrefs.baud);
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
                gQuitting = true;
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
        StringToNum(str, &gPrefs.baud);
        SetBaud(gPrefs.baud);
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

    Str255 str;
    NumToString(FreeMem(), str);
    MoveTo(10,80);
    DrawString(str); DrawString("\p / ");
    NumToString(ApplicationZone()->bkLim - (Ptr)ApplicationZone(), str);
    DrawString(str); DrawString("\p bytes free");

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

void StartResponding(LaunchServer& server, ReliableStream& rStream)
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

void WritePrefs()
{
    short refNum;
    Create("\pLaunchAPPLServer Preferences", 0, '????', 'LAPR');
    if(OpenDF("\pLaunchAPPLServer Preferences", 0, &refNum) == noErr)
    {
        long count = sizeof(gPrefs);
        FSWrite(refNum, &count, &gPrefs);
        FSClose(refNum);
    }
}

int main()
{
    // default stack size is 8KB on B&W macs
    // and 24 KB on Color macs.
    // 8KB seems to be not quite enough,
    // so increase stack size by 8KB.
    SetApplLimit(GetApplLimit() - 8192);
    MaxApplZone();
#if !TARGET_API_MAC_CARBON
    InitGraf(&qd.thePort);
    InitFonts();
    InitWindows();
    InitMenus();
    TEInit();
    InitDialogs(NULL);
    
    short& ROM85      = *(short*) 0x028E;
	Boolean is128KROM = (ROM85 > 0);
	Boolean hasSysEnvirons = false;
	Boolean hasWaitNextEvent = false;
	if (is128KROM)
	{
		UniversalProcPtr trapSysEnv = GetOSTrapAddress(_SysEnvirons);
        UniversalProcPtr trapWaitNextEvent = GetToolTrapAddress(_WaitNextEvent);
		UniversalProcPtr trapUnimpl = GetToolTrapAddress(_Unimplemented);

		hasSysEnvirons = (trapSysEnv != trapUnimpl);
		hasWaitNextEvent = (trapWaitNextEvent != trapUnimpl);
	}
#endif

    SetMenuBar(GetNewMBar(128));
    AppendResMenu(GetMenu(128), 'DRVR');
    DrawMenuBar();

    InitCursor();

    statusWindow = GetNewWindow(129, NULL, (WindowPtr) -1);
    SetStatus(AppStatus::ready);

    {
        short refNum;
        if(OpenDF("\pLaunchAPPLServer Preferences", 0, &refNum) == noErr)
        {
            long count = sizeof(gPrefs);
            FSRead(refNum, &count, &gPrefs);
            FSClose(refNum);
        }
    }

    MacSerialStream stream(gPrefs.baud);
    gSerialStream = &stream;

//#define SIMULATE_ERRORS
#ifdef SIMULATE_ERRORS
    UnreliableStream uStream(stream);
    ReliableStream rStream(&uStream);
#else
    ReliableStream rStream(&stream);
#endif

    LaunchServer server(&rStream);

    std::unique_ptr<AppLauncher> appLauncher = CreateAppLauncher();

   if(gPrefs.inSubLaunch)
   {
       gPrefs.inSubLaunch = false;
       StartResponding(server, rStream);
   }

    while(!gQuitting)
    {
        EventRecord e;
        WindowRef win;
        Boolean hadEvent;

#if !TARGET_API_MAC_CARBON
        if(!hasWaitNextEvent)
        {
            SystemTask();
            hadEvent = GetNextEvent(everyEvent, &e);
        }
        else
#endif
        {
            hadEvent = WaitNextEvent(everyEvent, &e, 10, NULL);
        }
        
        if(hadEvent)
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
            gSerialStream->close();
            gPrefs.inSubLaunch = true;
            WritePrefs();
            bool launched = appLauncher->Launch("\pRetro68App");
            gPrefs.inSubLaunch = false;
            WritePrefs();

            if(launched)
            {
                server.state = LaunchServer::State::wait;
                nullEventCounter = 0;

                SetStatus(AppStatus::running, 0, 0);
            }
            else
            {
                server.state = LaunchServer::State::size;
                SetStatus(AppStatus::ready, 0, 0);
            }
        }
        else if(server.state == LaunchServer::State::wait && nullEventCounter > 3)
        {
            if(!appLauncher->IsRunning("\pRetro68App"))
            {
                gSerialStream->open();
                StartResponding(server, rStream);
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
    }

    WritePrefs();
	return 0;
}
