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

#include "StatusDisplay.h"
#include "SystemInfo.h"

#include <Quickdraw.h>
#include <Windows.h>
#include <string.h>
#include <algorithm>

const short tableTop = 50;
const short tableLineHeight = 20;
const short tableBaseline = 15;

enum class StatusDisplay::Stat : short
{
    heapSize,
    freeMem,
    fileSize,
    transferred,
    speed,
    timeRemaining,
    transmissionErrors
};

StatusDisplay::StatusDisplay()
{
    statusWindow = hasColorQD ? 
        GetNewCWindow(129, NULL, (WindowPtr) -1) 
        : GetNewWindow(129, NULL, (WindowPtr) -1);
    SetWRefCon(statusWindow, reinterpret_cast<long>(static_cast<Window*>(this)));

#if TARGET_API_MAC_CARBON
    Rect bounds;
    GetWindowPortBounds(statusWindow, &bounds);
#else
    Rect bounds = statusWindow->portRect;
#endif

    SetRect(&statusRect, 10, 0, bounds.right-10, 30);
    SetRect(&progressRect, 10, 30, bounds.right-10, 46);

    memset(columnWidths, 0, sizeof(columnWidths));
    columnWidths[1] = columnWidths[4] = 50;
    
#if TARGET_API_MAC_CARBON
    SetPortWindowPort(statusWindow);
#else
    SetPort(statusWindow);
#endif
    TextSize(9);
    TextFace(bold);
    for(int i = 0; i < 2 * nValues; i++)
    {
        Str255 str;
        GetIndString(str, 129, i+1);
        short& col = columnWidths[(i&1)*2 + (i&2)*3/2];
        col = std::max(col, StringWidth(str));
    }

    for(int i = 0; i < nValues; i+=2)
    {
        SetRect(&valueRects[i],
                10 + columnWidths[0],
                tableTop + i/2 * tableLineHeight,
                10 + columnWidths[0] + columnWidths[1],
                tableTop + (i/2+1) * tableLineHeight);
    }
    for(int i = 1; i < nValues; i+=2)
    {
        SetRect(&valueRects[i],
                bounds.right - 10 - columnWidths[5] - columnWidths[4],
                tableTop + i/2 * tableLineHeight,
                bounds.right - 10 - columnWidths[5],
                tableTop + (i/2+1) * tableLineHeight);
    }

#ifdef DEBUG_CONSOLE
    short consoleTop = tableTop + (nValues+1)/2 * tableLineHeight + 10;
    SetRect(&consoleRect, 10, consoleTop,
            bounds.right - 10, consoleTop + 150);
#if TARGET_API_MAC_CARBON
    console = retro::Console(GetWindowPort(statusWindow), consoleRect);
#else
    console = retro::Console(statusWindow, consoleRect);
#endif
    retro::Console::currentInstance = &console;

    bounds.bottom = consoleRect.bottom + 10;
#else
    bounds.bottom = tableTop + (nValues+1)/2 * tableLineHeight + 10;
#endif

    RgnHandle tmp = NewRgn();
    background = NewRgn();
    RectRgn(background, &bounds);
    RectRgn(tmp, &progressRect);
    DiffRgn(background, tmp, background);
    for(int i = 0; i < nValues; i++)
    {
        RectRgn(tmp, &valueRects[i]);
        DiffRgn(background, tmp, background);
    }
#ifdef DEBUG_CONSOLE
    RectRgn(tmp, &consoleRect);
    DiffRgn(background, tmp, background);
#endif

    DisposeRgn(tmp);

    if(hasColorQD)
    {
        progressBg = GetPixPat(128);
        progressFg = GetPixPat(129);
    }

    SizeWindow(statusWindow, bounds.right, bounds.bottom, false);
    ShowWindow(statusWindow);
}

StatusDisplay::~StatusDisplay()
{
    DisposeWindow(statusWindow);
    DisposeRgn(background);
}

void StatusDisplay::Inval(const Rect& r)
{
#if TARGET_API_MAC_CARBON
    InvalWindowRect(statusWindow, &r);
#else
    SetPort(statusWindow);
    InvalRect(&r);
#endif
}

void StatusDisplay::DrawValue(Stat stat, ConstStr255Param str)
{
    Rect& r = valueRects[(short)stat];
    MoveTo(r.right - StringWidth(str), r.top + tableBaseline);
    EraseRect(&r);
    DrawString(str);
}
void StatusDisplay::DrawValue(Stat stat, long val)
{
    Str255 str;
    NumToString(val, str);
    if(val >= 0)
        DrawValue(stat, str);
    else
        DrawValue(stat, "\p--");
}


void StatusDisplay::Update()
{
    GrafPtr savePort;
    GetPort(&savePort);
    SetPortWindowPort(statusWindow);
    BeginUpdate(statusWindow);
    EraseRgn(background);

    TextSize(12);
    TextFace(normal);

    MoveTo(statusRect.left,statusRect.bottom-10);
    DrawString(statusString);

    Rect r;
    
    if(progressTotal)
    {
        FrameRect(&progressRect);
        InsetRect(&r, 1,1);
        SetRect(&r, progressRect.left+1, progressRect.top+1,
                    progressRect.left+1 + (progressRect.right-progressRect.left-2) * progressDone / progressTotal,
                    progressRect.bottom-1);

#if TARGET_CPU_68K && !TARGET_RT_MAC_CFM
        if(!hasColorQD)
            FillRect(&r, &qd.dkGray);
        else
#endif
            FillCRect(&r, progressFg);
        r.left = r.right;
        r.right = progressRect.right - 1;
#if TARGET_CPU_68K && !TARGET_RT_MAC_CFM
        if(!hasColorQD)
            FillRect(&r, &qd.ltGray);
        else
#endif
            FillCRect(&r, progressBg);
    }
    else
        EraseRect(&progressRect);

    Str255 str;

    TextSize(9);
    TextFace(bold);

    for(int i = 0; i < nValues; i++)
    {
        GetIndString(str, 129, (i*2)+1);
        MoveTo(valueRects[i].left - StringWidth(str), valueRects[i].top + tableBaseline);
        DrawString(str);
        GetIndString(str, 129, (i*2)+2);
        MoveTo(valueRects[i].right, valueRects[i].top + tableBaseline);
        DrawString(str);
    }

    TextFace(normal);
#if !TARGET_API_MAC_CARBON
    DrawValue(Stat::heapSize, (ApplicationZone()->bkLim - (Ptr)ApplicationZone()) / 1024);
#endif
    DrawValue(Stat::freeMem, freeMem);
    if(progressTotal)
    {
        DrawValue(Stat::fileSize, progressTotal / 1024);
        DrawValue(Stat::transferred, progressDone / 1024);
    }
    else
    {
        DrawValue(Stat::fileSize, "\p--");
        DrawValue(Stat::transferred, "\p--");
    }
    DrawValue(Stat::speed, speed);
    DrawValue(Stat::timeRemaining, timeRemaining);
    DrawValue(Stat::transmissionErrors, errorCount);

#ifdef DEBUG_CONSOLE
    Rect updateRect;
#if TARGET_API_MAC_CARBON
    RgnHandle rgn = NewRgn();
    GetPortVisibleRegion(GetWindowPort(statusWindow), rgn);
    GetRegionBounds(rgn, &updateRect);
    DisposeRgn(rgn);
#else
    updateRect = (*qd.thePort->visRgn)->rgnBBox; // Life was simple back then.
#endif

    console.Draw(updateRect);
    FrameRect(&consoleRect);
#endif

    EndUpdate(statusWindow);
    SetPort(savePort);
}

void StatusDisplay::Idle()
{
    long newFreeMem = FreeMem() / 1024;
    if(newFreeMem != freeMem)
    {
        freeMem = newFreeMem;
        Inval(valueRects[(short)Stat::freeMem]);
    }

    long newTimeRemaining = -1;
    if(status == AppStatus::downloading || status == AppStatus::upgrading)
    {
        long now = TickCount();
        if(now - startTime > 60 && progressDone > 4000)
        {
            long newSpeed = progressDone * 6015LL / (now-startTime) / 100;
            newTimeRemaining = (uint64_t(now-startTime) * (progressTotal - progressDone) * 100
                            / progressDone + 6014) / 6015;
            if(newSpeed != speed)
            {
                speed = newSpeed;
                Inval(valueRects[(short)Stat::speed]);
            }
        }
    }

    if(newTimeRemaining != timeRemaining)
    {
        timeRemaining = newTimeRemaining;
        Inval(valueRects[(short)Stat::timeRemaining]);
    }
}

void StatusDisplay::SetStatus(AppStatus stat)
{
    if(stat != status)
    {
        status = stat;
        if(status == AppStatus::downloading || status == AppStatus::upgrading)
            startTime = TickCount();
        GetIndString(statusString,128,(short)stat);
        Inval(statusRect);

#ifdef DEBUG_CONSOLE
        statusString[statusString[0]+1] = 0;
        printf("%s\n", (const char*)statusString+1);
#endif
    }
}

void StatusDisplay::SetProgress(int done, int total)
{
    if(done != progressDone || total != progressTotal)
    {
        Inval(progressRect);
        if(total != progressTotal)
            Inval(valueRects[(short)Stat::fileSize]);
        Inval(valueRects[(short)Stat::transferred]);
        progressTotal = total;
        progressDone = done;
    }
}

void StatusDisplay::SetStatus(AppStatus stat, int done, int total)
{
    SetStatus(stat);
    SetProgress(done, total);
}

void StatusDisplay::SetErrorCount(int newErrorCount)
{
    if(newErrorCount != errorCount)
    {
        errorCount = newErrorCount;
        Inval(valueRects[(short)Stat::transmissionErrors]);
    }
}
