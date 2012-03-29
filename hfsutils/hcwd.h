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
 * $Id: hcwd.h,v 1.8 1998/04/11 08:26:56 rob Exp $
 */

typedef struct {
  char vname[HFS_MAX_VLEN + 1];
  long vcrdate;
  char *path;
  int partno;
  char *cwd;
} mountent;

int hcwd_init(void);
int hcwd_finish(void);

int hcwd_mounted(const char *, long, const char *, int);
int hcwd_umounted(int vol);
mountent *hcwd_getvol(int);
int hcwd_setvol(int);
int hcwd_setcwd(mountent *, const char *);
