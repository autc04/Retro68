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

    MacMoveWindow(window,
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
}
