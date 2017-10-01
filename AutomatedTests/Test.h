#ifndef TEST_H
#define TEST_H

#include <Files.h>
#include <Devices.h>

#define TEST_LOG_SIZED(str, size) \
	do { \
	    HParamBlockRec _hpb; \
	     \
	    unsigned char _fileName[4]; \
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
	     \
	    _hpb.ioParam.ioBuffer = str; \
	    _hpb.ioParam.ioReqCount = size; \
	    _hpb.ioParam.ioPosMode = fsFromLEOF; \
	    _hpb.ioParam.ioPosOffset = 0; \
	    PBWriteSync((void*)&_hpb); \
	    char _newline = '\n'; \
	    _hpb.ioParam.ioBuffer = &_newline; \
	    _hpb.ioParam.ioReqCount = 1; \
	    _hpb.ioParam.ioPosMode = fsFromLEOF; \
	    _hpb.ioParam.ioPosOffset = 0; \
	    PBWriteSync((void*)&_hpb); \
	    PBCloseSync((void*)&_hpb); \
	} while(0);

void TestLog(const char *str);

#endif // TEST_H
