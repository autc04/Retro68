/*
 * librsrc - library for reading and writing Macintosh resources
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
 * $Id: librsrc.h,v 1.5 1998/04/11 08:27:19 rob Exp $
 */

# include "rsrc.h"

extern int errno;

# define ERROR(code, str)  \
    do { rsrc_error = (str), errno = (code); goto fail; } while (0)

# ifdef DEBUG
#  define ASSERT(cond)	do { if (! (cond)) abort(); } while (0)
# else
#  define ASSERT(cond)	/* nothing */
# endif

# define SIZE(type, n)		((size_t) (sizeof(type) * (n)))
# define ALLOC(type, n)		((type *) malloc(SIZE(type, n)))
# define ALLOCX(type, n)	((n) ? ALLOC(type, n) : (type *) 0)
# define FREE(ptr)		((ptr) ? (void) free((void *) ptr) : (void) 0)

# define REALLOC(ptr, type, n)  \
    ((type *) ((ptr) ? realloc(ptr, SIZE(type, n)) : malloc(SIZE(type, n))))
# define REALLOCX(ptr, type, n)  \
    ((n) ? REALLOC(ptr, type, n) : (FREE(ptr), (type *) 0))

# define BMTST(bm, num)  \
    (((byte *) (bm))[(num) >> 3]  &  (0x80 >> ((num) & 0x07)))
# define BMSET(bm, num)  \
    (((byte *) (bm))[(num) >> 3] |=  (0x80 >> ((num) & 0x07)))
# define BMCLR(bm, num)  \
    (((byte *) (bm))[(num) >> 3] &= ~(0x80 >> ((num) & 0x07)))

# define STRINGIZE(x)		#x
# define STR(x)			STRINGIZE(x)

typedef unsigned char byte;

typedef struct {
  unsigned long dstart;
  unsigned long mstart;

  unsigned long dlen;
  unsigned long mlen;
} rsrchdr;

typedef struct {
  byte *data;

  unsigned short attrs;

  byte *tlist;
  byte *nlist;
} rsrcmap;

# define RSRC_MAP_READONLY	0x0080	/* set to make file read-only */
# define RSRC_MAP_COMPACT	0x0040	/* set to compact file on update */
# define RSRC_MAP_CHANGED	0x0020	/* set to write map on update */

# define RSRC_RES_SYSHEAP	0x40	/* set if read into system heap */
# define RSRC_RES_PURGEABLE	0x20	/* set if purgeable */
# define RSRC_RES_LOCKED	0x10	/* set if locked */
# define RSRC_RES_PROTECTED	0x08	/* set if protected */
# define RSRC_RES_PRELOAD	0x04	/* set if to be preloaded */
# define RSRC_RES_CHANGED	0x02	/* set if to be written to rsrc fork */

struct _rsrcfile_ {
  void *priv;			/* file-dependent private data */
  struct rsrcprocs procs;	/* procedures for accessing the file path */

  rsrchdr hdr;			/* resource header */
  rsrcmap map;			/* resource map */
};

typedef struct {
  struct _rsrcfile_ *rfile;
  const byte *ritem;

  unsigned short attrs;

  unsigned long len;
  byte data[1];
} rsrchandle;
