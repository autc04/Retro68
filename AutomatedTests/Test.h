#ifndef TEST_H
#define TEST_H

#include <Files.h>
#include <Devices.h>
#include <string.h>

/*
 Log test output to a file called 'out' in the current directory.

 Most of this is implemented as macros, in a very cumbersome, low-level way,
 avoiding the use of function calls, string constants or global variables.
 This way, we only test what we want to test.
 */

/* The "high level" variant - log a string. */
#ifdef __cplusplus
extern "C"
#endif
void TestLog(const char *str);

/* The same thing as a macro. String length has to be given explicitly,
 * to avoid a call to strlen(). */
#define TEST_LOG_SIZED(str, size) \
    do { \
        HParamBlockRec _hpb; \
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
        _hpb.ioParam.ioMisc = NULL; \
        PBHOpenSync(&_hpb); \
        _ref = _hpb.ioParam.ioRefNum; \
        \
        _hpb.ioParam.ioCompletion = NULL; \
        _hpb.ioParam.ioBuffer = (Ptr)str; \
        _hpb.ioParam.ioReqCount = size; \
        _hpb.ioParam.ioPosMode = fsFromLEOF; \
        _hpb.ioParam.ioPosOffset = 0; \
        _hpb.ioParam.ioRefNum = _ref; \
        _hpb.ioParam.ioMisc = NULL; \
        PBWriteSync((ParmBlkPtr)&_hpb); \
        char _newline = '\n'; \
        _hpb.ioParam.ioCompletion = NULL; \
        _hpb.ioParam.ioBuffer = &_newline; \
        _hpb.ioParam.ioReqCount = 1; \
        _hpb.ioParam.ioPosMode = fsFromLEOF; \
        _hpb.ioParam.ioPosOffset = 0; \
        _hpb.ioParam.ioRefNum = _ref; \
        _hpb.ioParam.ioMisc = NULL; \
        PBWriteSync((ParmBlkPtr)&_hpb); \
        _hpb.ioParam.ioCompletion = NULL; \
        _hpb.ioParam.ioRefNum = _ref; \
        _hpb.ioParam.ioMisc = NULL; \
        PBCloseSync((ParmBlkPtr)&_hpb); \
        _hpb.ioParam.ioCompletion = NULL; \
        _hpb.ioParam.ioNamePtr = NULL; \
        _hpb.ioParam.ioVRefNum = 0; \
        _hpb.ioParam.ioMisc = NULL; \
        PBFlushVolSync((ParmBlkPtr)&_hpb); \
    } while(0);

/*
 * Output either "OK" or "NO".
 * String constants are off-limits,
 * we might not want to test them yet.
 */

#define TEST_LOG_OK()    \
    do { \
        char ok[3]; \
        ok[0] = 'O'; \
        ok[1] = 'K'; \
        ok[2] = '\0'; \
        TEST_LOG_SIZED(ok, 2); \
    } while(0)

#define TEST_LOG_NO()    \
    do { \
        char no[3]; \
        no[0] = 'N'; \
        no[1] = 'O'; \
        no[2] = '\0'; \
        TEST_LOG_SIZED(no, 2); \
    } while(0)


#endif // TEST_H
