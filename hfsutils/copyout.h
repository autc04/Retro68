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
 * $Id: copyout.h,v 1.7 1998/04/11 08:26:54 rob Exp $
 */

extern const char *cpo_error;

typedef int (*cpofunc)(hfsvol *, const char *, const char *);

int cpo_macb(hfsvol *, const char *, const char *);
int cpo_binh(hfsvol *, const char *, const char *);
int cpo_text(hfsvol *, const char *, const char *);
int cpo_raw(hfsvol *, const char *, const char *);
