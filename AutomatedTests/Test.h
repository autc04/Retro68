#ifndef TEST_H
#define TEST_H

#include <Files.h>
#include <Devices.h>
#include <string.h>

#define TEST_LOG_SIZED(str, size) \
	do { \
	    HParamBlockRec _hpb; \
	    memset(&_hpb,0,sizeof(_hpb)); \
	     \
	    unsigned char _fileName[4]; \
	    short _ref;\
	    _fileName[0] = 3; \
	    _fileName[1] = 'o'; \
	    _fileName[2] = 'u'; \
	    _fileName[3] = 't'; \
	     \
	    _hpb.ioParam.ioCompletion = NULL; \
	    _hpb.ioParam.ioNamePtr = (StringPtr)_fileName; \
	    _hpb.ioParam.ioVRefNum = 0; \
	    _hpb.fileParam.ioDirID = 0; \
	    _hpb.ioParam.ioPermssn = fsRdWrPerm; \
	    PBHOpenSync(&_hpb); \
	    _ref = _hpb.ioParam.ioRefNum; \
	    \
	    memset(&_hpb,0,sizeof(_hpb)); \
	    _hpb.ioParam.ioBuffer = str; \
	    _hpb.ioParam.ioReqCount = size; \
	    _hpb.ioParam.ioPosMode = fsFromLEOF; \
	    _hpb.ioParam.ioPosOffset = 0; \
	    _hpb.ioParam.ioRefNum = _ref; \
	    PBWriteSync((void*)&_hpb); \
	    memset(&_hpb,0,sizeof(_hpb)); \
	    char _newline = '\n'; \
	    _hpb.ioParam.ioBuffer = &_newline; \
	    _hpb.ioParam.ioReqCount = 1; \
	    _hpb.ioParam.ioPosMode = fsFromLEOF; \
	    _hpb.ioParam.ioPosOffset = 0; \
	    _hpb.ioParam.ioRefNum = _ref; \
	    PBWriteSync((void*)&_hpb); \
	    memset(&_hpb,0,sizeof(_hpb)); \
	    _hpb.ioParam.ioRefNum = _ref; \
	    PBCloseSync((void*)&_hpb); \
	    FlushVol(NULL,0); \
	} while(0);

void TestLog(const char *str);

#endif // TEST_H
