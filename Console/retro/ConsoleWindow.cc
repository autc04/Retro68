/*
    Copyright 2012 Wolfgang Thaller.

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

using namespace retro;

namespace
{
    std::unordered_map<WindowPtr, ConsoleWindow*>    *windows = NULL;
}

ConsoleWindow::ConsoleWindow(Rect r, ConstStr255Param title)
{
    GrafPtr port;

    win = NewWindow(NULL, &r, "\pRetro68 Console", true, 0, (WindowPtr)-1, false, 0);

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
}

ConsoleWindow::~ConsoleWindow()
{
    windows->erase(win);
    DisposeWindow(win);
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
        while(!GetNextEvent(everyEvent, &event))
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
                }
                break;
        }
    } while(event.what != keyDown && event.what != autoKey);
    
    return event.message & charCodeMask;
}
