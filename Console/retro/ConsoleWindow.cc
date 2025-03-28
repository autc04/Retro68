/*
    Copyright 2012-2020 Wolfgang Thaller, Davide Bucci

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    Under Section 7 of GPL version 3, you are granted additional
    permissions described in the GCC Runtime Library Exception, version
    3.1, as published by the Free Software Foundation.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "ConsoleWindow.h"
#include "Events.h"
#include <unordered_map>
#include <cstring>
#include <TextUtils.h>
#include <functional>
#include <OSUtils.h>
#include <Traps.h>

using namespace std;
using namespace retro;

namespace
{
    std::unordered_map<WindowPtr, ConsoleWindow*>    *windows = NULL;
    function<bool(EventRecord *)> getEvent;
}
void setupEventFunction();

ConsoleWindow::ConsoleWindow(Rect r, ConstStr255Param title)
{
    GrafPtr port;
    win = NewWindow(NULL, &r, "\pRetro68 Console", true, 0, (WindowPtr)-1, true, 0);

#if !TARGET_API_MAC_CARBON
    port = win;
    Rect portRect = port->portRect;
#else
    port = GetWindowPort(win);
    Rect portRect;
    GetPortBounds(port, &portRect);
#endif

    SetPort(port);
    EraseRect(&portRect);

    if(!windows)
        windows = new std::unordered_map<WindowPtr, ConsoleWindow*>();
    (*windows)[win] = this;

    Init(port, portRect);
    setupEventFunction();
}

ConsoleWindow::~ConsoleWindow()
{
    windows->erase(win);
    DisposeWindow(win);
}

void ConsoleWindow::setWindowName(std::string newName)
{
    Str255 pname;
#if TARGET_API_MAC_CARBON
    // Carbon has the new, sane version.
    c2pstrcpy(pname,newName.c_str());
#else
    // It is also availble in various glue code libraries and
    // in some versions of InterfaceLib, but it's confusing.
    // Using the inplace variant, c2pstr, isn't much better than
    // doing things by hand:
    strncpy((char *)&pname[1],newName.c_str(),255);
    pname[0] = newName.length();
#endif

    SetWTitle(win, pname);
}


char ConsoleWindow::WaitNextChar()
{
    EventRecord event;
    WindowPtr eventWin;
    ConsoleWindow *realConsole;
#if TARGET_API_MAC_CARBON
    Rect *boundsPtr = NULL;
#else
    Rect *boundsPtr = &qd.screenBits.bounds;
#endif

    do
    {
        #if TARGET_API_MAC_CARBON
            #define SystemTask()
        #endif
        SystemTask();
        Idle();
        while(!getEvent(&event))
        {
            SystemTask();
            Idle();
        }

        switch(event.what)
        {
            case updateEvt:
                eventWin = (WindowPtr)event.message;
                realConsole = (*windows)[(WindowPtr)event.message];
                if(realConsole)
                {
                    Rect updateRect;
                    BeginUpdate(eventWin);
#if TARGET_API_MAC_CARBON
                    RgnHandle rgn = NewRgn();
                    GetPortVisibleRegion(GetWindowPort(eventWin), rgn);
                    GetRegionBounds(rgn, &updateRect);
                    DisposeRgn(rgn);
#else
                    updateRect = (*qd.thePort->visRgn)->rgnBBox; // Life was simple back then.
#endif
                    realConsole->Draw(updateRect);
                    EndUpdate(eventWin);
                }
                break;
            case mouseDown:
                switch(FindWindow(event.where, &eventWin))
                {
                    case inDrag:
                        DragWindow(eventWin, event.where, boundsPtr);
                        break;
                    case inGrow:
                        {
                            long growResult = GrowWindow(eventWin, event.where, boundsPtr);
                            SizeWindow(eventWin, growResult & 0xFFFF, growResult >> 16, false);
                            Reshape(Rect {0, 0, (short) (growResult >> 16), (short) (growResult & 0xFFFF) });
                        }
                        break;
                    case inGoAway:
                        {
                            if (TrackGoAway(eventWin,event.where))
                                exit(0);
                        }
                        break;
                }
                break;
        }
    } while(event.what != keyDown && event.what != autoKey);

    return event.message & charCodeMask;
}

// Wrapper for the GetNextEvent() function
bool getNextEventWrapper(EventRecord *event)
{
    return GetNextEvent(everyEvent, event);
}

// Wrapper for the WaitNextEvent() function
bool waitNextEventWrapper(EventRecord *event)
{
    const int sleepValue = 5;
    const RgnHandle mouseRegion = nil;
    return WaitNextEvent(everyEvent, event, sleepValue, mouseRegion);
}

// Determines if a Toolbox routine is available
bool routineAvailable(int trapWord) {
    TrapType trType;
    int OSTrap = 0;
    int ToolTrap = 1;

    // Determine whether it is an Operating System or Toolbox routine
    if ((trapWord & 0x0800) == 0) {
        trType = OSTrap;
    } 
    else {
        trType = ToolTrap;
    }

    // Filter cases where older systems mask with 0x1FF rather than 0x3FF
    if ((trType == ToolTrap) &&
        ((trapWord & 0x03FF) >= 0x200) &&
        (GetToolboxTrapAddress(0xA86E) == GetToolboxTrapAddress(0xAA6E))) {
        return false;
    }
    else {
        return (NGetTrapAddress(trapWord, trType) != GetToolboxTrapAddress(_Unimplemented));
    }
}

// Decides which event retrieving function to use
void setupEventFunction()
{
    #if TARGET_API_MAC_CARBON
        getEvent = waitNextEventWrapper;
    #else
        if (routineAvailable(_WaitNextEvent) == true) {
            getEvent = waitNextEventWrapper;
        }
        else {
            getEvent = getNextEventWrapper;
        }
    #endif
}
