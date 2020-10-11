/*
 * libhfs - library for reading and writing Macintosh HFS volumes
 * Copyright (C) 1996-1998 Robert Leslie
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * $Id: unix.c,v 1.8 1998/11/02 22:09:13 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# ifdef HAVE_FCNTL_H
#  include <fcntl.h>
# else
int open(const char *, int, ...);
int fcntl(int, int, ...);
# endif

# ifdef HAVE_UNISTD_H
#  include <unistd.h>
# else
int close(int);
off_t lseek(int, off_t, int);
ssize_t read(int, void *, size_t);
ssize_t write(int, const char *, size_t);
int stat(const char *, struct stat *);
int fstat(int, struct stat *);
# endif

# include <errno.h>
# include <sys/stat.h>

# include "libhfs.h"
# include "os.h"

/*
 * NAME:	os->open()
 * DESCRIPTION:	open and lock a new descriptor from the given path and mode
 */
int os_open(void **priv, const char *path, int mode)
{
  int fd;
  struct flock lock;

  switch (mode)
    {
    case HFS_MODE_RDONLY:
      mode = O_RDONLY;
      break;

    case HFS_MODE_RDWR:
    default:
      mode = O_RDWR;
      break;
    }

  fd = open(path, mode);
  if (fd == -1)
    ERROR(errno, "error opening medium");

  /* lock descriptor against concurrent access */

  lock.l_type   = (mode == O_RDONLY) ? F_RDLCK : F_WRLCK;
  lock.l_start  = 0;
  lock.l_whence = SEEK_SET;
  lock.l_len    = 0;

  if (fcntl(fd, F_SETLK, &lock) == -1 &&
      (errno == EACCES || errno == EAGAIN))
    ERROR(EAGAIN, "unable to obtain lock for medium");

  *priv = (void *) fd;

  return 0;

fail:
  if (fd != -1)
    close(fd);

  return -1;
}

/*
 * NAME:	os->close()
 * DESCRIPTION:	close an open descriptor
 */
int os_close(void **priv)
{
  int fd = (int) *priv;

  *priv = (void *) -1;

  if (close(fd) == -1)
    ERROR(errno, "error closing medium");

  return 0;

fail:
  return -1;
}

/*
 * NAME:	os->same()
 * DESCRIPTION:	return 1 iff path is same as the open descriptor
 */
int os_same(void **priv, const char *path)
{
  int fd = (int) *priv;
  struct stat fdev, dev;

  if (fstat(fd, &fdev) == -1 ||
      stat(path, &dev) == -1)
    ERROR(errno, "can't get path information");

  return fdev.st_dev == dev.st_dev &&
         fdev.st_ino == dev.st_ino;

fail:
  return -1;
}

/*
 * NAME:	os->seek()
 * DESCRIPTION:	set a descriptor's seek pointer (offset in blocks)
 */
unsigned long os_seek(void **priv, unsigned long offset)
{
  int fd = (int) *priv;
  off_t result;

  /* offset == -1 special; seek to last block of device */

  if (offset == (unsigned long) -1)
    result = lseek(fd, 0, SEEK_END);
  else
    result = lseek(fd, offset << HFS_BLOCKSZ_BITS, SEEK_SET);

  if (result == -1)
    ERROR(errno, "error seeking medium");

  return (unsigned long) result >> HFS_BLOCKSZ_BITS;

fail:
  return -1;
}

/*
 * NAME:	os->read()
 * DESCRIPTION:	read blocks from an open descriptor
 */
unsigned long os_read(void **priv, void *buf, unsigned long len)
{
  int fd = (int) *priv;
  ssize_t result;

  result = read(fd, buf, len << HFS_BLOCKSZ_BITS);

  if (result == -1)
    ERROR(errno, "error reading from medium");

  return (unsigned long) result >> HFS_BLOCKSZ_BITS;

fail:
  return -1;
}

/*
 * NAME:	os->write()
 * DESCRIPTION:	write blocks to an open descriptor
 */
unsigned long os_write(void **priv, const void *buf, unsigned long len)
{
  int fd = (int) *priv;
  ssize_t result;

  result = write(fd, buf, len << HFS_BLOCKSZ_BITS);

  if (result == -1)
    ERROR(errno, "error writing to medium");

  return (unsigned long) result >> HFS_BLOCKSZ_BITS;

fail:
  return -1;
}
