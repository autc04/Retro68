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

#include "SharedFileStream.h"
#include <Files.h>
#include <stdio.h>
#include <string.h>
#include <TextUtils.h>

void SharedFileStream::MakeFileName(unsigned char *name, int i)
{
    const unsigned char *templ = "\pout_channel_";
    memcpy(name, templ, templ[0]+1);
    Str31 s;
    NumToString(i, s);
    memcpy(name + name[0] + 1, s + 1, s[0]);
    name[0] += s[0];
}

void SharedFileStream::write(const void* p, size_t n)
{
    Str31 name;
    MakeFileName(name, outQueueTail++);
    HCreate(vRefNum, dirID, name, 'R68L', 'DATA' );

    short refNum;
    OSErr err = HOpenDF(vRefNum, dirID, name, fsWrDenyPerm, &refNum);
    if(err)
        return;
    long count = n;
    FSWrite(refNum, &count, p);
    FSClose(refNum);
}

void SharedFileStream::idle()
{
    const unsigned char* in_channel = "\pin_channel";

    static int count = 0;
    if(++count % 10)
        return;
    short refNum;

    OSErr err = HOpenDF(vRefNum, dirID, in_channel, fsRdDenyPerm, &refNum);
    if(err == 0)
    {
        long count, countTotal = 0;
        do
        {
            count = kReadBufferSize;
            err = FSRead(refNum, &count, &readBuffer);
            countTotal += count;
            if((err == noErr || err == eofErr) && count > 0)
                notifyReceive(readBuffer, count);
        } while(err == noErr);
        FSClose(refNum);
#ifdef DEBUG_CONSOLE
        printf("read %ld bytes, deleting package\n", countTotal);
#endif

        HDelete(vRefNum, dirID, in_channel);
    }

    if(outQueueTail > outQueueHead)
    {
        const unsigned char* out_channel = "\pout_channel";
        Str31 name;
        MakeFileName(name, outQueueHead);
        if(HRename(vRefNum, dirID, name, out_channel) == noErr)
            ++outQueueHead;
    }

    if(outQueueHead == outQueueTail)
        outQueueHead = outQueueTail = 1;
}

bool SharedFileStream::allDataArrived() const
{
    return outQueueHead == outQueueTail;
}

SharedFileStream::SharedFileStream(const unsigned char* path)
{
    Str255 str;
    memcpy(str, path, path[0] + 1);
    CInfoPBRec ipb;
    ipb.hFileInfo.ioCompletion = nullptr;
    ipb.hFileInfo.ioVRefNum = 0;
    ipb.hFileInfo.ioNamePtr = str;
    ipb.hFileInfo.ioFDirIndex = 0;
    ipb.hFileInfo.ioDirID = 0;

    PBGetCatInfoSync(&ipb);

    dirID = ipb.hFileInfo.ioDirID;

#ifdef DEBUG_CONSOLE
    printf("dirID = %ld\n", dirID);
    str[str[0]+1] = 0;
    printf("name = %s\n", str + 1);
#endif

    HParamBlockRec hpb;
    hpb.ioParam.ioCompletion = nullptr;
    hpb.ioParam.ioVRefNum = 0;
    hpb.volumeParam.ioVolIndex = -1;
    memcpy(str, path, path[0] + 1);
    hpb.volumeParam.ioNamePtr = str;
    PBHGetVInfoSync(&hpb);

#ifdef DEBUG_CONSOLE
    str[str[0]+1] = 0;
    printf("vRefNum = %d, name = %s\n", hpb.volumeParam.ioVRefNum, str + 1);
#endif

    vRefNum = hpb.volumeParam.ioVRefNum;
}

SharedFileStream::~SharedFileStream()
{
}
