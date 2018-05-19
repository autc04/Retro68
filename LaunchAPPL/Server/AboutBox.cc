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
    Rect portBounds;
    GetWindowPortBounds(window,&portBounds);
#else
    const Rect& screenBounds = qd.screenBits.bounds;
    const Rect& portBounds = window->portRect;
#endif
    MacMoveWindow(window,
        screenBounds.right/2 - portBounds.right/2,
        screenBounds.bottom/2 - portBounds.bottom/2,
        false);

    ShowWindow(window);
}

AboutBox::~AboutBox()
{
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

    r = portRect;
    r.left += 10;
    r.top += 52;
    r.bottom -= 10;
    r.right -= 10;
    
    Handle h = GetResource('TEXT', 128);
    HLock(h);
    TETextBox(*h, GetHandleSize(h), &r, teJustLeft);
    HUnlock(h);

    EndUpdate(window);
}
