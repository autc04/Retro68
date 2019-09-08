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

#include "AboutBox.h"
#include <Windows.h>
#include <TextEdit.h>
#include <Resources.h>

#include "SystemInfo.h"

AboutBox* AboutBox::aboutBox = nullptr;

void AboutBox::ShowAboutBox()
{
    if(aboutBox)
        SelectWindow(aboutBox->window);
    else
        aboutBox = new AboutBox();
}

AboutBox::AboutBox()
{
    window = hasColorQD ? 
        GetNewCWindow(128, NULL, (WindowPtr) -1) 
        : GetNewWindow(128, NULL, (WindowPtr) -1);

    SetWRefCon(window, reinterpret_cast<long>(static_cast<Window*>(this)));

#if TARGET_API_MAC_CARBON
    Rect screenBounds = (*GetMainDevice())->gdRect;
    Rect portRect;
    GetWindowPortBounds(window,&portRect);
#else
    const Rect& screenBounds = qd.screenBits.bounds;
    const Rect& portRect = window->portRect;
#endif

    Rect viewRect = portRect;
    viewRect.left += 10;
    viewRect.top += 52;
    viewRect.bottom -= 10;
    viewRect.right -= 10;

    SetPortWindowPort(window);
    textEdit = TENew(&viewRect, &viewRect);

    Handle h = GetResource('TEXT', 128);
    HLock(h);
    TESetText(*h, GetHandleSize(h), textEdit);
    HUnlock(h);

    {
        viewRect.bottom = viewRect.top + (*textEdit)->lineHeight * (*textEdit)->nLines;
        (*textEdit)->viewRect.bottom = (*textEdit)->destRect.bottom = viewRect.bottom;
        SizeWindow(window, portRect.right, viewRect.bottom + 10, false);
    }

    MoveWindow(window,
        screenBounds.right/2 - portRect.right/2,
        screenBounds.bottom/2 - portRect.bottom/2,
        false);

    ShowWindow(window);
}

AboutBox::~AboutBox()
{
    TEDispose(textEdit);
    DisposeWindow(window);
    if(aboutBox == this)
        aboutBox = nullptr;
}

void AboutBox::Update()
{
    GrafPtr savePort;
    GetPort(&savePort);
    SetPortWindowPort(window);
    BeginUpdate(window);

    Rect portRect;
    GetWindowPortBounds(window,&portRect);
    EraseRect(&portRect);

    Rect r;
    SetRect(&r, portRect.right/2 - 16, 10, portRect.right/2 + 16, 42);

    if(hasIconUtils)
        PlotIconID(&r, kAlignAbsoluteCenter, kTransformNone, 128);
    else
        PlotIcon(&r, GetResource('ICN#', 128));

    TEUpdate(&portRect, textEdit);

    EndUpdate(window);
    SetPort(savePort);
}
