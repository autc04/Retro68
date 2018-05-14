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
#include <LowMem.h>
#include <SegLoad.h>
#include <Gestalt.h>

#include "AppLauncher.h"
#include "StatusDisplay.h"

#include <ServerProtocol.h>
#include <Processes.h>
#include <string.h>
#include <memory>

#include "ConnectionProvider.h"
#if !TARGET_API_MAC_CARBON
#include "SerialConnectionProvider.h"
#include "TCPConnectionProvider.h"
#endif

#include "CarbonFileCompat.h"

#include <Stream.h>

enum
{
    kMenuApple = 128,
    kMenuFile,
    kMenuEdit,
    kMenuConnection
};

enum
{
    kItemAbout = 1,

    kItemQuit = 1
};

enum class Port : int
{
    modemPort = 0,
    printerPort,
    macTCP
};

#if TARGET_API_MAC_CARBON
bool portsAvailable[] = { false, false, false };
#else
bool portsAvailable[] = { true, true, false };
#endif

struct Prefs
{
    const static int currentVersion = 1;
    int version = currentVersion;
    Port port = Port::modemPort;
    long baud = 19200;
    bool inSubLaunch = false;
};

Prefs gPrefs;

void WritePrefs()
{
    short refNum;
    Create("\pLaunchAPPLServer Preferences", 0, 'R68L', 'LAPR');
    if(OpenDF("\pLaunchAPPLServer Preferences", 0, &refNum) == noErr)
    {
        long count = sizeof(gPrefs);
        FSWrite(refNum, &count, &gPrefs);
        FSClose(refNum);
    }
}

void ReadPrefs()
{
    short refNum;
    if(OpenDF("\pLaunchAPPLServer Preferences", 0, &refNum) == noErr)
    {
        long count = sizeof(gPrefs);
        gPrefs.version = -1;
        FSRead(refNum, &count, &gPrefs);
        if(gPrefs.version != Prefs::currentVersion)
            gPrefs = Prefs();
        FSClose(refNum);
    }
}

bool gQuitting = false;

void ConnectionChanged();

void ShowAboutBox()
{
    WindowRef w = GetNewWindow(128, NULL, (WindowPtr) -1);
#if TARGET_API_MAC_CARBON
    Rect screenBounds = (*GetMainDevice())->gdRect;
    Rect portBounds;
    GetWindowPortBounds(w,&portBounds);
#else
    const Rect& screenBounds = qd.screenBits.bounds;
    const Rect& portBounds = w->portRect;
#endif
    MacMoveWindow(w,
        screenBounds.right/2 - portBounds.right/2,
        screenBounds.bottom/2 - portBounds.bottom/2,
        false);

    ShowWindow(w);
#if TARGET_API_MAC_CARBON
    SetPortWindowPort(w);
#else
    SetPort(w);
#endif

    Handle h = GetResource('TEXT', 128);
    HLock(h);
    Rect r = portBounds;

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

void SetItemEnabled(MenuHandle m, short item, bool enabled)
{
#if TARGET_API_MAC_CARBON
    if(enabled)
        EnableMenuItem(m,item);
    else
        DisableMenuItem(m,item);
#else
    if(enabled)
        EnableItem(m,item);
    else
        DisableItem(m,item);
#endif
}

void UpdateMenus()
{
    MenuRef m = GetMenuHandle(kMenuFile);
    WindowRef w = FrontWindow();

#if TARGET_API_MAC_CARBON
    #define EnableItem EnableMenuItem
    #define DisableItem DisableMenuItem
#endif

    m = GetMenuHandle(kMenuEdit);
    
    bool enableEditMenu = (w && GetWindowKind(w) < 0);
        // Desk accessory in front: Enable edit menu items
        // Application window or nothing in front, disable edit menu

    for(short i : {1,3,4,5,6})
        SetItemEnabled(m,i,enableEditMenu);

    m = GetMenuHandle(kMenuConnection);
    SetItemEnabled(m, 1, portsAvailable[(int)Port::macTCP]);
    CheckMenuItem(m, 1, gPrefs.port == Port::macTCP);
    SetItemEnabled(m, 2, portsAvailable[(int)Port::modemPort]);
    CheckMenuItem(m, 2, gPrefs.port == Port::modemPort);
    SetItemEnabled(m, 3, portsAvailable[(int)Port::printerPort]);
    CheckMenuItem(m, 3, gPrefs.port == Port::printerPort);
    for(int i = 4; i <= CountMenuItems(m); i++)
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
    else if(menuID == kMenuConnection)
    {
        switch(menuItem)
        {
            case 1:
                gPrefs.port = Port::macTCP;
                break;
            case 2:
                gPrefs.port = Port::modemPort;
                break;
            case 3:
                gPrefs.port = Port::printerPort;
                break;
            default:
                GetMenuItemText(GetMenuHandle(menuID), menuItem, str);
                StringToNum(str, &gPrefs.baud);
        }
        ConnectionChanged();
    }
    HiliteMenu(0);
}

std::unique_ptr<StatusDisplay> statusDisplay;

std::unique_ptr<ConnectionProvider> connection;

class LaunchServer : public StreamListener
{
    uint32_t dataSize, rsrcSize;
    uint32_t remainingSize;
    short refNum;
    short outRefNum;
    long outSize, outSizeRemaining;
    std::unique_ptr<AppLauncher> appLauncher;
    int nullEventCounter = 0;

    enum class State
    {
        command,
        header,
        data,
        rsrc,
        launch,
        wait,
        respond
    };
    State state = State::command;
    RemoteCommand command;

    OSType type, creator;

public:

    void onReset()
    {
        statusDisplay->SetStatus(gPrefs.port == Port::printerPort ? AppStatus::readyPrinter : AppStatus::readyModem, 0, 0);
        state = State::command;
    }

    size_t onReceive(const uint8_t* p, size_t n)
    {
        switch(state)
        {
            case State::command:
                {
                    if(n < 1)
                        return 0;
                    command = (RemoteCommand)p[0];
                    if(command == RemoteCommand::launchApp || command == RemoteCommand::upgradeLauncher)
                        state = State::header;
                    return 1;
                }

            case State::header:
                {
                    if(n < 16)
                        return 0;
                    type = *(const OSType*)(p+0);
                    creator = *(const OSType*)(p+4);
                    dataSize = *(const uint32_t*)(p+8);
                    rsrcSize = *(const uint32_t*)(p+12);

                    statusDisplay->SetStatus(command == RemoteCommand::upgradeLauncher ?
                                                AppStatus::upgrading : AppStatus::downloading,
                                                0, dataSize + rsrcSize);

                    FSDelete("\pRetro68App", 0);
                    Create("\pRetro68App", 0, creator, type);
                    OpenDF("\pRetro68App", 0, &refNum);
                    FSDelete("\pout", 0);
                    Create("\pout", 0, 'ttxt', 'TEXT');

                    state = State::data;
                    remainingSize = dataSize;
                    return 16;
                }

            case State::data:
                {
                    long count = n < remainingSize ? n : remainingSize;
                
                    FSWrite(refNum, &count, p);
                    remainingSize -= count;

                    statusDisplay->SetProgress(dataSize - remainingSize, dataSize + rsrcSize);

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

                    statusDisplay->SetProgress(dataSize + rsrcSize - remainingSize, dataSize + rsrcSize);

                    if(remainingSize)
                        return count;

                    FSClose(refNum);

                    statusDisplay->SetStatus(AppStatus::running);

                    state = State::launch;
                    return count;
                }
        }
    }

    void idle()
    {
        ++nullEventCounter;
        if(connection)
            connection->idle();

        if(state == State::launch)
        {
            connection->suspend();
            if(void *seg = connection->segmentToUnload())
                UnloadSeg(seg);
            gPrefs.inSubLaunch = true;
            WritePrefs();

            if(command == RemoteCommand::upgradeLauncher)
            {
                if(creator == 'R68L' && type == 'APPL')
                {
                    FSDelete("\pLaunchAPPLServer.old", 0);
                    Rename(LMGetCurApName(), 0, "\pLaunchAPPLServer.old");
                    Rename("\pRetro68App", 0, LMGetCurApName());

                    LaunchParamBlockRec lpb;
                    memset(&lpb, 0, sizeof(lpb));
                    lpb.reserved1 = (unsigned long) LMGetCurApName();
                    lpb.reserved2 = 0;
                    OSErr err = LaunchApplication(&lpb);
                    ExitToShell();
                }
            }

            if(type == 'MPST')
                appLauncher = CreateToolLauncher();
            else
                appLauncher = CreateAppLauncher();

            bool launched = appLauncher->Launch("\pRetro68App");
            gPrefs.inSubLaunch = false;
            WritePrefs();

            if(launched)
            {
                state = State::wait;
                nullEventCounter = 0;

                statusDisplay->SetStatus(AppStatus::running, 0, 0);
            }
            else
            {
                connection->resume();
                onReset();
            }
        }
        else if(state == State::wait && nullEventCounter > 3)
        {
            if(!appLauncher->IsRunning("\pRetro68App"))
            {
                appLauncher.reset();
                UnloadSeg((void*) &CreateAppLauncher);
                UnloadSeg((void*) &CreateToolLauncher);
                connection->resume();
                StartResponding();
            }
        }
        else if(state == State::respond)
        {
            Stream *stream = connection->getStream();
            while(outSizeRemaining && stream->readyToWrite())
            {
                char buf[1024];
                long count = outSizeRemaining > 1024 ? 1024 : outSizeRemaining;
                FSRead(outRefNum, &count, buf);
                stream->write(buf, count);
                outSizeRemaining -= count;
            }
            statusDisplay->SetStatus(AppStatus::uploading, outSize - outSizeRemaining, outSize);

            if(outSizeRemaining == 0)
            {
                FSClose(outRefNum);
            }
            if(outSizeRemaining == 0 && stream->allDataArrived())
            {
                onReset();
            }
        }
    }


    void StartResponding()
    {
        Stream *stream = connection->getStream();

        state = State::respond;
        uint32_t zero = 0;
        stream->write(&zero, 4);

        OpenDF("\pout", 0, &outRefNum);
        GetEOF(outRefNum, &outSize);
        outSizeRemaining = outSize;
        statusDisplay->SetStatus(AppStatus::uploading, 0, outSize);
        
        stream->write(&outSize, 4);
        stream->flushWrite();
    }

};

LaunchServer server;



void ConnectionChanged()
{
    switch(gPrefs.port)
    {
#if !TARGET_API_MAC_CARBON
        case Port::macTCP:
            connection = std::make_unique<TCPConnectionProvider>(statusDisplay.get());;
            break;
        case Port::modemPort:
            connection = std::make_unique<SerialConnectionProvider>(0, gPrefs.baud, statusDisplay.get());
            break;
        case Port::printerPort:
            connection = std::make_unique<SerialConnectionProvider>(0, gPrefs.baud, statusDisplay.get());
            break;
#endif
    }
    
    if(connection)
    {
        connection->setListener(&server);
        server.onReset();
    }
}

pascal OSErr aeRun (const AppleEvent *theAppleEvent, AppleEvent *reply, long handlerRefcon)
{
    return noErr;
}
pascal OSErr aeOpen (const AppleEvent *theAppleEvent, AppleEvent *reply, long handlerRefcon)
{
    return noErr;
}
pascal OSErr aePrint (const AppleEvent *theAppleEvent, AppleEvent *reply, long handlerRefcon)
{
    return noErr;
}
pascal OSErr aeQuit (const AppleEvent *theAppleEvent, AppleEvent *reply, long handlerRefcon)
{
    gQuitting = true;
    return noErr;
}

int main()
{
#if !TARGET_API_MAC_CARBON
    // default stack size is 8KB on B&W macs
    // and 24 KB on Color macs.
    // 8KB is too little as soon as we allocate a buffer on the stack.
    // To allow that, increae stack size: SetApplLimit(GetApplLimit() - 8192);
    MaxApplZone();

    InitGraf(&qd.thePort);
    InitFonts();
    InitWindows();
    InitMenus();
    TEInit();
    InitDialogs(NULL);
#endif

#if TARGET_CPU_68K && !TARGET_RT_MAC_CFM
    short& ROM85      = *(short*) 0x028E;
	Boolean is128KROM = (ROM85 > 0);
	Boolean hasSysEnvirons = false;
	Boolean hasWaitNextEvent = false;
    Boolean hasGestalt = false;
    Boolean hasAppleEvents = false;
	if (is128KROM)
	{
		UniversalProcPtr trapUnimpl = GetToolTrapAddress(_Unimplemented);
		UniversalProcPtr trapSysEnv = GetOSTrapAddress(_SysEnvirons);
        UniversalProcPtr trapWaitNextEvent = GetToolTrapAddress(_WaitNextEvent);
        UniversalProcPtr trapGestalt = GetOSTrapAddress(_Gestalt);

		hasSysEnvirons = (trapSysEnv != trapUnimpl);
		hasWaitNextEvent = (trapWaitNextEvent != trapUnimpl);
        hasGestalt = (trapGestalt != trapUnimpl);

        if(hasGestalt)
        {
            long response = 0;
            OSErr err = Gestalt(gestaltAppleEventsAttr, &response);
            hasAppleEvents = err == noErr && response != 0;
        }
	}
#else
	const Boolean hasSysEnvirons = true;
	const Boolean hasWaitNextEvent = true;
    const Boolean hasGestalt = true;
    const Boolean hasAppleEvents = true;
#endif

#if !TARGET_API_MAC_CARBON
    if(hasGestalt)
    {
        long resp;
        if(Gestalt('mtcp', &resp) == noErr)
            portsAvailable[(int)Port::macTCP] = true;
        if(Gestalt(gestaltSerialAttr, &resp) == noErr)
        {
            portsAvailable[(int)Port::modemPort] = 
                (resp & ((1 << gestaltHidePortA) | (1<< gestaltPortADisabled))) == 0;
            portsAvailable[(int)Port::printerPort] = 
                (resp & ((1 << gestaltHidePortB) | (1<< gestaltPortBDisabled))) == 0;
        }
    }
#endif

    SetMenuBar(GetNewMBar(128));
    AppendResMenu(GetMenu(128), 'DRVR');
    DrawMenuBar();

    InitCursor();

    if(hasAppleEvents)
    {
        AEInstallEventHandler(kCoreEventClass, kAEOpenApplication, NewAEEventHandlerUPP(&aeRun), 0, false);
        AEInstallEventHandler(kCoreEventClass, kAEOpenDocuments, NewAEEventHandlerUPP(&aeOpen), 0, false);
        AEInstallEventHandler(kCoreEventClass, kAEPrintDocuments, NewAEEventHandlerUPP(&aePrint), 0, false);
        AEInstallEventHandler(kCoreEventClass, kAEQuitApplication, NewAEEventHandlerUPP(&aeQuit), 0, false);
    }

    statusDisplay = std::make_unique<StatusDisplay>();
    
    ReadPrefs();
    ConnectionChanged();

   if(gPrefs.inSubLaunch)
   {
       gPrefs.inSubLaunch = false;
       server.StartResponding();
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
            hadEvent = WaitNextEvent(everyEvent, &e, 1, NULL);
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
#if !TARGET_API_MAC_CARBON
                            DragWindow(win, e.where, &qd.screenBits.bounds);
#else
                            DragWindow(win, e.where, nullptr);
#endif
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
                    if(statusDisplay && (WindowRef)e.message == statusDisplay->GetWindow())
                        statusDisplay->Update();
                    break;
                case kHighLevelEvent:
                    if(hasAppleEvents)
                        AEProcessAppleEvent(&e);
                    break;
            }
        }

        server.idle();
        statusDisplay->Idle();
    }

    WritePrefs();
	return 0;
}
