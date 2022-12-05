/*
    Copyright 2014 Wolfgang Thaller.

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

#include <stdio.h>
#include <Events.h>
#include <Processes.h>
#include <ToolUtils.h>
#include <Files.h>
#include <Resources.h>

#include <string.h>

void Explain(void)
{
    printf("*********************************************************\n");
    printf("This program is intended to make developing software\n");
    printf("using Retro68K and Mini vMac a little more convenient.\n");
    printf("\n");
    printf("If you insert a disk that contains a single application\n");
    printf("(= drag a disk image created by Retro68K to this window),\n");
    printf("the application will be automatically launched and the\n");
    printf("disk image unmounted again afterwards.\n");
    printf("\n");
    printf("It just saves a few repetitive clicks.\n");
    printf("*********************************************************\n");
}

void EjectOldDisk(void)
{
    Handle h = GetResource('LNCH', 128);
    if(h)
    {
        short refNum = **(short**)h;
        printf("Ejecting disk (refNum = %d)\n", (int)refNum);

        Eject(NULL, refNum);
        UnmountVol(NULL, refNum);
        RemoveResource(h);
    }
}

int main(void)
{
    Explain();
    EjectOldDisk();
    printf("Insert a disk or hit any key to abort.\n");

    FlushEvents(everyEvent, 0);

    for(;;)
    {
        EventRecord e;
        GetNextEvent(everyEvent, &e);

        switch(e.what)
        {
            case keyDown:
                return 0;
                break;

            case diskEvt:
                {
                    short refNum = LoWord(e.message);
                    short err = HiWord(e.message);
                    printf("Disk Inserted (refNum = %d, error = %d)\n", refNum, err);
                    if(err == 0)
                    {
                        {
                            Handle h = NewHandle(2);
                            **(short**)h = refNum;
                            AddResource(h, 'LNCH', 128, "");
                        }
                        SetVol(NULL, refNum);

                        CInfoPBRec cpb;
                        unsigned char name[257];
                        int i, nApps = 0;
                        unsigned char bestName[257];
                        for(i = 1;; i++)
                        {
                            memset(&cpb, 0, sizeof(cpb));
                            cpb.dirInfo.ioVRefNum = refNum;
                            cpb.dirInfo.ioFDirIndex = i;
                            cpb.dirInfo.ioNamePtr = name;
                            err = PBGetCatInfoSync(&cpb);

                            if(err != noErr)
                                break;

                            name[name[0]+1] = 0;
                            if(cpb.hFileInfo.ioFlFndrInfo.fdType == 'APPL')
                            {
                                printf("Application: %s\n", &name[1]);
                                memcpy(bestName, name, sizeof(bestName));
                                ++nApps;
                            }
                        }

                        if(nApps == 0)
                        {
                            printf("No applications found on disk.\n");
                            EjectOldDisk();
                        }
                        else if(nApps > 1)
                        {
                            printf("Multiple applications found on disk.\n");
                            EjectOldDisk();
                        }
                        else
                        {
                            LaunchParamBlockRec lpb;
                            memset(&lpb, 0, sizeof(lpb));

                            lpb.reserved1 = (unsigned long) bestName;
                            lpb.reserved2 = 0;
                            lpb.launchBlockID = extendedBlock;
                            lpb.launchEPBLength = 6;
                            lpb.launchFileFlags = 0;
                            lpb.launchControlFlags = 0xC000;

                            printf("Launching...\n");
                            err = LaunchApplication(&lpb);
                            printf("Still here after launch (err = %d). Press Enter to exit.\n", (int)err);
                            getchar();
                            return 0;
                        }
                    }
                    else
                        Eject(NULL, refNum);
                }
                break;
        }
    }
    return 0;
}
