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
 * $Id: memcmp.c,v 1.6 1998/04/11 16:22:48 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <sys/types.h>

/*
 * NAME:	memcmp()
 * DESCRIPTION:	compare memory areas
 */
int memcmp(const void *s1, const void *s2, size_t n)
{
  register const unsigned char *c1, *c2;

  c1 = s1;
  c2 = s2;

  while (n--)
    {
      register int diff;

      diff = *c1++ - *c2++;

      if (diff)
	return diff;
    }

  return 0;
}
