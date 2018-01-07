#include <Quickdraw.h>
#include <Windows.h>
#include <Fonts.h>

#ifdef COMPILING_AS_CODE_RESOURCE
#ifndef __PPC__
#include <Retro68Runtime.h>
#endif
#include <LowMem.h>
#endif

pascal long MyWindowDefProc(short varCode, WindowRef window, short message, long param)
{
#ifdef COMPILING_AS_CODE_RESOURCE
    // If we are inside a code resource, we have two problems.
    // First, our machine code doesn't yet know where in RAM it is located, so things
    // will crash as soon as we call a function or access a global variable.
    // The following call, part of libretro, fixes that:
#ifndef __PPC__
    RETRO68_RELOCATE();
#endif

    // Next, Quickdraw's global variables are stored as part of the application's
    // global variables. If we acces "qd.", we'll get our own copy, which QuickDraw knows
    // nothing about. So, let's get a pointer to the real thing:
    QDGlobalsPtr qdPtr = (QDGlobalsPtr)( (*(Ptr*)LMGetCurrentA5()) + 4 - sizeof(QDGlobals) );

    // alternatively, we could just avoid accessing QuickDraw globals. In our case, that would mean
    // using GetPort instead of qdPtr->thePort, and not using qdPtr->white and qdPtr->ltGray.
#else
    // We're part of the real application, we could be using `qd' in the first place:
    QDGlobalsPtr qdPtr = &qd;
#endif

    WindowPeek peek = (WindowPeek) window;
    switch(message)
    {
        case kWindowMsgDraw:
            {
                RgnHandle rgn = NewRgn();
                DiffRgn(peek->strucRgn, peek->contRgn, rgn);
                FillRgn(rgn, peek->hilited ? &qdPtr->white : &qdPtr->ltGray);
                Point savePen = qdPtr->thePort->pnSize;
                if(peek->hilited)
                    PenSize(3,3);
                FrameRgn(rgn);
                PenSize(savePen.h, savePen.v);
                DisposeRgn(rgn);

                short saveFace = qdPtr->thePort->txFace;

                Rect r = (*peek->contRgn)->rgnBBox;

                MoveTo(r.left, r.top - 10);
                HLock((Handle) peek->titleHandle);
                //TextMode(srcOr);
                DrawString(*peek->titleHandle);
                HUnlock((Handle) peek->titleHandle);
            }
            break;
        case kWindowMsgHitTest:
            {
                Point p;
                p.v = param >> 16;
                p.h = param & 0xFFFF;
                if(PtInRgn(p, peek->strucRgn))
                {
                    if(PtInRgn(p, peek->contRgn))
                        return wInContent;
                    else
                        return wInDrag;
                }
                else
                    return wNoHit;
            }
            break;
        case kWindowMsgCalculateShape:
            {
                Rect r = window->portRect;
                OffsetRect(&r, -window->portBits.bounds.left,
                               -window->portBits.bounds.top);
                RectRgn(peek->contRgn, &r);
                InsetRect(&r, -10, -10);
                RectRgn(peek->strucRgn, &r);
                
                HLock((Handle) peek->titleHandle);
                short width = StringWidth(*peek->titleHandle);
                HUnlock((Handle) peek->titleHandle);
                width += 20;
                if(width > r.right - r.left - 10)
                    width = r.right - r.left - 10;
                
                RgnHandle rgn = NewRgn();
                SetRectRgn(rgn, r.left, r.top-20, r.left + width, r.top);
                UnionRgn(rgn, peek->strucRgn, peek->strucRgn);
                DisposeRgn(rgn);
            }

            break;
        case kWindowMsgInitialize:
            break;
        case kWindowMsgCleanUp:
            break;
        case kWindowMsgDrawGrowOutline:
            break;
        case kWindowMsgDrawGrowBox:
            break;
    }
    return 0;
}
