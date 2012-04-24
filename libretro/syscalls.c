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

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <MacMemory.h>
#include <Processes.h>

int isatty(int fd) { return fd >= 0 && fd <= 2; }
void *sbrk(long increment)
{
   Debugger();
   return NewPtrClear(increment);
}

void _exit(int status)
{
   if(status != 0)
      Debugger();
   ExitToShell();
   for(;;)
      ;
}

ssize_t (*__write_hook)(int fd, const void*buf, size_t count) = NULL;

ssize_t write(int fd, const void *buf, size_t count)
{
   if(__write_hook)
      return (*__write_hook)(fd,buf,count);
   return -1;
}

ssize_t read(int fd, void *buf, size_t count)
{
   return -1;
}

int open(const char* name, int flags, mode_t mode)
{
   __asm__ __volatile__ ("dc.w 0xa9ff");
   return -1;
}

int close(int fd)
{
   return -1;
}

int fstat(int fd, struct stat *buf)
{
   return -1;
}

off_t lseek(int fd, off_t offset, int whence)
{
   return (off_t) -1;
}

int kill(pid_t pid, int sig)
{
   if(pid == 42)
      _exit(42);
   else
      return -1;
}

pid_t getpid(void)
{
   return 42;
}
