/*
	Copyright 2015 Wolfgang Thaller.

	This file is part of Retro68.

	Retro68 is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Retro68 is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	Under Section 7 of GPL version 3, you are granted additional
	permissions described in the GCC Runtime Library Exception, version
	3.1, as published by the Free Software Foundation.

	You should have received a copy of the GNU General Public License and
	a copy of the GCC Runtime Library Exception along with this program;
	see the files COPYING and COPYING.RUNTIME respectively.  If not, see
	<http://www.gnu.org/licenses/>.
*/

#include <MacMemory.h>
#include <Files.h>
#include <string.h>
#include <Files.h>
#include <Devices.h>
#include <Resources.h>
#include <SegLoad.h>
#include <LowMem.h>

#include <Quickdraw.h>
QDGlobals qd;

#pragma parameter __D0 _GetPtrSize(__A0)
pascal long _GetPtrSize(Ptr ptr) = { 0xA021 };

pascal Size GetPtrSize(Ptr ptr)
{
	long tmp = _GetPtrSize(ptr);
	if(tmp > 0)
		return (Size) tmp;
	else
		return 0;
}

#pragma parameter __D0 _GetHandleSize(__A0)
pascal long _GetHandleSize(Handle h) = { 0xA025 };

pascal Size GetHandleSize(Handle h)
{
	long tmp = _GetHandleSize(h);
	if(tmp > 0)
		return (Size) tmp;
	else
		return 0;
}

#pragma parameter __A0 _PtrToHand(__A0, __D0)
pascal Handle _PtrToHand(const void *srcPtr, long size) = { 0xA9E3 };

EXTERN_API( OSErr )
PtrToHand(
  const void *  srcPtr,
  Handle *      dstHndl,
  long          size)
{
	*dstHndl = _PtrToHand(srcPtr, size);

	return MemError();
}

#pragma parameter __A0 _HandToHand(__A0)
pascal Handle _HandToHand(Handle h) = { 0xA9E1 };

EXTERN_API( OSErr )
HandToHand(Handle * theHndl)
{
	*theHndl = _HandToHand(*theHndl);

	return MemError();
}

#pragma parameter __D0 _StringToNum(__A0)
pascal long _StringToNum(ConstStr255Param theString) = { 0x3F3C, 0x0001, 0xA9EE };

EXTERN_API( void )
StringToNum(
  ConstStr255Param   theString,
  long *             theNum)
{
	*theNum = _StringToNum(theString);
}

#pragma parameter _NumToString(__D0, __A0)
pascal long _NumToString(long theNum, ConstStr255Param theString) = { 0x4267, 0xA9EE };

EXTERN_API( void )
NumToString(
  long     theNum,
  Str255   theString)
{
	_NumToString(theNum, theString);
}

#pragma parameter __D0 _CmpString(__A0, __A1, __D0)
pascal long _CmpString(const char *a, const char *b, long lens) = { 0xA03C };
#pragma parameter __D0 _CmpStringCase(__A0, __A1, __D0)
pascal long _CmpStringCase(const char *a, const char *b, long lens) = { 0xA43C };
#pragma parameter __D0 _CmpStringMarks(__A0, __A1, __D0)
pascal long _CmpStringMarks(const char *a, const char *b, long lens) = { 0xA23C };
#pragma parameter __D0 _CmpStringCaseMarks(__A0, __A1, __D0)
pascal long _CmpStringCaseMarks(const char *a, const char *b, long lens) = { 0xA63C };

EXTERN_API( Boolean )
EqualString(
  ConstStr255Param   str1,
  ConstStr255Param   str2,
  Boolean            caseSensitive,
  Boolean            diacSensitive)
{
	long lens = (str1[0] << 16) | str2[0];
	long result;
	if(caseSensitive)
	{
		if(diacSensitive)
			result = _CmpStringCase(str1+1, str2+1, lens);
		else
			result = _CmpStringCaseMarks(str1+1, str2+1, lens);
	}
	else
	{
		if(diacSensitive)
			result = _CmpString(str1+1, str2+1, lens);
		else
			result = _CmpStringMarks(str1+1, str2+1, lens);
	}
	return result == 0;
}

pascal void GetIndString(Str255 theString, short strListID, short index)
{
	Handle h = GetResource('STR#', strListID);
	theString[0] = 0;
	if(index > *(short*)*h)
		return;
	unsigned char *p = ((unsigned char*) *h) + 2;
	while(--index > 0)
		p += *p + 1;
	if(index == 0)
		memcpy(theString, p, p[0]+1);
}

EXTERN_API( UniversalProcPtr )
NGetTrapAddress(
  UInt16     trapNum,
  TrapType   tTyp)
{
	if(tTyp == kOSTrapType)
		return GetOSTrapAddress(trapNum);
	else
		return GetToolTrapAddress(trapNum);
}

EXTERN_API( void )
CountAppFiles(
  short *  message,
  short *  count)
{
	Handle h = LMGetAppParmHandle();
	if(!GetHandleSize(h))
		return;
	*message = ((short*)*h)[0];
	*count = ((short*)*h)[1];
}

static AppFile* AppFilePtr(short index)
{
	Handle h = LMGetAppParmHandle();
	if(!GetHandleSize(h))
		return NULL;
	short count = ((short*)*h)[1];
	if(index < 1 || index > count)
		return NULL;
	index--;

	Ptr p = *h + 4;
	while(index)
	{
		AppFile *f = (AppFile*) p;
		p += (8 + 1 + f->fName[0] + 1) & ~1;
	}
	return (AppFile*) p;
}

EXTERN_API( void )
GetAppFiles(
  short      index,
  AppFile *  theFile)
{
	AppFile *ptr = AppFilePtr(index);
	if(ptr)
		memcpy(theFile, ptr, 8 + 1 + ptr->fName[0]);
}

EXTERN_API( void )
ClrAppFiles(short index)
{
	AppFile *ptr = AppFilePtr(index);
	if(ptr)
		ptr->fType = 0;
}


pascal OSErr SetVol (ConstStr63Param volName, short vRefNum)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.volumeParam.ioNamePtr = (StringPtr)volName;
	pb.volumeParam.ioVRefNum = vRefNum;
	return PBSetVolSync(&pb);
}

EXTERN_API( OSErr )
GetVol(
  StringPtr   volName,
  short *     vRefNum)
{
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.volumeParam.ioNamePtr = volName;
	OSErr err = PBGetVolSync(&pb);
	*vRefNum = pb.volumeParam.ioVRefNum;
	return err;
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

pascal OSErr SetEOF (short refNum, long logEOF)
{
	OSErr err;
	ParamBlockRec pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioParam.ioRefNum = refNum;
	pb.ioParam.ioMisc = (Ptr)logEOF;
	return PBGetEOFSync(&pb);
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

pascal OSErr Create (ConstStr255Param fileName, short vRefNum, OSType creator,
		OSType fileType)
{
	ParamBlockRec pb;
	OSErr err;
	memset(&pb, 0, sizeof(pb));
	pb.fileParam.ioVRefNum = vRefNum;
	pb.fileParam.ioNamePtr = (StringPtr)fileName;
	// create the file
	err = PBCreateSync(&pb);
	if (err != noErr) return err;
	// get previous finder info
	err = PBGetFInfoSync(&pb);
	if (err != noErr) return err;
	// clear directory index
	pb.fileParam.ioFDirIndex = 0;
	// copy finder info words
	pb.fileParam.ioFlFndrInfo.fdType = fileType;
	pb.fileParam.ioFlFndrInfo.fdCreator = creator;
	// save finder info
	return PBSetFInfoSync(&pb);
}

pascal OSErr GetWDInfo(short wdRefNum, short *vRefNum, long *dirID,
		long *procID)
{
	OSErr err;
	WDPBRec	pb;
	memset(&pb, 0, sizeof(pb));
	pb.ioVRefNum = wdRefNum;
	err = PBGetWDInfo(&pb, false);
	*vRefNum = pb.ioWDVRefNum;
	*dirID = pb.ioWDDirID;
	*procID = pb.ioWDProcID;
	return err;
}

EXTERN_API( OSErr )
GetFInfo(
  ConstStr255Param   fileName,
  short              vRefNum,
  FInfo *            fndrInfo)
{
	ParamBlockRec pb;
	OSErr err;
	memset(&pb, 0, sizeof(pb));
	pb.fileParam.ioVRefNum = vRefNum;
	pb.fileParam.ioNamePtr = (StringPtr)fileName;
	err = PBGetFInfoSync(&pb);
	*fndrInfo = pb.fileParam.ioFlFndrInfo;
	return err;
}

EXTERN_API( OSErr )
HDelete(
  short              vRefNum,
  long               dirID,
  ConstStr255Param   fileName)
{
	HParamBlockRec pb;
	pb.fileParam.ioVRefNum = vRefNum;
	pb.fileParam.ioNamePtr = (StringPtr)fileName;
	pb.fileParam.ioDirID = dirID;
	pb.fileParam.ioFVersNum = 0;	// ???
	return PBHDeleteSync(&pb);
}

EXTERN_API( OSErr )
HGetFInfo(
  short              vRefNum,
  long               dirID,
  ConstStr255Param   fileName,
  FInfo *            fndrInfo)
{
	HParamBlockRec pb;
	OSErr err;
	pb.fileParam.ioVRefNum = vRefNum;
	pb.fileParam.ioNamePtr = (StringPtr)fileName;
	pb.fileParam.ioFVersNum = 0;	// ???
	pb.fileParam.ioFDirIndex = 0;
	pb.fileParam.ioDirID = dirID;
	err = PBHGetFInfoSync(&pb);
	*fndrInfo = pb.fileParam.ioFlFndrInfo;
	return err;
}

EXTERN_API( OSErr )
HSetFInfo(
  short              vRefNum,
  long               dirID,
  ConstStr255Param   fileName,
  const FInfo *      fndrInfo)
{
	HParamBlockRec pb;
	OSErr err;
	pb.fileParam.ioVRefNum = vRefNum;
	pb.fileParam.ioNamePtr = (StringPtr)fileName;
	pb.fileParam.ioFVersNum = 0;	// ???
	pb.fileParam.ioFDirIndex = 0;
	pb.fileParam.ioDirID = dirID;
	pb.fileParam.ioFlFndrInfo = *fndrInfo;
	return PBHSetFInfoSync(&pb);
}

pascal OSErr OpenDriver(ConstStr255Param name, short *drvrRefNum)
{
	ParamBlockRec pb;
	OSErr err;
	memset(&pb, 0, sizeof(pb));

	pb.ioParam.ioNamePtr = (StringPtr)name;

	err = PBOpenSync(&pb);
	*drvrRefNum = pb.ioParam.ioRefNum;
	return err;
}

pascal OSErr CloseDriver(short refNum)
{
	return FSClose(refNum);
}
