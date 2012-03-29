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
 * $Id: dstring.h,v 1.7 1998/11/02 22:08:29 rob Exp $
 */

typedef struct {
  char *str;
  size_t len;
  size_t space;
  char sbuf[50];
} dstring;

void dstr_init(dstring *);
int dstr_append(dstring *, const char *, size_t);
char *dstr_string(dstring *);
int dstr_length(dstring *);
void dstr_shrink(dstring *, size_t);
void dstr_free(dstring *);
