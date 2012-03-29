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
 * $Id: data.h,v 1.5 1998/04/11 08:27:18 rob Exp $
 */

extern const unsigned char hfs_charorder[];

signed char d_getsb(const unsigned char *);
unsigned char d_getub(const unsigned char *);
signed short d_getsw(const unsigned char *);
unsigned short d_getuw(const unsigned char *);
signed long d_getsl(const unsigned char *);
unsigned long d_getul(const unsigned char *);

void d_putsb(unsigned char *, signed char);
void d_putub(unsigned char *, unsigned char);
void d_putsw(unsigned char *, signed short);
void d_putuw(unsigned char *, unsigned short);
void d_putsl(unsigned char *, signed long);
void d_putul(unsigned char *, unsigned long);

void d_fetchsb(const unsigned char **, signed char *);
void d_fetchub(const unsigned char **, unsigned char *);
void d_fetchsw(const unsigned char **, signed short *);
void d_fetchuw(const unsigned char **, unsigned short *);
void d_fetchsl(const unsigned char **, signed long *);
void d_fetchul(const unsigned char **, unsigned long *);

void d_storesb(unsigned char **, signed char);
void d_storeub(unsigned char **, unsigned char);
void d_storesw(unsigned char **, signed short);
void d_storeuw(unsigned char **, unsigned short);
void d_storesl(unsigned char **, signed long);
void d_storeul(unsigned char **, unsigned long);

void d_fetchstr(const unsigned char **, char *, unsigned);
void d_storestr(unsigned char **, const char *, unsigned);

int d_relstring(const char *, const char *);

time_t d_ltime(unsigned long);
unsigned long d_mtime(time_t);
