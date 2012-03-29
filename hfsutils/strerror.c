/*
 * hfsutils - tools for reading and writing Macintosh HFS volumes
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
 * $Id: strerror.c,v 1.5 1998/04/11 08:27:00 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <limits.h>
# include <errno.h>

# define CHARLEN(type)		((sizeof(type) * CHAR_BIT + 2) / 3 + 1)

# ifdef HAVE_SYS_ERRLIST

extern char *sys_errlist[];
extern int sys_nerr;

# endif

/*
 * NAME:	strerror()
 * DESCRIPTION:	return string describing error code
 */
char *strerror(int errnum)
{
  static char str[14 + CHARLEN(int) + 1];

# ifdef HAVE_SYS_ERRLIST

  if (errnum >= 0 && errnum < sys_nerr)
    return sys_errlist[errnum];

# else

  switch (errnum)
    {
    case ENOENT:	return "No such file or directory";
    case EIO:		return "I/O error";
    case ENOMEM:	return "Out of memory";
    case EEXIST:	return "File exists";
    case ENOTDIR:	return "Not a directory";
    case EISDIR:	return "Is a directory";
    case EINVAL:	return "Invalid argument";
    case ENOSPC:	return "No space left on device";
    case EROFS:		return "Read-only file system";
    case ENAMETOOLONG:	return "File name too long";
    case ENOTEMPTY:	return "Directory not empty";
    }

# endif

  sprintf(str, "System error #%d", errnum);

  return str;
}
