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
 * $Id: rsrc.h,v 1.7 1998/11/02 22:09:16 rob Exp $
 */

typedef struct _rsrcfile_ rsrcfile;

extern const char *rsrc_error;

typedef unsigned long (*rsrcseekfunc)(void *, long, int);
typedef unsigned long (*rsrcreadfunc)(void *, void *, unsigned long);
typedef unsigned long (*rsrcwritefunc)(void *, const void *, unsigned long);

struct rsrcprocs {
  rsrcseekfunc	seek;
  rsrcreadfunc	read;
  rsrcwritefunc	write;
};

# define RSRC_SEEK_SET		0
# define RSRC_SEEK_CUR		1
# define RSRC_SEEK_END		2

rsrcfile *rsrc_init(void *, const struct rsrcprocs *);
int rsrc_finish(rsrcfile *);

int rsrc_counttypes(rsrcfile *);
int rsrc_count(rsrcfile *, const char *);

void rsrc_gettype(rsrcfile *, int, char *);

unsigned long rsrc_maxsize(rsrcfile *, const char *, int);

void *rsrc_get(rsrcfile *, const char *, int);
void *rsrc_getnamed(rsrcfile *, const char *, const char *);
void *rsrc_getind(rsrcfile *, const char *, int);

unsigned long rsrc_size(void *);
void *rsrc_resize(void *, unsigned long);

void rsrc_changed(void *);
void rsrc_release(void *);
