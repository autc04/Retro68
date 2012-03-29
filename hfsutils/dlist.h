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
 * $Id: dlist.h,v 1.6 1998/04/11 08:26:55 rob Exp $
 */

typedef struct {
  char *mem;
  size_t memsz;
  char **eltend;
  char *strs;
} dlist;

int dl_init(dlist *);
void dl_free(dlist *);
char **dl_array(dlist *);
int dl_size(dlist *);
int dl_append(dlist *, const char *);
