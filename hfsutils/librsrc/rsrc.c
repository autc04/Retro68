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
 * $Id: rsrc.c,v 1.7 1998/11/02 22:09:15 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <unistd.h>
# include <string.h>
# include <errno.h>

# include "librsrc.h"
# include "data.h"

const char *rsrc_error = "no error";	/* static error string */

/*
 * NAME:	rsrc->init()
 * DESCRIPTION:	initialize access to a resource file
 */
rsrcfile *rsrc_init(void *priv, const struct rsrcprocs *procs)
{
  rsrcfile *rfile;
  byte head[16];
  const byte *ptr = head;
  unsigned long nbytes;
  unsigned short tlistoff, nlistoff;

  rfile = ALLOC(rsrcfile, 1);
  if (rfile == 0)
    ERROR(ENOMEM, 0);

  rfile->priv     = priv;
  rfile->procs    = *procs;

  rfile->map.data = 0;

  if (rfile->procs.seek(rfile->priv, 0, RSRC_SEEK_SET) == (unsigned long) -1)
    ERROR(errno, "error seeking resource header");

  nbytes = rfile->procs.read(rfile->priv, head, sizeof(head));
  if (nbytes != sizeof(head))
    {
      if (nbytes == (unsigned long) -1)
	ERROR(errno, "error reading resource header");
      else
	ERROR(EINVAL, "truncated resource header");
    }

  d_fetchul(&ptr, &rfile->hdr.dstart);
  d_fetchul(&ptr, &rfile->hdr.mstart);

  d_fetchul(&ptr, &rfile->hdr.dlen);
  d_fetchul(&ptr, &rfile->hdr.mlen);

  rfile->map.data = ALLOC(byte, rfile->hdr.mlen);
  if (rfile->map.data == 0)
    ERROR(ENOMEM, 0);

  if (rfile->procs.seek(rfile->priv, rfile->hdr.mstart, RSRC_SEEK_SET) ==
      (unsigned long) -1)
    ERROR(errno, "error seeking resource map");

  nbytes = rfile->procs.read(rfile->priv, rfile->map.data, rfile->hdr.mlen);
  if (nbytes != rfile->hdr.mlen)
    {
      if (nbytes == (unsigned long) -1)
	ERROR(errno, "error reading resource map");
      else
	ERROR(EIO, "truncated resource map");
    }

  memcpy(rfile->map.data, head, sizeof(head));

  ptr = rfile->map.data + 22;

  d_fetchuw(&ptr, &rfile->map.attrs);

  d_fetchuw(&ptr, &tlistoff);
  d_fetchuw(&ptr, &nlistoff);

  rfile->map.tlist = rfile->map.data + tlistoff;
  rfile->map.nlist = rfile->map.data + nlistoff;

  return rfile;

fail:
  if (rfile)
    FREE(rfile->map.data);

  FREE(rfile);

  return 0;
}

/*
 * NAME:	rsrc->finish()
 * DESCRIPTION:	terminate access to a resource file
 */
int rsrc_finish(rsrcfile *rfile)
{
  FREE(rfile->map.data);
  FREE(rfile);

  return 0;
}

/*
 * NAME:	findtype()
 * DESCRIPTION:	locate an item in a resource type list
 */
static
const byte *findtype(rsrcmap *map, const char *type)
{
  const byte *ptr;
  long typeint;
  short ntypes;

  typeint = d_getsl((const unsigned char *) type);
  ntypes  = d_getsw(map->tlist);

  for (ptr = map->tlist + 2; ntypes >= 0; ptr += 8, --ntypes)
    {
      if (d_getsl(ptr) == typeint)
	break;
    }

  if (ntypes < 0)
    ERROR(EINVAL, "resource type not found");

  return ptr;

fail:
  return 0;
}

/*
 * NAME:	rsrc->counttypes()
 * DESCRIPTION:	return the number of unique resource types
 */
int rsrc_counttypes(rsrcfile *rfile)
{
  return d_getsw(rfile->map.tlist) + 1;
}

/*
 * NAME:	rsrc->count()
 * DESCRIPTION:	return the number of resources of a given type
 */
int rsrc_count(rsrcfile *rfile, const char *type)
{
  const byte *ptr;

  ptr = findtype(&rfile->map, type);
  if (ptr == 0)
    return 0;

  return d_getsw(ptr + 4) + 1;
}

/*
 * NAME:	rsrc->gettype()
 * DESCRIPTION:	return an indexed type from the resource file
 */
void rsrc_gettype(rsrcfile *rfile, int index, char *type)
{
  if (index < 1 || index > (d_getsw(rfile->map.tlist) + 1))
    memset(type, 0, 5);
  else
    {
      memcpy(type, rfile->map.tlist + 2 + 8 * (index - 1), 4);
      type[4] = 0;
    }
}

/*
 * NAME:	find()
 * DESCRIPTION:	generic routine to locate and return a resource
 */
static
const byte *find(rsrcmap *map, const char *type,
		 int (*compare)(rsrcmap *, const byte *, const void *),
		 const void *key)
{
  const byte *ptr;
  short nitems;
  unsigned short rlistoff;

  ptr = findtype(map, type);
  if (ptr == 0)
    goto fail;

  ptr += 4;
  d_fetchsw(&ptr, &nitems);
  d_fetchuw(&ptr, &rlistoff);

  for (ptr = map->tlist + rlistoff; nitems >= 0; ptr += 12, --nitems)
    {
      if (compare(map, ptr, key))
	break;
    }

  if (nitems < 0)
    ERROR(EINVAL, "resource not found");

  return ptr;

fail:
  return 0;
}

/*
 * NAME:	compare_id()
 * DESCRIPTION:	compare reference list item with numeric id
 */
static
int compare_id(rsrcmap *map, const byte *ritem, const void *key)
{
  return d_getsw(ritem) == *(const int *) key;
}

/*
 * NAME:	compare_name()
 * DESCRIPTION:	compare reference list item with character name
 */
static
int compare_name(rsrcmap *map, const byte *ritem, const void *key)
{
  char name[256];
  const byte *nptr = map->nlist + d_getuw(ritem + 2);

  memcpy(name, nptr + 1, *nptr);
  name[*nptr] = 0;

  return d_relstring(name, key) == 0;
}

/*
 * NAME:	load()
 * DESCRIPTION:	retrieve a resource from the resource file
 */
static
rsrchandle *load(rsrcfile *rfile, const byte *ritem)
{
  unsigned long offs, nbytes, len, count;
  byte data[260];
  rsrchandle *rsrc = 0;

  offs = d_getul(ritem + 4) & 0x00ffffff;

  if (rfile->procs.seek(rfile->priv,
			rfile->hdr.dstart + offs, RSRC_SEEK_SET) ==
      (unsigned long) -1)
    ERROR(errno, "error seeking resource data");

  nbytes = rfile->procs.read(rfile->priv, data, sizeof(data));
  if (nbytes < 4)
    {
      if (nbytes == (unsigned long) -1)
	ERROR(errno, "error reading resource data");
      else
	ERROR(EIO, "truncated resource data");
    }

  len = d_getul(data);

  rsrc = (rsrchandle *) ALLOC(byte, sizeof(rsrchandle) + len);
  if (rsrc == 0)
    ERROR(ENOMEM, 0);

  count = nbytes - 4;
  if (count > len)
    count = len;

  memcpy(rsrc->data, data + 4, count);

  if (count < len)
    {
      nbytes = rfile->procs.read(rfile->priv, rsrc->data + count, len - count);
      if (nbytes != len - count)
	{
	  if (nbytes == (unsigned long) -1)
	    ERROR(errno, "error reading resource data");
	  else
	    ERROR(EIO, "truncated resource data");
	}
    }

  rsrc->rfile = rfile;
  rsrc->ritem = ritem;
  rsrc->len   = len;

  return rsrc;

fail:
  FREE(rsrc);
  return 0;
}

/*
 * NAME:	getrdata()
 * DESCRIPTION:	generate application resource data pointer from resource handle
 */
static
void *getrdata(rsrchandle *rsrc)
{
  return rsrc->data;
}

/*
 * NAME:	gethandle()
 * DESCRIPTION:	recover resource handle from application resource data pointer
 */
static
rsrchandle *gethandle(void *rdata)
{
  rsrchandle dummy;

  return (rsrchandle *) ((char *) rdata -
			 ((char *) dummy.data - (char *) &dummy));
}

/*
 * NAME:	rsrc->maxsize()
 * DESCRIPTION:	return maximum possible size of the given resource (type/id)
 */
unsigned long rsrc_maxsize(rsrcfile *rfile, const char *type, int id)
{
  const byte *ptr;
  unsigned long offs1, offs2;

  ptr = find(&rfile->map, type, compare_id, &id);
  if (ptr == 0)
    return 0;

  offs1 = d_getul(ptr + 4) & 0x00ffffff;
  /* ... */

  offs2 = 0;

  return 0;
}

/*
 * NAME:	rsrc->get()
 * DESCRIPTION:	return a resource by type/id
 */
void *rsrc_get(rsrcfile *rfile, const char *type, int id)
{
  const byte *ptr;
  rsrchandle *rsrc;

  ptr = find(&rfile->map, type, compare_id, &id);
  if (ptr == 0)
    return 0;

  rsrc = load(rfile, ptr);
  if (rsrc == 0)
    return 0;

  return getrdata(rsrc);
}

/*
 * NAME:	rsrc->getnamed()
 * DESCRIPTION:	return a resource by type/name
 */
void *rsrc_getnamed(rsrcfile *rfile, const char *type, const char *name)
{
  const byte *ptr;
  rsrchandle *rsrc;

  ptr = find(&rfile->map, type, compare_name, name);
  if (ptr == 0)
    return 0;

  rsrc = load(rfile, ptr);
  if (rsrc == 0)
    return 0;

  return getrdata(rsrc);
}

/*
 * NAME:	rsrc->getind()
 * DESCRIPTION:	return a resource by type/index
 */
void *rsrc_getind(rsrcfile *rfile, const char *type, int index)
{
  const byte *ptr;
  short nitems;
  rsrchandle *rsrc;

  ptr = findtype(&rfile->map, type);
  if (ptr == 0)
    goto fail;

  nitems = d_getsw(ptr + 4) + 1;
  if (index < 1 || index > nitems)
    ERROR(EINVAL, "index out of range");

  rsrc = load(rfile, rfile->map.tlist + d_getsw(ptr + 6) + 12 * (index - 1));
  if (rsrc == 0)
    goto fail;

  return getrdata(rsrc);

fail:
  return 0;
}

/*
 * NAME:	rsrc->size()
 * DESCRIPTION:	return the length of a resource in bytes
 */
unsigned long rsrc_size(void *rdata)
{
  rsrchandle *rsrc = gethandle(rdata);

  return rsrc->len;
}

/*
 * NAME:	rsrc->resize()
 * DESCRIPTION:	change the length of a resource
 */
void *rsrc_resize(void *rdata, unsigned long newsize)
{
  rsrchandle *newrsrc, *rsrc = gethandle(rdata);

  if (rsrc->len == newsize)
    goto done;

  newrsrc = (rsrchandle *) REALLOC(rsrc, byte, sizeof(rsrchandle) + newsize);
  if (newrsrc == 0)
    ERROR(ENOMEM, 0);

  newrsrc->attrs |= RSRC_RES_CHANGED;
  newrsrc->len    = newsize;

  rdata = getrdata(newrsrc);

done:
  return rdata;

fail:
  return 0;
}

/*
 * NAME:	rsrc->changed()
 * DESCRIPTION:	indicate a changed resource which must be rewritten to disk
 */
void rsrc_changed(void *rdata)
{
  rsrchandle *rsrc = gethandle(rdata);

  rsrc->attrs |= RSRC_RES_CHANGED;
}

/*
 * NAME:	rsrc->release()
 * DESCRIPTION:	dispose memory used by a resource
 */
void rsrc_release(void *rdata)
{
  rsrchandle *rsrc = gethandle(rdata);

  if (rsrc->attrs & RSRC_RES_CHANGED)
    {
      /* ... */
    }

  FREE(rsrc);
}
