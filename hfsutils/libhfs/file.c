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
 * $Id: file.c,v 1.9 1998/11/02 22:08:59 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <string.h>
# include <errno.h>

# include "libhfs.h"
# include "file.h"
# include "btree.h"
# include "record.h"
# include "volume.h"

/*
 * NAME:	file->init()
 * DESCRIPTION:	initialize file structure
 */
void f_init(hfsfile *file, hfsvol *vol, long cnid, const char *name)
{
  int i;

  file->vol   = vol;
  file->parid = 0;

  strcpy(file->name, name);

  file->cat.cdrType          = cdrFilRec;
  file->cat.cdrResrv2        = 0;

  file->cat.u.fil.filFlags   = 0;
  file->cat.u.fil.filTyp     = 0;

  file->cat.u.fil.filUsrWds.fdType       = 0;
  file->cat.u.fil.filUsrWds.fdCreator    = 0;
  file->cat.u.fil.filUsrWds.fdFlags      = 0;
  file->cat.u.fil.filUsrWds.fdLocation.v = 0;
  file->cat.u.fil.filUsrWds.fdLocation.h = 0;
  file->cat.u.fil.filUsrWds.fdFldr       = 0;

  file->cat.u.fil.filFlNum   = cnid;
  file->cat.u.fil.filStBlk   = 0;
  file->cat.u.fil.filLgLen   = 0;
  file->cat.u.fil.filPyLen   = 0;
  file->cat.u.fil.filRStBlk  = 0;
  file->cat.u.fil.filRLgLen  = 0;
  file->cat.u.fil.filRPyLen  = 0;
  file->cat.u.fil.filCrDat   = 0;
  file->cat.u.fil.filMdDat   = 0;
  file->cat.u.fil.filBkDat   = 0;

  file->cat.u.fil.filFndrInfo.fdIconID = 0;
  for (i = 0; i < 4; ++i)
    file->cat.u.fil.filFndrInfo.fdUnused[i] = 0;
  file->cat.u.fil.filFndrInfo.fdComment = 0;
  file->cat.u.fil.filFndrInfo.fdPutAway = 0;

  file->cat.u.fil.filClpSize = 0;

  for (i = 0; i < 3; ++i)
    {
      file->cat.u.fil.filExtRec[i].xdrStABN     = 0;
      file->cat.u.fil.filExtRec[i].xdrNumABlks  = 0;

      file->cat.u.fil.filRExtRec[i].xdrStABN    = 0;
      file->cat.u.fil.filRExtRec[i].xdrNumABlks = 0;
    }

  file->cat.u.fil.filResrv   = 0;

  f_selectfork(file, fkData);

  file->flags = 0;

  file->prev  = 0;
  file->next  = 0;
}

/*
 * NAME:	file->selectfork()
 * DESCRIPTION:	choose a fork for file operations
 */
void f_selectfork(hfsfile *file, int fork)
{
  file->fork = fork;

  memcpy(&file->ext, fork == fkData ?
	 &file->cat.u.fil.filExtRec : &file->cat.u.fil.filRExtRec,
	 sizeof(ExtDataRec));

  file->fabn = 0;
  file->pos  = 0;
}

/*
 * NAME:	file->getptrs()
 * DESCRIPTION:	make pointers to the current fork's lengths and extents
 */
void f_getptrs(hfsfile *file, ExtDataRec **extrec,
	       unsigned long **lglen, unsigned long **pylen)
{
  if (file->fork == fkData)
    {
      if (extrec)
	*extrec = &file->cat.u.fil.filExtRec;
      if (lglen)
	*lglen  = &file->cat.u.fil.filLgLen;
      if (pylen)
	*pylen  = &file->cat.u.fil.filPyLen;
    }
  else
    {
      if (extrec)
	*extrec = &file->cat.u.fil.filRExtRec;
      if (lglen)
	*lglen  = &file->cat.u.fil.filRLgLen;
      if (pylen)
	*pylen  = &file->cat.u.fil.filRPyLen;
    }
}

/*
 * NAME:	file->doblock()
 * DESCRIPTION:	read or write a numbered block from a file
 */
int f_doblock(hfsfile *file, unsigned long num, block *bp,
	      int (*func)(hfsvol *, unsigned int, unsigned int, block *))
{
  unsigned int abnum;
  unsigned int blnum;
  unsigned int fabn;
  int i;

  abnum = num / file->vol->lpa;
  blnum = num % file->vol->lpa;

  /* locate the appropriate extent record */

  fabn = file->fabn;

  if (abnum < fabn)
    {
      ExtDataRec *extrec;

      f_getptrs(file, &extrec, 0, 0);

      fabn = file->fabn = 0;
      memcpy(&file->ext, extrec, sizeof(ExtDataRec));
    }
  else
    abnum -= fabn;

  while (1)
    {
      unsigned int n;

      for (i = 0; i < 3; ++i)
	{
	  n = file->ext[i].xdrNumABlks;

	  if (abnum < n)
	    return func(file->vol, file->ext[i].xdrStABN + abnum, blnum, bp);

	  fabn  += n;
	  abnum -= n;
	}

      if (v_extsearch(file, fabn, &file->ext, 0) <= 0)
	goto fail;

      file->fabn = fabn;
    }

fail:
  return -1;
}

/*
 * NAME:	file->addextent()
 * DESCRIPTION:	add an extent to a file
 */
int f_addextent(hfsfile *file, ExtDescriptor *blocks)
{
  hfsvol *vol = file->vol;
  ExtDataRec *extrec;
  unsigned long *pylen;
  unsigned int start, end;
  node n;
  int i;

  f_getptrs(file, &extrec, 0, &pylen);

  start  = file->fabn;
  end    = *pylen / vol->mdb.drAlBlkSiz;

  n.nnum = 0;
  i      = -1;

  while (start < end)
    {
      for (i = 0; i < 3; ++i)
	{
	  unsigned int num;

	  num    = file->ext[i].xdrNumABlks;
	  start += num;

	  if (start == end)
	    break;
	  else if (start > end)
	    ERROR(EIO, "file extents exceed file physical length");
	  else if (num == 0)
	    ERROR(EIO, "empty file extent");
	}

      if (start == end)
	break;

      if (v_extsearch(file, start, &file->ext, &n) <= 0)
	goto fail;

      file->fabn = start;
    }

  if (i >= 0 &&
      file->ext[i].xdrStABN + file->ext[i].xdrNumABlks == blocks->xdrStABN)
    file->ext[i].xdrNumABlks += blocks->xdrNumABlks;
  else
    {
      /* create a new extent descriptor */

      if (++i < 3)
	file->ext[i] = *blocks;
      else
	{
	  ExtKeyRec key;
	  byte record[HFS_MAX_EXTRECLEN];
	  unsigned int reclen;

	  /* record is full; create a new one */

	  file->ext[0] = *blocks;

	  for (i = 1; i < 3; ++i)
	    {
	      file->ext[i].xdrStABN    = 0;
	      file->ext[i].xdrNumABlks = 0;
	    }

	  file->fabn = start;

	  r_makeextkey(&key, file->fork, file->cat.u.fil.filFlNum, end);
	  r_packextrec(&key, &file->ext, record, &reclen);

	  if (bt_insert(&vol->ext, record, reclen) == -1)
	    goto fail;

	  i = -1;
	}
    }

  if (i >= 0)
    {
      /* store the modified extent record */

      if (file->fabn)
	{
	  if ((n.nnum == 0 &&
	       v_extsearch(file, file->fabn, 0, &n) <= 0) ||
	      v_putextrec(&file->ext, &n) == -1)
	    goto fail;
	}
      else
	memcpy(extrec, &file->ext, sizeof(ExtDataRec));
    }

  *pylen += blocks->xdrNumABlks * vol->mdb.drAlBlkSiz;

  file->flags |= HFS_FILE_UPDATE_CATREC;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	file->alloc()
 * DESCRIPTION:	reserve allocation blocks for a file
 */
long f_alloc(hfsfile *file)
{
  hfsvol *vol = file->vol;
  unsigned long clumpsz;
  ExtDescriptor blocks;

  clumpsz = file->cat.u.fil.filClpSize;
  if (clumpsz == 0)
    {
      if (file == &vol->ext.f)
	clumpsz = vol->mdb.drXTClpSiz;
      else if (file == &vol->cat.f)
	clumpsz = vol->mdb.drCTClpSiz;
      else
	clumpsz = vol->mdb.drClpSiz;
    }

  blocks.xdrNumABlks = clumpsz / vol->mdb.drAlBlkSiz;

  if (v_allocblocks(vol, &blocks) == -1)
    goto fail;

  if (f_addextent(file, &blocks) == -1)
    {
      v_freeblocks(vol, &blocks);
      goto fail;
    }

  return blocks.xdrNumABlks;

fail:
  return -1;
}

/*
 * NAME:	file->trunc()
 * DESCRIPTION:	release allocation blocks unneeded by a file
 */
int f_trunc(hfsfile *file)
{
  hfsvol *vol = file->vol;
  ExtDataRec *extrec;
  unsigned long *lglen, *pylen, alblksz, newpylen;
  unsigned int dlen, start, end;
  node n;
  int i;

  if (vol->flags & HFS_VOL_READONLY)
    goto done;

  f_getptrs(file, &extrec, &lglen, &pylen);

  alblksz  = vol->mdb.drAlBlkSiz;
  newpylen = (*lglen / alblksz + (*lglen % alblksz != 0)) * alblksz;

  if (newpylen > *pylen)
    ERROR(EIO, "file size exceeds physical length");
  else if (newpylen == *pylen)
    goto done;

  dlen  = (*pylen - newpylen) / alblksz;

  start = file->fabn;
  end   = newpylen / alblksz;

  if (start >= end)
    {
      start = file->fabn = 0;
      memcpy(&file->ext, extrec, sizeof(ExtDataRec));
    }

  n.nnum = 0;
  i      = -1;

  while (start < end)
    {
      for (i = 0; i < 3; ++i)
	{
	  unsigned int num;

	  num    = file->ext[i].xdrNumABlks;
	  start += num;

	  if (start >= end)
	    break;
	  else if (num == 0)
	    ERROR(EIO, "empty file extent");
	}

      if (start >= end)
	break;

      if (v_extsearch(file, start, &file->ext, &n) <= 0)
	goto fail;

      file->fabn = start;
    }

  if (start > end)
    {
      ExtDescriptor blocks;

      file->ext[i].xdrNumABlks -= start - end;
      dlen -= start - end;

      blocks.xdrStABN    = file->ext[i].xdrStABN + file->ext[i].xdrNumABlks;
      blocks.xdrNumABlks = start - end;

      if (v_freeblocks(vol, &blocks) == -1)
	goto fail;
    }

  *pylen = newpylen;

  file->flags |= HFS_FILE_UPDATE_CATREC;

  do
    {
      while (dlen && ++i < 3)
	{
	  unsigned int num;

	  num    = file->ext[i].xdrNumABlks;
	  start += num;

	  if (num == 0)
	    ERROR(EIO, "empty file extent");
	  else if (num > dlen)
	    ERROR(EIO, "file extents exceed physical size");

	  dlen -= num;

	  if (v_freeblocks(vol, &file->ext[i]) == -1)
	    goto fail;

	  file->ext[i].xdrStABN    = 0;
	  file->ext[i].xdrNumABlks = 0;
	}

      if (file->fabn)
	{
	  if (n.nnum == 0 &&
	      v_extsearch(file, file->fabn, 0, &n) <= 0)
	    goto fail;

	  if (file->ext[0].xdrNumABlks)
	    {
	      if (v_putextrec(&file->ext, &n) == -1)
		goto fail;
	    }
	  else
	    {
	      if (bt_delete(&vol->ext, HFS_NODEREC(n, n.rnum)) == -1)
		goto fail;

	      n.nnum = 0;
	    }
	}
      else
	memcpy(extrec, &file->ext, sizeof(ExtDataRec));

      if (dlen)
	{
	  if (v_extsearch(file, start, &file->ext, &n) <= 0)
	    goto fail;

	  file->fabn = start;
	  i = -1;
	}
    }
  while (dlen);

done:
  return 0;

fail:
  return -1;
}

/*
 * NAME:	file->flush()
 * DESCRIPTION:	flush all pending changes to an open file
 */
int f_flush(hfsfile *file)
{
  hfsvol *vol = file->vol;

  if (vol->flags & HFS_VOL_READONLY)
    goto done;

  if (file->flags & HFS_FILE_UPDATE_CATREC)
    {
      node n;

      file->cat.u.fil.filStBlk  = file->cat.u.fil.filExtRec[0].xdrStABN;
      file->cat.u.fil.filRStBlk = file->cat.u.fil.filRExtRec[0].xdrStABN;

      if (v_catsearch(vol, file->parid, file->name, 0, 0, &n) <= 0 ||
	  v_putcatrec(&file->cat, &n) == -1)
	goto fail;

      file->flags &= ~HFS_FILE_UPDATE_CATREC;
    }

done:
  return 0;

fail:
  return -1;
}
