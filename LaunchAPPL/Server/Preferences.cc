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

#include "Preferences.h"
#include <Navigation.h>
#include <StandardFile.h>
#include <LowMem.h>
#include <stdio.h>
#include <string.h>
#include <algorithm>
#include "Window.h"
#include "SystemInfo.h"

static void ConvertToPathName(const FSSpec& spec)
{
    Str255 buf;
    unsigned char path[257];

    CInfoPBRec ipb;

    long dirID = spec.parID;
    path[0] = 0;

    while(dirID != 1)
    {
        ipb.dirInfo.ioCompletion = nullptr;
        ipb.dirInfo.ioVRefNum = spec.vRefNum;
        ipb.dirInfo.ioNamePtr = buf;
        ipb.dirInfo.ioFDirIndex = -1;
        ipb.dirInfo.ioDrDirID = dirID;

        PBGetCatInfoSync(&ipb);

        buf[buf[0]+1] = 0;
        printf("element: %s\n", buf+1);

        if(path[0] + buf[0] + 1 > 255)
        {
            printf("Path length overflow.\n");
            return;
        }

        path[++path[0]] = ':';
        std::reverse_copy(buf + 1, buf + 1 + buf[0], path + path[0] + 1);
        path[0] += buf[0];

        dirID = ipb.dirInfo.ioDrParID;
    }
    std::reverse(path + 1, path + 1 + path[0]);
    path[path[0] + 1] = 0;
    printf("path: %s\n", path+1);

    memcpy(gPrefs.sharedDirectoryPath, path, path[0] + 1);
    WritePrefs();
}

static pascal void NavEventProc(NavEventCallbackMessage callBackSelector, NavCBRecPtr callBackParms, void *callBackUD)
{
    if(callBackSelector == kNavCBEvent)
    {
        if(callBackParms->eventData.eventDataParms.event->what == updateEvt)
        {
            auto win = reinterpret_cast<WindowRef>(callBackParms->eventData.eventDataParms.event->message);
            if(auto winObject = reinterpret_cast<Window*>(GetWRefCon(win)))
            {
                winObject->Update();
            }
        }
    }
}

static bool ChooseSharedDirectoryNav(FSSpec& spec)
{
    bool success = false;
    NavReplyRecord reply = {};
    NavDialogOptions options = {};

    options.version = kNavDialogOptionsVersion;
    options.location = {-1,-1};

    auto eventProc = NewNavEventUPP(&NavEventProc);
    OSErr err = NavChooseFolder(nullptr, &reply, &options, eventProc, nullptr, nullptr);
    DisposeNavEventUPP(eventProc);

    if(err == noErr)
    {
        if(reply.validRecord)
        {
            long count = 0;
            err = AECountItems(&reply.selection, &count);
            if(err == noErr && count > 0)
            {
                AEKeyword keyword;
                DescType actualType;
                Size actualSize;

                err = AEGetNthPtr(&reply.selection, 1, typeFSS, &keyword, &actualType,
                    &spec, sizeof(spec), &actualSize);

                if(err == noErr)
                    success = true;
            }

            NavDisposeReply(&reply);
        }
    }
    return success;
}

#if !TARGET_API_MAC_CARBON
static bool choosePressed = false;
static pascal short DlgHookProc(short item, DialogRef theDialog)
{
    if(choosePressed)
        return 1;
    if(item == 11)
    {
        choosePressed = true;
        return sfHookOpenFolder;
    }

    return item;
}

static pascal Boolean FileFilterProc(CInfoPBPtr pb)
{
    return true;
}

static bool ChooseSharedDirectory6(FSSpec& spec)
{
    SFReply reply;
    auto dlgHookProc = NewDlgHookUPP(&DlgHookProc);
    auto fileFilterProc = NewFileFilterUPP(&FileFilterProc);
    choosePressed = false;
    SFPGetFile(Point{-1,-1}, "\p", fileFilterProc, 0, nullptr, dlgHookProc, &reply, 128, nullptr);
    DisposeDlgHookUPP(dlgHookProc);
    DisposeFileFilterUPP(fileFilterProc);

    if(choosePressed)
    {
        spec.name[0] = 0;
        spec.parID = LMGetCurDirStore();
        spec.vRefNum = -LMGetSFSaveDisk();
        return true;
    }
    return false;
}
static pascal short DlgHookYDProc(short item, DialogRef theDialog, void *yourDataPtr)
{
    if(choosePressed)
        return 1;
    if(item == 10)
    {
        choosePressed = true;
        return sfHookOpenFolder;
    }

    return item;
}

static pascal Boolean FileFilterYDProc(CInfoPBPtr pb, void *yourDataPtr)
{
    return true;
}

static bool ChooseSharedDirectory7(FSSpec& spec)
{
    StandardFileReply reply;
    auto dlgHookProc = NewDlgHookYDUPP(&DlgHookYDProc);
    auto fileFilterProc = NewFileFilterYDUPP(&FileFilterYDProc);
    choosePressed = false;
    CustomGetFile(
        fileFilterProc,
        0,
        nullptr,
        &reply,
        129,
        Point{-1,-1},
        dlgHookProc,
        /*filterProc*/nullptr,
        nullptr, nullptr,
        nullptr);

    DisposeDlgHookYDUPP(dlgHookProc);
    DisposeFileFilterYDUPP(fileFilterProc);

    if(choosePressed)
    {
        spec.name[0] = 0;
        spec.parID = LMGetCurDirStore();
        spec.vRefNum = -LMGetSFSaveDisk();
        return true;
    }
    return false;
}

#endif

void ChooseSharedDirectory()
{
    FSSpec spec;
    bool ok = false;


#if TARGET_CPU_68K
    if(!hasSys7StdFile)
        ok = ChooseSharedDirectory6(spec);
    else
#endif
#if !TARGET_API_MAC_CARBON
        if(NavServicesAvailable())
#endif
            ok = ChooseSharedDirectoryNav(spec);
#if !TARGET_API_MAC_CARBON
        else
            ok = ChooseSharedDirectory7(spec);
#endif

    if(ok)
        ConvertToPathName(spec);
}
