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

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/time.h>
#include <reent.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>

#include <MacMemory.h>
#include <Processes.h>
#include <Files.h>
#include <TextUtils.h>
#include <Errors.h>

void *_sbrk_r(struct _reent *reent, ptrdiff_t increment)
{
	Debugger();
	return NewPtrClear(increment);
}

void _exit(int status)
{
	//if(status != 0)
	//	Debugger();
	ExitToShell();
	for(;;)
		;
}

ssize_t _consolewrite(int fd, const void *buf, size_t count);
ssize_t _consoleread(int fd, void *buf, size_t count);

const int kMacRefNumOffset = 10;

ssize_t _write_r(struct _reent *reent, int fd, const void *buf, size_t count)
{
	long cnt = count;
	if(fd >= kMacRefNumOffset)
	{
		FSWrite(fd - kMacRefNumOffset, &cnt, buf);
		return cnt;
	}
	else
		return _consolewrite(fd,buf,count);
}

ssize_t _read_r(struct _reent *reent, int fd, void *buf, size_t count)
{
	long cnt = count;
	if(fd >= kMacRefNumOffset)
	{
		FSRead(fd - kMacRefNumOffset, &cnt, buf);
		return cnt;
	}
	else
		return _consoleread(fd,buf,count);
}

int _open_r(struct _reent *reent, const char* name, int flags, int mode)
{
	Str255 pname;
#if TARGET_API_MAC_CARBON
	// Carbon has the new, sane version.
	c2pstrcpy(pname,name);
#else
	// It is also availble in various glue code libraries and
	// in some versions of InterfaceLib, but it's confusing.
	// Using the inplace variant, c2pstr, isn't much better than
	// doing things by hand:
	strncpy(&pname[1],name,255);
	pname[0] = strlen(name);
#endif
	short ref;

	SInt8 permission;
	switch(flags & O_ACCMODE)
	{
		case O_RDONLY:
			permission = fsRdPerm;
			break;
		case O_WRONLY:
			permission = fsWrPerm;
			break;
		case O_RDWR:
			permission = fsRdWrPerm;
			break;
	}

	if(flags & O_CREAT)
	{
		HCreate(0,0,pname,'????','TEXT');
	}

	OSErr err = HOpenDF(0,0,pname,fsRdWrPerm,&ref);
    if(err == paramErr)
        err = HOpen(0,0,pname,fsRdWrPerm,&ref);

	if(err)
		return -1;	// TODO: errno

	if(flags & O_TRUNC)
	{
		SetEOF(ref, 0);
	}

	return ref + kMacRefNumOffset;
}

int _close_r(struct _reent *reent, int fd)
{
	if(fd >= kMacRefNumOffset)
		FSClose(fd - kMacRefNumOffset);
	return 0;
}

int _fstat_r(struct _reent *reent, int fd, struct stat *buf)
{
	return -1;
}

extern int _stat_r(struct _reent * reent, const char *fn, struct stat *buf)
{
	return -1;
}

off_t _lseek_r(struct _reent *reent, int fd, off_t offset, int whence)
{
	if(fd >= kMacRefNumOffset)
	{
		short posMode;
		switch(whence)
		{
			case SEEK_SET:
				posMode = fsFromStart;
				break;
			case SEEK_CUR:
				posMode = fsFromMark;
				break;
			case SEEK_END:
				posMode = fsFromLEOF;
				break;
		}

		short ref = fd - kMacRefNumOffset;
		SetFPos(ref, posMode, offset);
		long finalPos;
		GetFPos(ref, &finalPos);
		return finalPos;
	}
	return (off_t) -1;
}

int _kill_r(struct _reent *reent, pid_t pid, int sig)
{
	if(pid == 42)
		_exit(42);
	else
		return -1;
}

pid_t _getpid_r(struct _reent *reent)
{
	return 42;
}

int _fork_r(struct _reent *reent)
{
	return -1;
}

int _execve_r(struct _reent *reent, const char *fn, char *const * argv, char *const *envp)
{
	return -1;
}

int _fcntl_r(struct _reent *reent, int fd, int cmd, int arg)
{
	return -1;
}

int _isatty_r(struct _reent *reent, int fd)
{
	return fd < kMacRefNumOffset;
}

int _link_r(struct _reent *reent, const char *from, const char *to)
{
	reent->_errno = EPERM;
	return -1;
}

int _mkdir_r(struct _reent *reent, const char *fn, int mode)
{
	return -1;
}

int _rename_r(struct _reent *reent, const char *from, const char *to)
{
	return -1;
}

int _unlink_r(struct _reent *reent, const char *fn)
{
	return -1;
}

_CLOCK_T_ _times_r(struct _reent *reent, struct tms *buf)
{
	reent->_errno = EACCES;
	return  -1;
}

int _wait_r(struct _reent *reent, int *wstatus)
{
	reent->_errno = ECHILD;
	return -1;                    /* Always fails */
}



int _gettimeofday_r(struct _reent *reent, struct timeval *tp, void *__tz)
{
	/* Classic MacOS's GetDateTime function returns an integer.
	 * TickCount() has a slightly higher resolution, but is independend of the real-time clock.
	 */
	unsigned long secs;
	GetDateTime(&secs);
	unsigned long ticks = TickCount();

	static unsigned long savedTicks = 0, savedSecs = 0;
	
	if(!savedSecs)
	{
		savedTicks = ticks;
		savedSecs = secs;
	}
	else
	{
		unsigned long elapsedTicks = ticks - savedTicks;
		unsigned long elapsedSecs = secs - savedSecs;
		unsigned long expectedTicks = elapsedSecs * 60 + elapsedSecs * 3 / 20;
		
		if(expectedTicks > elapsedTicks)
			savedTicks = ticks;
		else
			savedTicks += expectedTicks;
		savedSecs = secs;
	}

	if(tp)
	{
		tp->tv_sec = secs - 86400 * (365 * 66 + 66/4);
		tp->tv_usec = (ticks - savedTicks) * 20000000 / 2003;
	}

	return 0;
}
