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
 * $Id: volume.c,v 1.12 1998/11/02 22:09:10 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>
# include <time.h>
# include <errno.h>

# include "libhfs.h"
# include "volume.h"
# include "data.h"
# include "block.h"
# include "low.h"
# include "medium.h"
# include "file.h"
# include "btree.h"
# include "record.h"
# include "os.h"

/*
 * NAME:	vol->init()
 * DESCRIPTION:	initialize volume structure
 */
void v_init(hfsvol *vol, int flags)
{
  btree *ext = &vol->ext;
  btree *cat = &vol->cat;

  vol->priv       = 0;
  vol->flags      = flags & HFS_VOL_OPT_MASK;

  vol->pnum       = -1;
  vol->vstart     = 0;
  vol->vlen       = 0;
  vol->lpa        = 0;

  vol->cache      = 0;

  vol->vbm        = 0;
  vol->vbmsz      = 0;

  f_init(&ext->f, vol, HFS_CNID_EXT, "extents overflow");

  ext->map        = 0;
  ext->mapsz      = 0;
  ext->flags      = 0;

  ext->keyunpack  = (keyunpackfunc)  r_unpackextkey;
  ext->keycompare = (keycomparefunc) r_compareextkeys;

  f_init(&cat->f, vol, HFS_CNID_CAT, "catalog");

  cat->map        = 0;
  cat->mapsz      = 0;
  cat->flags      = 0;

  cat->keyunpack  = (keyunpackfunc)  r_unpackcatkey;
  cat->keycompare = (keycomparefunc) r_comparecatkeys;

  vol->cwd        = HFS_CNID_ROOTDIR;

  vol->refs       = 0;
  vol->files      = 0;
  vol->dirs       = 0;

  vol->prev       = 0;
  vol->next       = 0;
}

/*
 * NAME:	vol->open()
 * DESCRIPTION:	open volume source and lock against concurrent updates
 */
int v_open(hfsvol *vol, const char *path, int mode)
{
  if (vol->flags & HFS_VOL_OPEN)
    ERROR(EINVAL, "volume already open");

  if (os_open(&vol->priv, path, mode) == -1)
    goto fail;

  vol->flags |= HFS_VOL_OPEN;

  /* initialize volume block cache (OK to fail) */

  if (! (vol->flags & HFS_OPT_NOCACHE) &&
      b_init(vol) != -1)
    vol->flags |= HFS_VOL_USINGCACHE;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	flushvol()
 * DESCRIPTION:	flush all pending changes (B*-tree, MDB, VBM) to volume
 */
static
int flushvol(hfsvol *vol, int umount)
{
  if (vol->flags & HFS_VOL_READONLY)
    goto done;

  if ((vol->ext.flags & HFS_BT_UPDATE_HDR) &&
      bt_writehdr(&vol->ext) == -1)
    goto fail;

  if ((vol->cat.flags & HFS_BT_UPDATE_HDR) &&
      bt_writehdr(&vol->cat) == -1)
    goto fail;

  if ((vol->flags & HFS_VOL_UPDATE_VBM) &&
      v_writevbm(vol) == -1)
    goto fail;

  if (umount && ! (vol->mdb.drAtrb & HFS_ATRB_UMOUNTED))
    {
      vol->mdb.drAtrb |= HFS_ATRB_UMOUNTED;
      vol->flags |= HFS_VOL_UPDATE_MDB;
    }

  if ((vol->flags & (HFS_VOL_UPDATE_MDB | HFS_VOL_UPDATE_ALTMDB)) &&
      v_writemdb(vol) == -1)
    goto fail;

done:
  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->flush()
 * DESCRIPTION:	commit all pending changes to volume device
 */
int v_flush(hfsvol *vol)
{
  if (flushvol(vol, 0) == -1)
    goto fail;

  if ((vol->flags & HFS_VOL_USINGCACHE) &&
      b_flush(vol) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->close()
 * DESCRIPTION:	close access path to volume source
 */
int v_close(hfsvol *vol)
{
  int result = 0;

  if (! (vol->flags & HFS_VOL_OPEN))
    goto done;

  if ((vol->flags & HFS_VOL_MOUNTED) &&
      flushvol(vol, 1) == -1)
    result = -1;

  if ((vol->flags & HFS_VOL_USINGCACHE) &&
      b_finish(vol) == -1)
    result = -1;

  if (os_close(&vol->priv) == -1)
    result = -1;

  vol->flags &= ~(HFS_VOL_OPEN | HFS_VOL_MOUNTED | HFS_VOL_USINGCACHE);

  /* free dynamically allocated structures */

  FREE(vol->vbm);

  vol->vbm   = 0;
  vol->vbmsz = 0;

  FREE(vol->ext.map);
  FREE(vol->cat.map);

  vol->ext.map = 0;
  vol->cat.map = 0;

done:
  return result;
}

/*
 * NAME:	vol->same()
 * DESCRIPTION:	return 1 iff path is same as open volume
 */
int v_same(hfsvol *vol, const char *path)
{
  return os_same(&vol->priv, path);
}

/*
 * NAME:	vol->geometry()
 * DESCRIPTION:	determine volume location and size (possibly in a partition)
 */
int v_geometry(hfsvol *vol, int pnum)
{
  Partition map;
  unsigned long bnum = 0;
  int found;

  vol->pnum = pnum;

  if (pnum == 0)
    {
      vol->vstart = 0;
      vol->vlen   = b_size(vol);

      if (vol->vlen == 0)
	goto fail;
    }
  else
    {
      while (pnum--)
	{
	  found = m_findpmentry(vol, "Apple_HFS", &map, &bnum);
	  if (found == -1 || ! found)
	    goto fail;
	}

      vol->vstart = map.pmPyPartStart;
      vol->vlen   = map.pmPartBlkCnt;

      if (map.pmDataCnt)
	{
	  if ((unsigned long) map.pmLgDataStart +
	      (unsigned long) map.pmDataCnt > vol->vlen)
	    ERROR(EINVAL, "partition data overflows partition");

	  vol->vstart += (unsigned long) map.pmLgDataStart;
	  vol->vlen    = map.pmDataCnt;
	}

      if (vol->vlen == 0)
	ERROR(EINVAL, "volume partition is empty");
    }

  if (vol->vlen < 800 * (1024 >> HFS_BLOCKSZ_BITS))
    ERROR(EINVAL, "volume is smaller than 800K");

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->readmdb()
 * DESCRIPTION:	load Master Directory Block into memory
 */
int v_readmdb(hfsvol *vol)
{
  if (l_getmdb(vol, &vol->mdb, 0) == -1)
    goto fail;

  if (vol->mdb.drSigWord != HFS_SIGWORD)
    {
      if (vol->mdb.drSigWord == HFS_SIGWORD_MFS)
	ERROR(EINVAL, "MFS volume format not supported");
      else
	ERROR(EINVAL, "not a Macintosh HFS volume");
    }

  if (vol->mdb.drAlBlkSiz % HFS_BLOCKSZ != 0)
    ERROR(EINVAL, "bad volume allocation block size");

  vol->lpa = vol->mdb.drAlBlkSiz >> HFS_BLOCKSZ_BITS;

  /* extents pseudo-file structs */

  vol->ext.f.cat.u.fil.filStBlk = vol->mdb.drXTExtRec[0].xdrStABN;
  vol->ext.f.cat.u.fil.filLgLen = vol->mdb.drXTFlSize;
  vol->ext.f.cat.u.fil.filPyLen = vol->mdb.drXTFlSize;

  vol->ext.f.cat.u.fil.filCrDat = vol->mdb.drCrDate;
  vol->ext.f.cat.u.fil.filMdDat = vol->mdb.drLsMod;

  memcpy(&vol->ext.f.cat.u.fil.filExtRec,
	 &vol->mdb.drXTExtRec, sizeof(ExtDataRec));

  f_selectfork(&vol->ext.f, fkData);

  /* catalog pseudo-file structs */

  vol->cat.f.cat.u.fil.filStBlk = vol->mdb.drCTExtRec[0].xdrStABN;
  vol->cat.f.cat.u.fil.filLgLen = vol->mdb.drCTFlSize;
  vol->cat.f.cat.u.fil.filPyLen = vol->mdb.drCTFlSize;

  vol->cat.f.cat.u.fil.filCrDat = vol->mdb.drCrDate;
  vol->cat.f.cat.u.fil.filMdDat = vol->mdb.drLsMod;

  memcpy(&vol->cat.f.cat.u.fil.filExtRec,
	 &vol->mdb.drCTExtRec, sizeof(ExtDataRec));

  f_selectfork(&vol->cat.f, fkData);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->writemdb()
 * DESCRIPTION:	flush Master Directory Block to medium
 */
int v_writemdb(hfsvol *vol)
{
  vol->mdb.drLsMod = d_mtime(time(0));

  vol->mdb.drXTFlSize = vol->ext.f.cat.u.fil.filPyLen;
  memcpy(&vol->mdb.drXTExtRec,
	 &vol->ext.f.cat.u.fil.filExtRec, sizeof(ExtDataRec));

  vol->mdb.drCTFlSize = vol->cat.f.cat.u.fil.filPyLen;
  memcpy(&vol->mdb.drCTExtRec,
	 &vol->cat.f.cat.u.fil.filExtRec, sizeof(ExtDataRec));

  if (l_putmdb(vol, &vol->mdb, vol->flags & HFS_VOL_UPDATE_ALTMDB) == -1)
    goto fail;

  vol->flags &= ~(HFS_VOL_UPDATE_MDB | HFS_VOL_UPDATE_ALTMDB);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->readvbm()
 * DESCRIPTION:	read volume bitmap into memory
 */
int v_readvbm(hfsvol *vol)
{
  unsigned int vbmst = vol->mdb.drVBMSt;
  unsigned int vbmsz = (vol->mdb.drNmAlBlks + 0x0fff) >> 12;
  block *bp;

  ASSERT(vol->vbm == 0);

  if (vol->mdb.drAlBlSt - vbmst < vbmsz)
    ERROR(EIO, "volume bitmap collides with volume data");

  vol->vbm = ALLOC(block, vbmsz);
  if (vol->vbm == 0)
    ERROR(ENOMEM, 0);

  vol->vbmsz = vbmsz;

  for (bp = vol->vbm; vbmsz--; ++bp)
    {
      if (b_readlb(vol, vbmst++, bp) == -1)
	goto fail;
    }

  return 0;

fail:
  FREE(vol->vbm);

  vol->vbm   = 0;
  vol->vbmsz = 0;

  return -1;
}

/*
 * NAME:	vol->writevbm()
 * DESCRIPTION:	flush volume bitmap to medium
 */
int v_writevbm(hfsvol *vol)
{
  unsigned int vbmst = vol->mdb.drVBMSt;
  unsigned int vbmsz = vol->vbmsz;
  const block *bp;

  for (bp = vol->vbm; vbmsz--; ++bp)
    {
      if (b_writelb(vol, vbmst++, bp) == -1)
	goto fail;
    }

  vol->flags &= ~HFS_VOL_UPDATE_VBM;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->mount()
 * DESCRIPTION:	load volume information into memory
 */
int v_mount(hfsvol *vol)
{
  /* read the MDB, volume bitmap, and extents/catalog B*-tree headers */

  if (v_readmdb(vol) == -1 ||
      v_readvbm(vol) == -1 ||
      bt_readhdr(&vol->ext) == -1 ||
      bt_readhdr(&vol->cat) == -1)
    goto fail;

  if (! (vol->mdb.drAtrb & HFS_ATRB_UMOUNTED) &&
      v_scavenge(vol) == -1)
    goto fail;

  if (vol->mdb.drAtrb & HFS_ATRB_SLOCKED)
    vol->flags |= HFS_VOL_READONLY;
  else if (vol->flags & HFS_VOL_READONLY)
    vol->mdb.drAtrb |= HFS_ATRB_HLOCKED;
  else
    vol->mdb.drAtrb &= ~HFS_ATRB_HLOCKED;

  vol->flags |= HFS_VOL_MOUNTED;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->dirty()
 * DESCRIPTION:	ensure the volume is marked "in use" before we make changes
 */
int v_dirty(hfsvol *vol)
{
  if (vol->mdb.drAtrb & HFS_ATRB_UMOUNTED)
    {
      vol->mdb.drAtrb &= ~HFS_ATRB_UMOUNTED;
      ++vol->mdb.drWrCnt;

      if (v_writemdb(vol) == -1)
	goto fail;

      if ((vol->flags & HFS_VOL_USINGCACHE) &&
	  b_flush(vol) == -1)
	goto fail;
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->catsearch()
 * DESCRIPTION:	search catalog tree
 */
int v_catsearch(hfsvol *vol, unsigned long parid, const char *name,
		CatDataRec *data, char *cname, node *np)
{
  CatKeyRec key;
  byte pkey[HFS_CATKEYLEN];
  const byte *ptr;
  node n;
  int found;

  if (np == 0)
    np = &n;

  r_makecatkey(&key, parid, name);
  r_packcatkey(&key, pkey, 0);

  found = bt_search(&vol->cat, pkey, np);
  if (found <= 0)
    return found;

  ptr = HFS_NODEREC(*np, np->rnum);

  if (cname)
    {
      r_unpackcatkey(ptr, &key);
      strcpy(cname, key.ckrCName);
    }

  if (data)
    r_unpackcatdata(HFS_RECDATA(ptr), data);

  return 1;
}

/*
 * NAME:	vol->extsearch()
 * DESCRIPTION:	search extents tree
 */
int v_extsearch(hfsfile *file, unsigned int fabn,
		ExtDataRec *data, node *np)
{
  ExtKeyRec key;
  ExtDataRec extsave;
  unsigned int fabnsave;
  byte pkey[HFS_EXTKEYLEN];
  const byte *ptr;
  node n;
  int found;

  if (np == 0)
    np = &n;

  r_makeextkey(&key, file->fork, file->cat.u.fil.filFlNum, fabn);
  r_packextkey(&key, pkey, 0);

  /* in case bt_search() clobbers these */

  memcpy(&extsave, &file->ext, sizeof(ExtDataRec));
  fabnsave = file->fabn;

  found = bt_search(&file->vol->ext, pkey, np);

  memcpy(&file->ext, &extsave, sizeof(ExtDataRec));
  file->fabn = fabnsave;

  if (found <= 0)
    return found;

  if (data)
    {
      ptr = HFS_NODEREC(*np, np->rnum);
      r_unpackextdata(HFS_RECDATA(ptr), data);
    }

  return 1;
}

/*
 * NAME:	vol->getthread()
 * DESCRIPTION:	retrieve catalog thread information for a file or directory
 */
int v_getthread(hfsvol *vol, unsigned long id,
		CatDataRec *thread, node *np, int type)
{
  CatDataRec rec;
  int found;

  if (thread == 0)
    thread = &rec;

  found = v_catsearch(vol, id, "", thread, 0, np);
  if (found == 1 && thread->cdrType != type)
    ERROR(EIO, "bad thread record");

  return found;

fail:
  return -1;
}

/*
 * NAME:	vol->putcatrec()
 * DESCRIPTION:	store catalog information
 */
int v_putcatrec(const CatDataRec *data, node *np)
{
  byte pdata[HFS_CATDATALEN], *ptr;
  unsigned int len = 0;

  r_packcatdata(data, pdata, &len);

  ptr = HFS_NODEREC(*np, np->rnum);
  memcpy(HFS_RECDATA(ptr), pdata, len);

  return bt_putnode(np);
}

/*
 * NAME:	vol->putextrec()
 * DESCRIPTION:	store extent information
 */
int v_putextrec(const ExtDataRec *data, node *np)
{
  byte pdata[HFS_EXTDATALEN], *ptr;
  unsigned int len = 0;

  r_packextdata(data, pdata, &len);

  ptr = HFS_NODEREC(*np, np->rnum);
  memcpy(HFS_RECDATA(ptr), pdata, len);

  return bt_putnode(np);
}

/*
 * NAME:	vol->allocblocks()
 * DESCRIPTION:	allocate a contiguous range of blocks
 */
int v_allocblocks(hfsvol *vol, ExtDescriptor *blocks)
{
  unsigned int request, found, foundat, start, end;
  register unsigned int pt;
  block *vbm;
  int wrap = 0;

  if (vol->mdb.drFreeBks == 0)
    ERROR(ENOSPC, "volume full");

  request = blocks->xdrNumABlks;
  found   = 0;
  foundat = 0;
  start   = vol->mdb.drAllocPtr;
  end     = vol->mdb.drNmAlBlks;
  vbm     = vol->vbm;

  ASSERT(request > 0);

  /* backtrack the start pointer to recover unused space */

  if (! BMTST(vbm, start))
    {
      while (start > 0 && ! BMTST(vbm, start - 1))
	--start;
    }

  /* find largest unused block which satisfies request */

  pt = start;

  while (1)
    {
      unsigned int mark;

      /* skip blocks in use */

      while (pt < end && BMTST(vbm, pt))
	++pt;

      if (wrap && pt >= start)
	break;

      /* count blocks not in use */

      mark = pt;
      while (pt < end && pt - mark < request && ! BMTST(vbm, pt))
	++pt;

      if (pt - mark > found)
	{
	  found   = pt - mark;
	  foundat = mark;
	}

      if (wrap && pt >= start)
	break;

      if (pt == end)
	pt = 0, wrap = 1;

      if (found == request)
	break;
    }

  if (found == 0 || found > vol->mdb.drFreeBks)
    ERROR(EIO, "bad volume bitmap or free block count");

  blocks->xdrStABN    = foundat;
  blocks->xdrNumABlks = found;

  if (v_dirty(vol) == -1)
    goto fail;

  vol->mdb.drAllocPtr = pt;
  vol->mdb.drFreeBks -= found;

  for (pt = foundat; pt < foundat + found; ++pt)
    BMSET(vbm, pt);

  vol->flags |= HFS_VOL_UPDATE_MDB | HFS_VOL_UPDATE_VBM;

  if (vol->flags & HFS_OPT_ZERO)
    {
      block b;
      unsigned int i;

      memset(&b, 0, sizeof(b));

      for (pt = foundat; pt < foundat + found; ++pt)
	{
	  for (i = 0; i < vol->lpa; ++i)
	    b_writeab(vol, pt, i, &b);
	}
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->freeblocks()
 * DESCRIPTION:	deallocate a contiguous range of blocks
 */
int v_freeblocks(hfsvol *vol, const ExtDescriptor *blocks)
{
  unsigned int start, len, pt;
  block *vbm;

  start = blocks->xdrStABN;
  len   = blocks->xdrNumABlks;
  vbm   = vol->vbm;

  if (v_dirty(vol) == -1)
    goto fail;

  vol->mdb.drFreeBks += len;

  for (pt = start; pt < start + len; ++pt)
    BMCLR(vbm, pt);

  vol->flags |= HFS_VOL_UPDATE_MDB | HFS_VOL_UPDATE_VBM;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	vol->resolve()
 * DESCRIPTION:	translate a pathname; return catalog information
 */
int v_resolve(hfsvol **vol, const char *path,
	      CatDataRec *data, long *parid, char *fname, node *np)
{
  unsigned long dirid;
  char name[HFS_MAX_FLEN + 1], *nptr;
  int found = 0;

  if (*path == 0)
    ERROR(ENOENT, "empty path");

  if (parid)
    *parid = 0;

  nptr = strchr(path, ':');

  if (*path == ':' || nptr == 0)
    {
      dirid = (*vol)->cwd;  /* relative path */

      if (*path == ':')
	++path;

      if (*path == 0)
	{
	  found = v_getdthread(*vol, dirid, data, 0);
	  if (found == -1)
	    goto fail;

	  if (found)
	    {
	      if (parid)
		*parid = data->u.dthd.thdParID;

	      found = v_catsearch(*vol, data->u.dthd.thdParID,
				  data->u.dthd.thdCName, data, fname, np);
	      if (found == -1)
		goto fail;
	    }

	  goto done;
	}
    }
  else
    {
      hfsvol *check;

      dirid = HFS_CNID_ROOTPAR;  /* absolute path */

      if (nptr - path > HFS_MAX_VLEN)
	ERROR(ENAMETOOLONG, 0);

      strncpy(name, path, nptr - path);
      name[nptr - path] = 0;

      for (check = hfs_mounts; check; check = check->next)
	{
	  if (d_relstring(check->mdb.drVN, name) == 0)
	    {
	      *vol = check;
	      break;
	    }
	}
    }

  while (1)
    {
      while (*path == ':')
	{
	  ++path;

	  found = v_getdthread(*vol, dirid, data, 0);
	  if (found == -1)
	    goto fail;
	  else if (! found)
	    goto done;

	  dirid = data->u.dthd.thdParID;
	}

      if (*path == 0)
	{
	  found = v_getdthread(*vol, dirid, data, 0);
	  if (found == -1)
	    goto fail;

	  if (found)
	    {
	      if (parid)
		*parid = data->u.dthd.thdParID;

	      found = v_catsearch(*vol, data->u.dthd.thdParID,
				  data->u.dthd.thdCName, data, fname, np);
	      if (found == -1)
		goto fail;
	    }

	  goto done;
	}

      nptr = name;
      while (nptr < name + sizeof(name) - 1 && *path && *path != ':')
	*nptr++ = *path++;

      if (*path && *path != ':')
	ERROR(ENAMETOOLONG, 0);

      *nptr = 0;
      if (*path == ':')
	++path;

      if (parid)
	*parid = dirid;

      found = v_catsearch(*vol, dirid, name, data, fname, np);
      if (found == -1)
	goto fail;

      if (! found)
	{
	  if (*path && parid)
	    *parid = 0;

	  if (*path == 0 && fname)
	    strcpy(fname, name);

	  goto done;
	}

      switch (data->cdrType)
	{
	case cdrDirRec:
	  if (*path == 0)
	    goto done;

	  dirid = data->u.dir.dirDirID;
	  break;

	case cdrFilRec:
	  if (*path == 0)
	    goto done;

	  ERROR(ENOTDIR, "invalid pathname");

	default:
	  ERROR(EIO, "unexpected catalog record");
	}
    }

done:
  return found;

fail:
  return -1;
}

/*
 * NAME:	vol->adjvalence()
 * DESCRIPTION:	update a volume's valence counts
 */
int v_adjvalence(hfsvol *vol, unsigned long parid, int isdir, int adj)
{
  node n;
  CatDataRec data;
  int result = 0;

  if (isdir)
    vol->mdb.drDirCnt += adj;
  else
    vol->mdb.drFilCnt += adj;

  vol->flags |= HFS_VOL_UPDATE_MDB;

  if (parid == HFS_CNID_ROOTDIR)
    {
      if (isdir)
	vol->mdb.drNmRtDirs += adj;
      else
	vol->mdb.drNmFls    += adj;
    }
  else if (parid == HFS_CNID_ROOTPAR)
    goto done;

  if (v_getdthread(vol, parid, &data, 0) <= 0 ||
      v_catsearch(vol, data.u.dthd.thdParID, data.u.dthd.thdCName,
		  &data, 0, &n) <= 0 ||
      data.cdrType != cdrDirRec)
    ERROR(EIO, "can't find parent directory");

  data.u.dir.dirVal  += adj;
  data.u.dir.dirMdDat = d_mtime(time(0));

  result = v_putcatrec(&data, &n);

done:
  return result;

fail:
  return -1;
}

/*
 * NAME:	vol->mkdir()
 * DESCRIPTION:	create a new HFS directory
 */
int v_mkdir(hfsvol *vol, unsigned long parid, const char *name)
{
  CatKeyRec key;
  CatDataRec data;
  unsigned long id;
  byte record[HFS_MAX_CATRECLEN];
  unsigned int reclen;
  int i;

  if (bt_space(&vol->cat, 2) == -1)
    goto fail;

  id = vol->mdb.drNxtCNID++;
  vol->flags |= HFS_VOL_UPDATE_MDB;

  /* create directory record */

  data.cdrType   = cdrDirRec;
  data.cdrResrv2 = 0;

  data.u.dir.dirFlags = 0;
  data.u.dir.dirVal   = 0;
  data.u.dir.dirDirID = id;
  data.u.dir.dirCrDat = d_mtime(time(0));
  data.u.dir.dirMdDat = data.u.dir.dirCrDat;
  data.u.dir.dirBkDat = 0;

  memset(&data.u.dir.dirUsrInfo,  0, sizeof(data.u.dir.dirUsrInfo));
  memset(&data.u.dir.dirFndrInfo, 0, sizeof(data.u.dir.dirFndrInfo));
  for (i = 0; i < 4; ++i)
    data.u.dir.dirResrv[i] = 0;

  r_makecatkey(&key, parid, name);
  r_packcatrec(&key, &data, record, &reclen);

  if (bt_insert(&vol->cat, record, reclen) == -1)
    goto fail;

  /* create thread record */

  data.cdrType   = cdrThdRec;
  data.cdrResrv2 = 0;

  data.u.dthd.thdResrv[0] = 0;
  data.u.dthd.thdResrv[1] = 0;
  data.u.dthd.thdParID    = parid;
  strcpy(data.u.dthd.thdCName, name);

  r_makecatkey(&key, id, "");
  r_packcatrec(&key, &data, record, &reclen);

  if (bt_insert(&vol->cat, record, reclen) == -1 ||
      v_adjvalence(vol, parid, 1, 1) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	markexts()
 * DESCRIPTION:	set bits from an extent record in the volume bitmap
 */
static
void markexts(block *vbm, const ExtDataRec *exts)
{
  int i;
  unsigned int pt, len;

  for (i = 0; i < 3; ++i)
    {
      for ( pt = (*exts)[i].xdrStABN,
	   len = (*exts)[i].xdrNumABlks; len--; ++pt)
	BMSET(vbm, pt);
    }
}

/*
 * NAME:	vol->scavenge()
 * DESCRIPTION:	safeguard blocks in the volume bitmap
 */
int v_scavenge(hfsvol *vol)
{
  block *vbm = vol->vbm;
  node n;
  unsigned int pt, blks;
  unsigned long lastcnid = 15;

# ifdef DEBUG
  fprintf(stderr, "VOL: \"%s\" not cleanly unmounted\n",
	  vol->mdb.drVN);
# endif

  if (vol->flags & HFS_VOL_READONLY)
    goto done;

# ifdef DEBUG
  fprintf(stderr, "VOL: scavenging...\n");
# endif

  /* reset MDB by marking it dirty again */

  vol->mdb.drAtrb |= HFS_ATRB_UMOUNTED;
  if (v_dirty(vol) == -1)
    goto fail;

  /* begin by marking extents in MDB */

  markexts(vbm, &vol->mdb.drXTExtRec);
  markexts(vbm, &vol->mdb.drCTExtRec);

  vol->flags |= HFS_VOL_UPDATE_VBM;

  /* scavenge the extents overflow file */

  if (vol->ext.hdr.bthFNode > 0)
    {
      if (bt_getnode(&n, &vol->ext, vol->ext.hdr.bthFNode) == -1)
	goto fail;

      n.rnum = 0;

      while (1)
	{
	  ExtDataRec data;
	  const byte *ptr;

	  while (n.rnum >= n.nd.ndNRecs && n.nd.ndFLink > 0)
	    {
	      if (bt_getnode(&n, &vol->ext, n.nd.ndFLink) == -1)
		goto fail;

	      n.rnum = 0;
	    }

	  if (n.rnum >= n.nd.ndNRecs && n.nd.ndFLink == 0)
	    break;

	  ptr = HFS_NODEREC(n, n.rnum);
	  r_unpackextdata(HFS_RECDATA(ptr), &data);

	  markexts(vbm, &data);

	  ++n.rnum;
	}
    }

  /* scavenge the catalog file */

  if (vol->cat.hdr.bthFNode > 0)
    {
      if (bt_getnode(&n, &vol->cat, vol->cat.hdr.bthFNode) == -1)
	goto fail;

      n.rnum = 0;

      while (1)
	{
	  CatDataRec data;
	  const byte *ptr;

	  while (n.rnum >= n.nd.ndNRecs && n.nd.ndFLink > 0)
	    {
	      if (bt_getnode(&n, &vol->cat, n.nd.ndFLink) == -1)
		goto fail;

	      n.rnum = 0;
	    }

	  if (n.rnum >= n.nd.ndNRecs && n.nd.ndFLink == 0)
	    break;

	  ptr = HFS_NODEREC(n, n.rnum);
	  r_unpackcatdata(HFS_RECDATA(ptr), &data);

	  switch (data.cdrType)
	    {
	    case cdrFilRec:
	      markexts(vbm, &data.u.fil.filExtRec);
	      markexts(vbm, &data.u.fil.filRExtRec);

	      if (data.u.fil.filFlNum > lastcnid)
		lastcnid = data.u.fil.filFlNum;
	      break;

	    case cdrDirRec:
	      if (data.u.dir.dirDirID > lastcnid)
		lastcnid = data.u.dir.dirDirID;
	      break;
	    }

	  ++n.rnum;
	}
    }

  /* count free blocks */

  for (blks = 0, pt = vol->mdb.drNmAlBlks; pt--; )
    {
      if (! BMTST(vbm, pt))
	++blks;
    }

  if (vol->mdb.drFreeBks != blks)
    {
# ifdef DEBUG
      fprintf(stderr, "VOL: updating free blocks from %u to %u\n",
	      vol->mdb.drFreeBks, blks);
# endif

      vol->mdb.drFreeBks = blks;
      vol->flags |= HFS_VOL_UPDATE_MDB;
    }

  /* ensure next CNID is sane */

  if ((unsigned long) vol->mdb.drNxtCNID <= lastcnid)
    {
# ifdef DEBUG
      fprintf(stderr, "VOL: updating next CNID from %lu to %lu\n",
	      vol->mdb.drNxtCNID, lastcnid + 1);
# endif

      vol->mdb.drNxtCNID = lastcnid + 1;
      vol->flags |= HFS_VOL_UPDATE_MDB;
    }

# ifdef DEBUG
  fprintf(stderr, "VOL: scavenging complete\n");
# endif

done:
  return 0;

fail:
  return -1;
}
