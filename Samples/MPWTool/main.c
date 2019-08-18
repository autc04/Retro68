/*
     Copyright 2018 Wolfgang Thaller.

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

/*
 * The following is a simple "Hello, world." MPW tool.
 * 
 * Everything here should move to a library,
 * so this can be written using a standard printf.
 * 
 * The basic idea is that MPW makes the low-memory
 * global at 0x316 point to a special struct that
 * contains pointers to callbacks for doing standard
 * input and output (and a few other things).
 * The struct also contains argc and argv,
 * as well as a place to store the tool's exit code.
 * The tool must exit by returning from main() rather
 * than by calling ExitToShell.
 */

#include <MacTypes.h>
#include <Retro68Runtime.h>
#include <setjmp.h>
#include <stdlib.h>
#include <MixedMode.h>

#pragma pack (push, 2)

struct MPWFile;

struct fsysTable
{
    void (*quit)();
    void (*access)();
    void (*close)(struct MPWFile *);
    void (*read)(struct MPWFile *);
    void (*write)(struct MPWFile *);
    void (*ioctl)();
};

struct devtable
{
    OSType fsysSig;
    struct fsysTable fsys;
};

struct MPWFile
{
    short flags;
    short err;
    struct fsysTable *functions;
    long cookie;
    long count;
    void *buffer;
};

struct pgminfo2
{
    short magic2;

    int argc;
    char **argv;
    char **envp;
            // 0x0e
    int exitCode;

    // 0x12
    int x;
    // 0x16
    int y;
    // 0x1a
    short tableSize;
    struct MPWFile *ioptr;
    struct devtable *devptr;
};

struct pgminfo
{
    OSType magic;
    struct pgminfo2 *rest;
};
#pragma pack (pop)


// Get MPW's magic struct
struct pgminfo2 * getPgmInfo()
{
    struct pgminfo *pgm0 = *(struct pgminfo**) 0x316;
    if(!pgm0)
        return NULL;
    if(pgm0 == (struct pgminfo*)-1)
        return NULL;
    if(pgm0->magic != 'MPGM')
        return NULL;
    if(!pgm0->rest)
        return NULL;
    if(pgm0->rest->magic2 != 0x5348)
        return NULL;
    return pgm0->rest;
}

jmp_buf exit_buf;

// called by standard library's exit()
// Store 
void _exit(int status)
{
    struct pgminfo2 *pgm = getPgmInfo();
    if(pgm)
        pgm->exitCode = status;
    longjmp(exit_buf, 1);
}

const int procInfo = kCStackBased
    | STACK_ROUTINE_PARAMETER(1, kFourByteCode);

int main()
{
    struct pgminfo2 *pgm = getPgmInfo();
    if(pgm)
    {
        struct MPWFile *f = &pgm->ioptr[1];
        f->count = 14;
        f->buffer = "Hello, world.\r";

    #if TARGET_CPU_PPC
        CallUniversalProc((UniversalProcPtr) f->functions->write, procInfo, f);
    #else
        f->functions->write(f);
    #endif
    }
    return 0;
}

#if TARGET_CPU_PPC

void __do_global_dtors();

void __start()
{
    if(setjmp(exit_buf))
    ;
    else
    {
        atexit(&__do_global_dtors);
        int result;
        {
            char *argv[2] = { "./a.out", NULL };
            result = main(1, argv);
        }
        exit(result);
    }
}

void *__dso_handle = &__dso_handle;

#else

void _start()
{
    RETRO68_RELOCATE();

    if(setjmp(exit_buf))
        ;
    else
    {
        atexit(&Retro68CallDestructors);
        Retro68CallConstructors();

        int result;
        {
            char *argv[2] = { "./a.out", NULL };
            result = main(1, argv);
        }
        exit(result);
    }
}

#endif
