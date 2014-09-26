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

	You should have received a copy of the GNU General Public License
	along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <MacMemory.h>
#include <Files.h>
#include <string.h>
#include <Files.h>
#include <Devices.h>

pascal Size GetPtrSize(Ptr ptr)
{
	long tmp;
	__asm__ __volatile__(
		"move.l %1, %%a0\n\t"
		"dc.w 0xA021\n\t"
		"move.l %%d0, %1"
	: "=g"(tmp) : "g"(ptr) : "%%a0", "%%d0");
	if(tmp > 0)
		return (Size) tmp;
	else
		return 0;
}

pascal OSErr SetVol (ConstStr63Param volName, short vRefNum)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.volumeParam.ioNamePtr = (StringPtr)volName;
	pb.volumeParam.ioVRefNum = vRefNum;
	return PBSetVolSync(&pb);
}

pascal OSErr UnmountVol (ConstStr63Param volName, short vRefNum)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.volumeParam.ioNamePtr = (StringPtr)volName;
	pb.volumeParam.ioVRefNum = vRefNum;
	return PBUnmountVolImmed(&pb);
}

pascal OSErr Eject (ConstStr63Param volName, short vRefNum)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.volumeParam.ioNamePtr = (StringPtr)volName;
	pb.volumeParam.ioVRefNum = vRefNum;
	return PBEject(&pb);
}

pascal OSErr FSOpen (ConstStr255Param fileName, short vRefNum, short *refNum)
{
	OSErr err;
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioNamePtr = (StringPtr)fileName;
	pb.ioParam.ioVRefNum = vRefNum;

	// Try newer OpenDF first, because it does not open drivers
	err = PBOpenDFSync(&pb);
	if (err == paramErr) {
		// OpenDF not implemented, so use regular Open.
		err = PBOpenSync(&pb);
	}

	*refNum = pb.ioParam.ioRefNum;
	return err;
}

pascal OSErr OpenDF (ConstStr255Param fileName, short vRefNum, short *refNum)
{
	return FSOpen(fileName, vRefNum, refNum);
}

pascal OSErr FSClose (short refNum)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = refNum;
	return PBCloseSync(&pb);
}

pascal OSErr FSRead (short refNum, long *count, void *buffPtr)
{
	OSErr err;
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = refNum;
	pb.ioParam.ioBuffer = buffPtr;
	pb.ioParam.ioReqCount = *count;

	err = PBReadSync(&pb);
	*count = pb.ioParam.ioActCount;
	return err;
}

pascal OSErr FSWrite (short refNum, long *count, const void *buffPtr)
{
	OSErr err;
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = refNum;
	pb.ioParam.ioBuffer = (void *)buffPtr;
	pb.ioParam.ioReqCount = *count;

	err = PBWriteSync(&pb);
	*count = pb.ioParam.ioActCount;
	return err;
}

pascal OSErr GetEOF (short refNum, long *logEOF)
{
	OSErr err;
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = refNum;
	err = PBGetEOFSync(&pb);
	*logEOF = (long)pb.ioParam.ioMisc;
	return err;
}

pascal OSErr GetFPos (short refNum, long *filePos)
{
	OSErr err;
	ParamBlockRec pb;
	pb.ioParam.ioRefNum = refNum;
	err = PBGetFPosSync(&pb);
	*filePos = pb.ioParam.ioPosOffset;
	return err;
}

pascal OSErr SetFPos (short refNum, short posMode, long posOff)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = refNum;
	pb.ioParam.ioPosMode = posMode;
	pb.ioParam.ioPosOffset = posOff;
	return PBSetFPosSync(&pb);
}
