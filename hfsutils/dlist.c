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
 * $Id: dlist.c,v 1.7 1998/11/02 22:08:27 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>

# include "dlist.h"

/*
 * NAME:	dlist->init()
 * DESCRIPTION:	initialize a new dynamic list
 */
int dl_init(dlist *list)
{
  list->memsz = 100;
  list->mem   = malloc(list->memsz);
  if (list->mem == 0)
    return -1;

  list->eltend = (char **) list->mem;
  list->strs   = list->mem + list->memsz;

  return 0;
}

/*
 * NAME:	dlist->free()
 * DESCRIPTION:	dispose of a dynamic list
 */
void dl_free(dlist *list)
{
  free(list->mem);
}

/*
 * NAME:	dlist->array()
 * DESCRIPTION:	return the array of strings in a list; can dispose with free()
 */
char **dl_array(dlist *list)
{
  return (char **) list->mem;
}

/*
 * NAME:	dlist->size()
 * DESCRIPTION:	return the number of strings in a list
 */
int dl_size(dlist *list)
{
  return list->eltend - (char **) list->mem;
}

/*
 * NAME:	dlist->append()
 * DESCRIPTION:	insert a string to the end of a list
 */
int dl_append(dlist *list, const char *str)
{
  size_t len;

  len = strlen(str) + 1;

  /* make sure there is room */

  if (sizeof(char *) + len > (size_t) (list->strs - (char *) list->eltend))
    {
      dlist newlist;
      size_t strsz;
      char **elt;

      strsz = (list->mem + list->memsz) - list->strs;

      newlist.memsz = list->memsz * 2 + sizeof(char *) + len;
      newlist.mem   = malloc(newlist.memsz);
      if (newlist.mem == 0)
	return -1;

      newlist.eltend = (char **) newlist.mem;
      newlist.strs   = newlist.mem + newlist.memsz - strsz;

      memcpy(newlist.strs, list->strs, strsz);

      for (elt = (char **) list->mem; elt < list->eltend; ++elt)
	*newlist.eltend++ = newlist.strs + (*elt - list->strs);

      free(list->mem);

      *list = newlist;
    }

  list->strs -= len;
  strcpy(list->strs, str);

  *list->eltend++ = list->strs;

  return 0;
}
