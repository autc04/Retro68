#include "StatusDisplay.h"
#include <Quickdraw.h>
#include <Windows.h>

StatusDisplay::StatusDisplay()
{
    statusWindow = GetNewWindow(129, NULL, (WindowPtr) -1);

    Rect bounds = statusWindow->portRect;

    SetRect(&statusRect, 10, 0, bounds.right-10, 30);
    SetRect(&progressRect, 10, 30, bounds.right-10, 46);
    SetRect(&memRect, 10, 70, bounds.right-10, 100);
    RgnHandle tmp = NewRgn();
    background = NewRgn();
    RectRgn(background, &bounds);
    RectRgn(tmp, &progressRect);
    DiffRgn(background, tmp, background);
    DisposeRgn(tmp);

    SetStatus(AppStatus::ready);
}

StatusDisplay::~StatusDisplay()
{
    DisposeWindow(statusWindow);
    DisposeRgn(background);
}

void StatusDisplay::Update()
{
#if TARGET_API_MAC_CARBON
    SetPortWindowPort(statusWindow);
#else
    SetPort(statusWindow);
#endif
    BeginUpdate(statusWindow);
    EraseRgn(background);

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
        FillRect(&r, &qd.dkGray);
        r.left = r.right;
        r.right = progressRect.right - 1;
        FillRect(&r, &qd.ltGray);
    }
    else
        EraseRect(&progressRect);

    Str255 str;
    NumToString(freeMem, str);
    MoveTo(memRect.left,memRect.bottom-10);
    DrawString(str); DrawString("\p / ");
    NumToString(ApplicationZone()->bkLim - (Ptr)ApplicationZone(), str);
    DrawString(str); DrawString("\p bytes free");

    EndUpdate(statusWindow);
}

void StatusDisplay::Idle()
{
    long newFreeMem = FreeMem();
    if(newFreeMem != freeMem)
    {
        freeMem = newFreeMem;
        SetPort(statusWindow);
        InvalRect(&memRect);
    }
}

void StatusDisplay::SetStatus(AppStatus stat)
{
    if(stat != status)
    {
        status = stat;
        GetIndString(statusString,128,(short)stat);
        SetPort(statusWindow);
        InvalRect(&statusRect);
    }
}

void StatusDisplay::SetProgress(int done, int total)
{
    if(done != progressDone || total != progressTotal)
    {
        progressTotal = total;
        progressDone = done;
        SetPort(statusWindow);
        InvalRect(&progressRect);
    }
}

void StatusDisplay::SetStatus(AppStatus stat, int done, int total)
{
    SetStatus(stat);
    SetProgress(done, total);
}
