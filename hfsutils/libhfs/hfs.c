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
 * $Id: hfs.c,v 1.15 1998/11/02 22:09:00 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>
# include <time.h>
# include <errno.h>

# include "libhfs.h"
# include "data.h"
# include "block.h"
# include "medium.h"
# include "file.h"
# include "btree.h"
# include "node.h"
# include "record.h"
# include "volume.h"

const char *hfs_error = "no error";	/* static error string */

hfsvol *hfs_mounts;			/* linked list of mounted volumes */

static
hfsvol *curvol;				/* current volume */

/*
 * NAME:	validvname()
 * DESCRIPTION:	return true if parameter is a valid volume name
 */
static
int validvname(const char *name)
{
  int len;

  len = strlen(name);
  if (len < 1)
    ERROR(EINVAL, "volume name cannot be empty");
  else if (len > HFS_MAX_VLEN)
    ERROR(ENAMETOOLONG,
	  "volume name can be at most " STR(HFS_MAX_VLEN) " chars");

  if (strchr(name, ':'))
    ERROR(EINVAL, "volume name may not contain colons");

  return 1;

fail:
  return 0;
}

/*
 * NAME:	getvol()
 * DESCRIPTION:	validate a volume reference
 */
static
int getvol(hfsvol **vol)
{
  if (*vol == 0)
    {
      if (curvol == 0)
	ERROR(EINVAL, "no volume is current");

      *vol = curvol;
    }

  return 0;

fail:
  return -1;
}

/* High-Level Volume Routines ============================================== */

/*
 * NAME:	hfs->mount()
 * DESCRIPTION:	open an HFS volume; return volume descriptor or 0 (error)
 */
hfsvol *hfs_mount(const char *path, int pnum, int mode)
{
  hfsvol *vol, *check;

  /* see if the volume is already mounted */

  for (check = hfs_mounts; check; check = check->next)
    {
      if (check->pnum == pnum && v_same(check, path) == 1)
	{
	  /* verify compatible read/write mode */

	  if (((check->flags & HFS_VOL_READONLY) &&
	       ! (mode & HFS_MODE_RDWR)) ||
	      (! (check->flags & HFS_VOL_READONLY) &&
	       (mode & (HFS_MODE_RDWR | HFS_MODE_ANY))))
	    {
	      vol = check;
	      goto done;
	    }
	}
    }

  vol = ALLOC(hfsvol, 1);
  if (vol == 0)
    ERROR(ENOMEM, 0);

  v_init(vol, mode);

  /* open the medium */

  switch (mode & HFS_MODE_MASK)
    {
    case HFS_MODE_RDWR:
    case HFS_MODE_ANY:
      if (v_open(vol, path, HFS_MODE_RDWR) != -1)
	break;

      if ((mode & HFS_MODE_MASK) == HFS_MODE_RDWR)
	goto fail;

    case HFS_MODE_RDONLY:
    default:
      vol->flags |= HFS_VOL_READONLY;

      if (v_open(vol, path, HFS_MODE_RDONLY) == -1)
	goto fail;
    }

  /* mount the volume */

  if (v_geometry(vol, pnum) == -1 ||
      v_mount(vol) == -1)
    goto fail;

  /* add to linked list of volumes */

  vol->prev = 0;
  vol->next = hfs_mounts;

  if (hfs_mounts)
    hfs_mounts->prev = vol;

  hfs_mounts = vol;

done:
  ++vol->refs;
  curvol = vol;

  return vol;

fail:
  if (vol)
    {
      v_close(vol);
      FREE(vol);
    }

  return 0;
}

/*
 * NAME:	hfs->flush()
 * DESCRIPTION:	flush all pending changes to an HFS volume
 */
int hfs_flush(hfsvol *vol)
{
  hfsfile *file;

  if (getvol(&vol) == -1)
    goto fail;

  for (file = vol->files; file; file = file->next)
    {
      if (f_flush(file) == -1)
	goto fail;
    }

  if (v_flush(vol) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->flushall()
 * DESCRIPTION:	flush all pending changes to all mounted HFS volumes
 */
void hfs_flushall(void)
{
  hfsvol *vol;

  for (vol = hfs_mounts; vol; vol = vol->next)
    hfs_flush(vol);
}

/*
 * NAME:	hfs->umount()
 * DESCRIPTION:	close an HFS volume
 */
int hfs_umount(hfsvol *vol)
{
  int result = 0;

  if (getvol(&vol) == -1)
    goto fail;

  if (--vol->refs)
    {
      result = v_flush(vol);
      goto done;
    }

  /* close all open files and directories */

  while (vol->files)
    {
      if (hfs_close(vol->files) == -1)
	result = -1;
    }

  while (vol->dirs)
    {
      if (hfs_closedir(vol->dirs) == -1)
	result = -1;
    }

  /* close medium */

  if (v_close(vol) == -1)
    result = -1;

  /* remove from linked list of volumes */

  if (vol->prev)
    vol->prev->next = vol->next;
  if (vol->next)
    vol->next->prev = vol->prev;

  if (vol == hfs_mounts)
    hfs_mounts = vol->next;
  if (vol == curvol)
    curvol = 0;

  FREE(vol);

done:
  return result;

fail:
  return -1;
}

/*
 * NAME:	hfs->umountall()
 * DESCRIPTION:	unmount all mounted volumes
 */
void hfs_umountall(void)
{
  while (hfs_mounts)
    hfs_umount(hfs_mounts);
}

/*
 * NAME:	hfs->getvol()
 * DESCRIPTION:	return a pointer to a mounted volume
 */
hfsvol *hfs_getvol(const char *name)
{
  hfsvol *vol;

  if (name == 0)
    return curvol;

  for (vol = hfs_mounts; vol; vol = vol->next)
    {
      if (d_relstring(name, vol->mdb.drVN) == 0)
	return vol;
    }

  return 0;
}

/*
 * NAME:	hfs->setvol()
 * DESCRIPTION:	change the current volume
 */
void hfs_setvol(hfsvol *vol)
{
  curvol = vol;
}

/*
 * NAME:	hfs->vstat()
 * DESCRIPTION:	return volume statistics
 */
int hfs_vstat(hfsvol *vol, hfsvolent *ent)
{
  if (getvol(&vol) == -1)
    goto fail;

  strcpy(ent->name, vol->mdb.drVN);

  ent->flags     = (vol->flags & HFS_VOL_READONLY) ? HFS_ISLOCKED : 0;

  ent->totbytes  = vol->mdb.drNmAlBlks * vol->mdb.drAlBlkSiz;
  ent->freebytes = vol->mdb.drFreeBks  * vol->mdb.drAlBlkSiz;

  ent->alblocksz = vol->mdb.drAlBlkSiz;
  ent->clumpsz   = vol->mdb.drClpSiz;

  ent->numfiles  = vol->mdb.drFilCnt;
  ent->numdirs   = vol->mdb.drDirCnt;

  ent->crdate    = d_ltime(vol->mdb.drCrDate);
  ent->mddate    = d_ltime(vol->mdb.drLsMod);
  ent->bkdate    = d_ltime(vol->mdb.drVolBkUp);

  ent->blessed   = vol->mdb.drFndrInfo[0];

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->vsetattr()
 * DESCRIPTION:	change volume attributes
 */
int hfs_vsetattr(hfsvol *vol, hfsvolent *ent)
{
  if (getvol(&vol) == -1)
    goto fail;

  if (ent->clumpsz % vol->mdb.drAlBlkSiz != 0)
    ERROR(EINVAL, "illegal clump size");

  /* make sure "blessed" folder exists */

  if (ent->blessed &&
      v_getdthread(vol, ent->blessed, 0, 0) <= 0)
    ERROR(EINVAL, "illegal blessed folder");

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  vol->mdb.drClpSiz      = ent->clumpsz;

  vol->mdb.drCrDate      = d_mtime(ent->crdate);
  vol->mdb.drLsMod       = d_mtime(ent->mddate);
  vol->mdb.drVolBkUp     = d_mtime(ent->bkdate);

  vol->mdb.drFndrInfo[0] = ent->blessed;

  vol->flags |= HFS_VOL_UPDATE_MDB;

  return 0;

fail:
  return -1;
}

/* High-Level Directory Routines =========================================== */

/*
 * NAME:	hfs->chdir()
 * DESCRIPTION:	change current HFS directory
 */
int hfs_chdir(hfsvol *vol, const char *path)
{
  CatDataRec data;

  if (getvol(&vol) == -1 ||
      v_resolve(&vol, path, &data, 0, 0, 0) <= 0)
    goto fail;

  if (data.cdrType != cdrDirRec)
    ERROR(ENOTDIR, 0);

  vol->cwd = data.u.dir.dirDirID;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->getcwd()
 * DESCRIPTION:	return the current working directory ID
 */
unsigned long hfs_getcwd(hfsvol *vol)
{
  if (getvol(&vol) == -1)
    return 0;

  return vol->cwd;
}

/*
 * NAME:	hfs->setcwd()
 * DESCRIPTION:	set the current working directory ID
 */
int hfs_setcwd(hfsvol *vol, unsigned long id)
{
  if (getvol(&vol) == -1)
    goto fail;

  if (id == vol->cwd)
    goto done;

  /* make sure the directory exists */

  if (v_getdthread(vol, id, 0, 0) <= 0)
    goto fail;

  vol->cwd = id;

done:
  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->dirinfo()
 * DESCRIPTION:	given a directory ID, return its (name and) parent ID
 */
int hfs_dirinfo(hfsvol *vol, unsigned long *id, char *name)
{
  CatDataRec thread;

  if (getvol(&vol) == -1 ||
      v_getdthread(vol, *id, &thread, 0) <= 0)
    goto fail;

  *id = thread.u.dthd.thdParID;

  if (name)
    strcpy(name, thread.u.dthd.thdCName);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->opendir()
 * DESCRIPTION:	prepare to read the contents of a directory
 */
hfsdir *hfs_opendir(hfsvol *vol, const char *path)
{
  hfsdir *dir = 0;
  CatKeyRec key;
  CatDataRec data;
  byte pkey[HFS_CATKEYLEN];

  if (getvol(&vol) == -1)
    goto fail;

  dir = ALLOC(hfsdir, 1);
  if (dir == 0)
    ERROR(ENOMEM, 0);

  dir->vol = vol;

  if (*path == 0)
    {
      /* meta-directory containing root dirs from all mounted volumes */

      dir->dirid = 0;
      dir->vptr  = hfs_mounts;
    }
  else
    {
      if (v_resolve(&vol, path, &data, 0, 0, 0) <= 0)
	goto fail;

      if (data.cdrType != cdrDirRec)
	ERROR(ENOTDIR, 0);

      dir->dirid = data.u.dir.dirDirID;
      dir->vptr  = 0;

      r_makecatkey(&key, dir->dirid, "");
      r_packcatkey(&key, pkey, 0);

      if (bt_search(&vol->cat, pkey, &dir->n) <= 0)
	goto fail;
    }

  dir->prev = 0;
  dir->next = vol->dirs;

  if (vol->dirs)
    vol->dirs->prev = dir;

  vol->dirs = dir;

  return dir;

fail:
  FREE(dir);
  return 0;
}

/*
 * NAME:	hfs->readdir()
 * DESCRIPTION:	return the next entry in the directory
 */
int hfs_readdir(hfsdir *dir, hfsdirent *ent)
{
  CatKeyRec key;
  CatDataRec data;
  const byte *ptr;

  if (dir->dirid == 0)
    {
      hfsvol *vol;
      char cname[HFS_MAX_FLEN + 1];

      for (vol = hfs_mounts; vol; vol = vol->next)
	{
	  if (vol == dir->vptr)
	    break;
	}

      if (vol == 0)
	ERROR(ENOENT, "no more entries");

      if (v_getdthread(vol, HFS_CNID_ROOTDIR, &data, 0) <= 0 ||
	  v_catsearch(vol, HFS_CNID_ROOTPAR, data.u.dthd.thdCName,
		      &data, cname, 0) <= 0)
	goto fail;

      r_unpackdirent(HFS_CNID_ROOTPAR, cname, &data, ent);

      dir->vptr = vol->next;

      goto done;
    }

  if (dir->n.rnum == -1)
    ERROR(ENOENT, "no more entries");

  while (1)
    {
      ++dir->n.rnum;

      while (dir->n.rnum >= dir->n.nd.ndNRecs)
	{
	  if (dir->n.nd.ndFLink == 0)
	    {
	      dir->n.rnum = -1;
	      ERROR(ENOENT, "no more entries");
	    }

	  if (bt_getnode(&dir->n, dir->n.bt, dir->n.nd.ndFLink) == -1)
	    {
	      dir->n.rnum = -1;
	      goto fail;
	    }

	  dir->n.rnum = 0;
	}

      ptr = HFS_NODEREC(dir->n, dir->n.rnum);

      r_unpackcatkey(ptr, &key);

      if (key.ckrParID != dir->dirid)
	{
	  dir->n.rnum = -1;
	  ERROR(ENOENT, "no more entries");
	}

      r_unpackcatdata(HFS_RECDATA(ptr), &data);

      switch (data.cdrType)
	{
	case cdrDirRec:
	case cdrFilRec:
	  r_unpackdirent(key.ckrParID, key.ckrCName, &data, ent);
	  goto done;

	case cdrThdRec:
	case cdrFThdRec:
	  break;

	default:
	  dir->n.rnum = -1;
	  ERROR(EIO, "unexpected directory entry found");
	}
    }

done:
  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->closedir()
 * DESCRIPTION:	stop reading a directory
 */
int hfs_closedir(hfsdir *dir)
{
  hfsvol *vol = dir->vol;

  if (dir->prev)
    dir->prev->next = dir->next;
  if (dir->next)
    dir->next->prev = dir->prev;
  if (dir == vol->dirs)
    vol->dirs = dir->next;

  FREE(dir);

  return 0;
}

/* High-Level File Routines ================================================ */

/*
 * NAME:	hfs->create()
 * DESCRIPTION:	create and open a new file
 */
hfsfile *hfs_create(hfsvol *vol, const char *path,
		    const char *type, const char *creator)
{
  hfsfile *file = 0;
  unsigned long parid;
  char name[HFS_MAX_FLEN + 1];
  CatKeyRec key;
  byte record[HFS_MAX_CATRECLEN];
  unsigned reclen;
  int found;

  if (getvol(&vol) == -1)
    goto fail;

  file = ALLOC(hfsfile, 1);
  if (file == 0)
    ERROR(ENOMEM, 0);

  found = v_resolve(&vol, path, &file->cat, &parid, name, 0);
  if (found == -1 || parid == 0)
    goto fail;

  if (found)
    ERROR(EEXIST, 0);

  if (parid == HFS_CNID_ROOTPAR)
    ERROR(EINVAL, 0);

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  /* create file `name' in parent `parid' */

  if (bt_space(&vol->cat, 1) == -1)
    goto fail;

  f_init(file, vol, vol->mdb.drNxtCNID++, name);
  vol->flags |= HFS_VOL_UPDATE_MDB;

  file->parid = parid;

  /* create catalog record */

  file->cat.u.fil.filUsrWds.fdType =
    d_getsl((const unsigned char *) type);
  file->cat.u.fil.filUsrWds.fdCreator =
    d_getsl((const unsigned char *) creator);

  file->cat.u.fil.filCrDat = d_mtime(time(0));
  file->cat.u.fil.filMdDat = file->cat.u.fil.filCrDat;

  r_makecatkey(&key, file->parid, file->name);
  r_packcatrec(&key, &file->cat, record, &reclen);

  if (bt_insert(&vol->cat, record, reclen) == -1 ||
      v_adjvalence(vol, file->parid, 0, 1) == -1)
    goto fail;

  /* package file handle for user */

  file->next = vol->files;

  if (vol->files)
    vol->files->prev = file;

  vol->files = file;

  return file;

fail:
  FREE(file);
  return 0;
}

/*
 * NAME:	hfs->open()
 * DESCRIPTION:	prepare a file for I/O
 */
hfsfile *hfs_open(hfsvol *vol, const char *path)
{
  hfsfile *file = 0;

  if (getvol(&vol) == -1)
    goto fail;

  file = ALLOC(hfsfile, 1);
  if (file == 0)
    ERROR(ENOMEM, 0);

  if (v_resolve(&vol, path, &file->cat, &file->parid, file->name, 0) <= 0)
    goto fail;

  if (file->cat.cdrType != cdrFilRec)
    ERROR(EISDIR, 0);

  /* package file handle for user */

  file->vol   = vol;
  file->flags = 0;

  f_selectfork(file, fkData);

  file->prev = 0;
  file->next = vol->files;

  if (vol->files)
    vol->files->prev = file;

  vol->files = file;

  return file;

fail:
  FREE(file);
  return 0;
}

/*
 * NAME:	hfs->setfork()
 * DESCRIPTION:	select file fork for I/O operations
 */
int hfs_setfork(hfsfile *file, int fork)
{
  int result = 0;

  if (f_trunc(file) == -1)
    result = -1;

  f_selectfork(file, fork ? fkRsrc : fkData);

  return result;
}

/*
 * NAME:	hfs->getfork()
 * DESCRIPTION:	return the current fork for I/O operations
 */
int hfs_getfork(hfsfile *file)
{
  return file->fork != fkData;
}

/*
 * NAME:	hfs->read()
 * DESCRIPTION:	read from an open file
 */
unsigned long hfs_read(hfsfile *file, void *buf, unsigned long len)
{
  unsigned long *lglen, count;
  byte *ptr = buf;

  f_getptrs(file, 0, &lglen, 0);

  if (file->pos + len > *lglen)
    len = *lglen - file->pos;

  count = len;
  while (count)
    {
      unsigned long bnum, offs, chunk;

      bnum  = file->pos >> HFS_BLOCKSZ_BITS;
      offs  = file->pos & (HFS_BLOCKSZ - 1);

      chunk = HFS_BLOCKSZ - offs;
      if (chunk > count)
	chunk = count;

      if (offs == 0 && chunk == HFS_BLOCKSZ)
	{
	  if (f_getblock(file, bnum, (block *) ptr) == -1)
	    goto fail;
	}
      else
	{
	  block b;

	  if (f_getblock(file, bnum, &b) == -1)
	    goto fail;

	  memcpy(ptr, b + offs, chunk);
	}

      ptr += chunk;

      file->pos += chunk;
      count     -= chunk;
    }

  return len;

fail:
  return -1;
}

/*
 * NAME:	hfs->write()
 * DESCRIPTION:	write to an open file
 */
unsigned long hfs_write(hfsfile *file, const void *buf, unsigned long len)
{
  unsigned long *lglen, *pylen, count;
  const byte *ptr = buf;

  if (file->vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  f_getptrs(file, 0, &lglen, &pylen);

  count = len;

  /* set flag to update (at least) the modification time */

  if (count)
    {
      file->cat.u.fil.filMdDat = d_mtime(time(0));
      file->flags |= HFS_FILE_UPDATE_CATREC;
    }

  while (count)
    {
      unsigned long bnum, offs, chunk;

      bnum  = file->pos >> HFS_BLOCKSZ_BITS;
      offs  = file->pos & (HFS_BLOCKSZ - 1);

      chunk = HFS_BLOCKSZ - offs;
      if (chunk > count)
	chunk = count;

      if (file->pos + chunk > *pylen)
	{
	  if (bt_space(&file->vol->ext, 1) == -1 ||
	      f_alloc(file) == -1)
	    goto fail;
	}

      if (offs == 0 && chunk == HFS_BLOCKSZ)
	{
	  if (f_putblock(file, bnum, (block *) ptr) == -1)
	    goto fail;
	}
      else
	{
	  block b;

	  if (f_getblock(file, bnum, &b) == -1)
	    goto fail;

	  memcpy(b + offs, ptr, chunk);

	  if (f_putblock(file, bnum, &b) == -1)
	    goto fail;
	}

      ptr += chunk;

      file->pos += chunk;
      count     -= chunk;

      if (file->pos > *lglen)
	*lglen = file->pos;
    }

  return len;

fail:
  return -1;
}

/*
 * NAME:	hfs->truncate()
 * DESCRIPTION:	truncate an open file
 */
int hfs_truncate(hfsfile *file, unsigned long len)
{
  unsigned long *lglen;

  f_getptrs(file, 0, &lglen, 0);

  if (*lglen > len)
    {
      if (file->vol->flags & HFS_VOL_READONLY)
	ERROR(EROFS, 0);

      *lglen = len;

      file->cat.u.fil.filMdDat = d_mtime(time(0));
      file->flags |= HFS_FILE_UPDATE_CATREC;

      if (file->pos > len)
	file->pos = len;
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->seek()
 * DESCRIPTION:	change file seek pointer
 */
unsigned long hfs_seek(hfsfile *file, long offset, int from)
{
  unsigned long *lglen, newpos;

  f_getptrs(file, 0, &lglen, 0);

  switch (from)
    {
    case HFS_SEEK_SET:
      newpos = (offset < 0) ? 0 : offset;
      break;

    case HFS_SEEK_CUR:
      if (offset < 0 && (unsigned long) -offset > file->pos)
	newpos = 0;
      else
	newpos = file->pos + offset;
      break;

    case HFS_SEEK_END:
      if (offset < 0 && (unsigned long) -offset > *lglen)
	newpos = 0;
      else
	newpos = *lglen + offset;
      break;

    default:
      ERROR(EINVAL, 0);
    }

  if (newpos > *lglen)
    newpos = *lglen;

  file->pos = newpos;

  return newpos;

fail:
  return -1;
}

/*
 * NAME:	hfs->close()
 * DESCRIPTION:	close a file
 */
int hfs_close(hfsfile *file)
{
  hfsvol *vol = file->vol;
  int result = 0;

  if (f_trunc(file) == -1 ||
      f_flush(file) == -1)
    result = -1;

  if (file->prev)
    file->prev->next = file->next;
  if (file->next)
    file->next->prev = file->prev;
  if (file == vol->files)
    vol->files = file->next;

  FREE(file);

  return result;
}

/* High-Level Catalog Routines ============================================= */

/*
 * NAME:	hfs->stat()
 * DESCRIPTION:	return catalog information for an arbitrary path
 */
int hfs_stat(hfsvol *vol, const char *path, hfsdirent *ent)
{
  CatDataRec data;
  unsigned long parid;
  char name[HFS_MAX_FLEN + 1];

  if (getvol(&vol) == -1 ||
      v_resolve(&vol, path, &data, &parid, name, 0) <= 0)
    goto fail;

  r_unpackdirent(parid, name, &data, ent);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->fstat()
 * DESCRIPTION:	return catalog information for an open file
 */
int hfs_fstat(hfsfile *file, hfsdirent *ent)
{
  r_unpackdirent(file->parid, file->name, &file->cat, ent);

  return 0;
}

/*
 * NAME:	hfs->setattr()
 * DESCRIPTION:	change a file's attributes
 */
int hfs_setattr(hfsvol *vol, const char *path, const hfsdirent *ent)
{
  CatDataRec data;
  node n;

  if (getvol(&vol) == -1 ||
      v_resolve(&vol, path, &data, 0, 0, &n) <= 0)
    goto fail;

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  r_packdirent(&data, ent);

  return v_putcatrec(&data, &n);

fail:
  return -1;
}

/*
 * NAME:	hfs->fsetattr()
 * DESCRIPTION:	change an open file's attributes
 */
int hfs_fsetattr(hfsfile *file, const hfsdirent *ent)
{
  if (file->vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  r_packdirent(&file->cat, ent);

  file->flags |= HFS_FILE_UPDATE_CATREC;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->mkdir()
 * DESCRIPTION:	create a new directory
 */
int hfs_mkdir(hfsvol *vol, const char *path)
{
  CatDataRec data;
  unsigned long parid;
  char name[HFS_MAX_FLEN + 1];
  int found;

  if (getvol(&vol) == -1)
    goto fail;

  found = v_resolve(&vol, path, &data, &parid, name, 0);
  if (found == -1 || parid == 0)
    goto fail;

  if (found)
    ERROR(EEXIST, 0);

  if (parid == HFS_CNID_ROOTPAR)
    ERROR(EINVAL, 0);

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  return v_mkdir(vol, parid, name);

fail:
  return -1;
}

/*
 * NAME:	hfs->rmdir()
 * DESCRIPTION:	delete an empty directory
 */
int hfs_rmdir(hfsvol *vol, const char *path)
{
  CatKeyRec key;
  CatDataRec data;
  unsigned long parid;
  char name[HFS_MAX_FLEN + 1];
  byte pkey[HFS_CATKEYLEN];

  if (getvol(&vol) == -1 ||
      v_resolve(&vol, path, &data, &parid, name, 0) <= 0)
    goto fail;

  if (data.cdrType != cdrDirRec)
    ERROR(ENOTDIR, 0);

  if (data.u.dir.dirVal != 0)
    ERROR(ENOTEMPTY, 0);

  if (parid == HFS_CNID_ROOTPAR)
    ERROR(EINVAL, 0);

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  /* delete directory record */

  r_makecatkey(&key, parid, name);
  r_packcatkey(&key, pkey, 0);

  if (bt_delete(&vol->cat, pkey) == -1)
    goto fail;

  /* delete thread record */

  r_makecatkey(&key, data.u.dir.dirDirID, "");
  r_packcatkey(&key, pkey, 0);

  if (bt_delete(&vol->cat, pkey) == -1 ||
      v_adjvalence(vol, parid, 1, -1) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->delete()
 * DESCRIPTION:	remove both forks of a file
 */
int hfs_delete(hfsvol *vol, const char *path)
{
  hfsfile file;
  CatKeyRec key;
  byte pkey[HFS_CATKEYLEN];
  int found;

  if (getvol(&vol) == -1 ||
      v_resolve(&vol, path, &file.cat, &file.parid, file.name, 0) <= 0)
    goto fail;

  if (file.cat.cdrType != cdrFilRec)
    ERROR(EISDIR, 0);

  if (file.parid == HFS_CNID_ROOTPAR)
    ERROR(EINVAL, 0);

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  /* free allocation blocks */

  file.vol   = vol;
  file.flags = 0;

  file.cat.u.fil.filLgLen  = 0;
  file.cat.u.fil.filRLgLen = 0;

  f_selectfork(&file, fkData);
  if (f_trunc(&file) == -1)
    goto fail;

  f_selectfork(&file, fkRsrc);
  if (f_trunc(&file) == -1)
    goto fail;

  /* delete file record */

  r_makecatkey(&key, file.parid, file.name);
  r_packcatkey(&key, pkey, 0);

  if (bt_delete(&vol->cat, pkey) == -1 ||
      v_adjvalence(vol, file.parid, 0, -1) == -1)
    goto fail;

  /* delete file thread, if any */

  found = v_getfthread(vol, file.cat.u.fil.filFlNum, 0, 0);
  if (found == -1)
    goto fail;

  if (found)
    {
      r_makecatkey(&key, file.cat.u.fil.filFlNum, "");
      r_packcatkey(&key, pkey, 0);

      if (bt_delete(&vol->cat, pkey) == -1)
	goto fail;
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	hfs->rename()
 * DESCRIPTION:	change the name of and/or move a file or directory
 */
int hfs_rename(hfsvol *vol, const char *srcpath, const char *dstpath)
{
  hfsvol *srcvol;
  CatDataRec src, dst;
  unsigned long srcid, dstid;
  CatKeyRec key;
  char srcname[HFS_MAX_FLEN + 1], dstname[HFS_MAX_FLEN + 1];
  byte record[HFS_MAX_CATRECLEN];
  unsigned int reclen;
  int found, isdir, moving;
  node n;

  if (getvol(&vol) == -1 ||
      v_resolve(&vol, srcpath, &src, &srcid, srcname, 0) <= 0)
    goto fail;

  isdir  = (src.cdrType == cdrDirRec);
  srcvol = vol;

  found = v_resolve(&vol, dstpath, &dst, &dstid, dstname, 0);
  if (found == -1)
    goto fail;

  if (vol != srcvol)
    ERROR(EINVAL, "can't move across volumes");

  if (dstid == 0)
    ERROR(ENOENT, "bad destination path");

  if (found &&
      dst.cdrType == cdrDirRec &&
      dst.u.dir.dirDirID != src.u.dir.dirDirID)
    {
      dstid = dst.u.dir.dirDirID;
      strcpy(dstname, srcname);

      found = v_catsearch(vol, dstid, dstname, 0, 0, 0);
      if (found == -1)
	goto fail;
    }

  moving = (srcid != dstid);

  if (found)
    {
      const char *ptr;

      ptr = strrchr(dstpath, ':');
      if (ptr == 0)
	ptr = dstpath;
      else
	++ptr;

      if (*ptr)
	strcpy(dstname, ptr);

      if (! moving && strcmp(srcname, dstname) == 0)
	goto done;  /* source and destination are identical */

      if (moving || d_relstring(srcname, dstname))
	ERROR(EEXIST, "can't use destination name");
    }

  /* can't move anything into the root directory's parent */

  if (moving && dstid == HFS_CNID_ROOTPAR)
    ERROR(EINVAL, "can't move above root directory");

  if (moving && isdir)
    {
      unsigned long id;

      /* can't move root directory anywhere */

      if (src.u.dir.dirDirID == HFS_CNID_ROOTDIR)
	ERROR(EINVAL, "can't move root directory");

      /* make sure we aren't trying to move a directory inside itself */

      for (id = dstid; id != HFS_CNID_ROOTDIR; id = dst.u.dthd.thdParID)
	{
	  if (id == src.u.dir.dirDirID)
	    ERROR(EINVAL, "can't move directory inside itself");

	  if (v_getdthread(vol, id, &dst, 0) <= 0)
	    goto fail;
	}
    }

  if (vol->flags & HFS_VOL_READONLY)
    ERROR(EROFS, 0);

  /* change volume name */

  if (dstid == HFS_CNID_ROOTPAR)
    {
      if (! validvname(dstname))
	goto fail;

      strcpy(vol->mdb.drVN, dstname);
      vol->flags |= HFS_VOL_UPDATE_MDB;
    }

  /* remove source record */

  r_makecatkey(&key, srcid, srcname);
  r_packcatkey(&key, record, 0);

  if (bt_delete(&vol->cat, record) == -1)
    goto fail;

  /* insert destination record */

  r_makecatkey(&key, dstid, dstname);
  r_packcatrec(&key, &src, record, &reclen);

  if (bt_insert(&vol->cat, record, reclen) == -1)
    goto fail;

  /* update thread record */

  if (isdir)
    {
      if (v_getdthread(vol, src.u.dir.dirDirID, &dst, &n) <= 0)
	goto fail;

      dst.u.dthd.thdParID = dstid;
      strcpy(dst.u.dthd.thdCName, dstname);

      if (v_putcatrec(&dst, &n) == -1)
	goto fail;
    }
  else
    {
      found = v_getfthread(vol, src.u.fil.filFlNum, &dst, &n);
      if (found == -1)
	goto fail;

      if (found)
	{
	  dst.u.fthd.fthdParID = dstid;
	  strcpy(dst.u.fthd.fthdCName, dstname);

	  if (v_putcatrec(&dst, &n) == -1)
	    goto fail;
	}
    }

  /* update directory valences */

  if (moving)
    {
      if (v_adjvalence(vol, srcid, isdir, -1) == -1 ||
	  v_adjvalence(vol, dstid, isdir,  1) == -1)
	goto fail;
    }

done:
  return 0;

fail:
  return -1;
}

/* High-Level Media Routines =============================================== */

/*
 * NAME:	hfs->zero()
 * DESCRIPTION:	initialize medium with new/empty DDR and partition map
 */
int hfs_zero(const char *path, unsigned int maxparts, unsigned long *blocks)
{
  hfsvol vol;

  v_init(&vol, HFS_OPT_NOCACHE);

  if (maxparts < 1)
    ERROR(EINVAL, "must allow at least 1 partition");

  if (v_open(&vol, path, HFS_MODE_RDWR) == -1 ||
      v_geometry(&vol, 0) == -1)
    goto fail;

  if (m_zeroddr(&vol) == -1 ||
      m_zeropm(&vol, 1 + maxparts) == -1)
    goto fail;

  if (blocks)
    {
      Partition map;
      int found;

      found = m_findpmentry(&vol, "Apple_Free", &map, 0);
      if (found == -1)
	goto fail;

      if (! found)
	ERROR(EIO, "unable to determine free partition space");

      *blocks = map.pmPartBlkCnt;
    }

  if (v_close(&vol) == -1)
    goto fail;

  return 0;

fail:
  v_close(&vol);
  return -1;
}

/*
 * NAME:	hfs->mkpart()
 * DESCRIPTION:	create a new HFS partition
 */
int hfs_mkpart(const char *path, unsigned long len)
{
  hfsvol vol;

  v_init(&vol, HFS_OPT_NOCACHE);

  if (v_open(&vol, path, HFS_MODE_RDWR) == -1)
    goto fail;

  if (m_mkpart(&vol, "MacOS", "Apple_HFS", len) == -1)
    goto fail;

  if (v_close(&vol) == -1)
    goto fail;

  return 0;

fail:
  v_close(&vol);
  return -1;
}

/*
 * NAME:	hfs->nparts()
 * DESCRIPTION:	return the number of HFS partitions in the medium
 */
int hfs_nparts(const char *path)
{
  hfsvol vol;
  int nparts, found;
  Partition map;
  unsigned long bnum = 0;

  v_init(&vol, HFS_OPT_NOCACHE);

  if (v_open(&vol, path, HFS_MODE_RDONLY) == -1)
    goto fail;

  nparts = 0;
  while (1)
    {
      found = m_findpmentry(&vol, "Apple_HFS", &map, &bnum);
      if (found == -1)
	goto fail;

      if (! found)
	break;

      ++nparts;
    }

  if (v_close(&vol) == -1)
    goto fail;

  return nparts;

fail:
  v_close(&vol);
  return -1;
}

/*
 * NAME:	compare()
 * DESCRIPTION:	comparison function for qsort of blocks to be spared
 */
static
int compare(const unsigned int *n1, const unsigned int *n2)
{
  return *n1 - *n2;
}

/*
 * NAME:	hfs->format()
 * DESCRIPTION:	write a new filesystem
 */
int hfs_format(const char *path, int pnum, int mode, const char *vname,
	       unsigned int nbadblocks, const unsigned long badblocks[])
{
  hfsvol vol;
  btree *ext = &vol.ext;
  btree *cat = &vol.cat;
  unsigned int i, *badalloc = 0;

  v_init(&vol, mode);

  if (! validvname(vname))
    goto fail;

  if (v_open(&vol, path, HFS_MODE_RDWR) == -1 ||
      v_geometry(&vol, pnum) == -1)
    goto fail;

  /* initialize volume geometry */

  vol.lpa = 1 + ((vol.vlen - 6) >> 16);

  if (vol.flags & HFS_OPT_2048)
    vol.lpa = (vol.lpa + 3) & ~3;

  vol.vbmsz = (vol.vlen / vol.lpa + 0x0fff) >> 12;

  vol.mdb.drSigWord  = HFS_SIGWORD;
  vol.mdb.drCrDate   = d_mtime(time(0));
  vol.mdb.drLsMod    = vol.mdb.drCrDate;
  vol.mdb.drAtrb     = 0;
  vol.mdb.drNmFls    = 0;
  vol.mdb.drVBMSt    = 3;
  vol.mdb.drAllocPtr = 0;

  vol.mdb.drAlBlkSiz = vol.lpa << HFS_BLOCKSZ_BITS;
  vol.mdb.drClpSiz   = vol.mdb.drAlBlkSiz << 2;
  vol.mdb.drAlBlSt   = vol.mdb.drVBMSt + vol.vbmsz;

  if (vol.flags & HFS_OPT_2048)
    vol.mdb.drAlBlSt = ((vol.vstart & 3) + vol.mdb.drAlBlSt + 3) & ~3;

  vol.mdb.drNmAlBlks = (vol.vlen - 2 - vol.mdb.drAlBlSt) / vol.lpa;

  vol.mdb.drNxtCNID  = HFS_CNID_ROOTDIR;  /* modified later */
  vol.mdb.drFreeBks  = vol.mdb.drNmAlBlks;

  strcpy(vol.mdb.drVN, vname);

  vol.mdb.drVolBkUp  = 0;
  vol.mdb.drVSeqNum  = 0;
  vol.mdb.drWrCnt    = 0;

  vol.mdb.drXTClpSiz = vol.mdb.drNmAlBlks / 128 * vol.mdb.drAlBlkSiz;
  vol.mdb.drCTClpSiz = vol.mdb.drXTClpSiz;

  vol.mdb.drNmRtDirs = 0;
  vol.mdb.drFilCnt   = 0;
  vol.mdb.drDirCnt   = -1;  /* incremented when root directory is created */

  for (i = 0; i < 8; ++i)
    vol.mdb.drFndrInfo[i] = 0;

  vol.mdb.drEmbedSigWord            = 0x0000;
  vol.mdb.drEmbedExtent.xdrStABN    = 0;
  vol.mdb.drEmbedExtent.xdrNumABlks = 0;

  /* vol.mdb.drXTFlSize */
  /* vol.mdb.drCTFlSize */

  /* vol.mdb.drXTExtRec[0..2] */
  /* vol.mdb.drCTExtRec[0..2] */

  vol.flags |= HFS_VOL_UPDATE_MDB | HFS_VOL_UPDATE_ALTMDB;

  /* initialize volume bitmap */

  vol.vbm = ALLOC(block, vol.vbmsz);
  if (vol.vbm == 0)
    ERROR(ENOMEM, 0);

  memset(vol.vbm, 0, vol.vbmsz << HFS_BLOCKSZ_BITS);

  vol.flags |= HFS_VOL_UPDATE_VBM;

  /* perform initial bad block sparing */

  if (nbadblocks > 0)
    {
      if (nbadblocks * 4 > vol.vlen)
	ERROR(EINVAL, "volume contains too many bad blocks");

      badalloc = ALLOC(unsigned int, nbadblocks);
      if (badalloc == 0)
	ERROR(ENOMEM, 0);

      if (vol.mdb.drNmAlBlks == 1594)
	vol.mdb.drFreeBks = --vol.mdb.drNmAlBlks;

      for (i = 0; i < nbadblocks; ++i)
	{
	  unsigned long bnum;
	  unsigned int anum;

	  bnum = badblocks[i];

	  if (bnum < vol.mdb.drAlBlSt || bnum == vol.vlen - 2)
	    ERROR(EINVAL, "can't spare critical bad block");
	  else if (bnum >= vol.vlen)
	    ERROR(EINVAL, "bad block not in volume");

	  anum = (bnum - vol.mdb.drAlBlSt) / vol.lpa;

	  if (anum < vol.mdb.drNmAlBlks)
	    BMSET(vol.vbm, anum);

	  badalloc[i] = anum;
	}

      vol.mdb.drAtrb |= HFS_ATRB_BBSPARED;
    }

  /* create extents overflow file */

  n_init(&ext->hdrnd, ext, ndHdrNode, 0);

  ext->hdrnd.nnum       = 0;
  ext->hdrnd.nd.ndNRecs = 3;
  ext->hdrnd.roff[1]    = 0x078;
  ext->hdrnd.roff[2]    = 0x0f8;
  ext->hdrnd.roff[3]    = 0x1f8;

  memset(HFS_NODEREC(ext->hdrnd, 1), 0, 128);

  ext->hdr.bthDepth    = 0;
  ext->hdr.bthRoot     = 0;
  ext->hdr.bthNRecs    = 0;
  ext->hdr.bthFNode    = 0;
  ext->hdr.bthLNode    = 0;
  ext->hdr.bthNodeSize = HFS_BLOCKSZ;
  ext->hdr.bthKeyLen   = 0x07;
  ext->hdr.bthNNodes   = 0;
  ext->hdr.bthFree     = 0;
  for (i = 0; i < 76; ++i)
    ext->hdr.bthResv[i] = 0;

  ext->map = ALLOC(byte, HFS_MAP1SZ);
  if (ext->map == 0)
    ERROR(ENOMEM, 0);

  memset(ext->map, 0, HFS_MAP1SZ);
  BMSET(ext->map, 0);

  ext->mapsz = HFS_MAP1SZ;
  ext->flags = HFS_BT_UPDATE_HDR;

  /* create catalog file */

  n_init(&cat->hdrnd, cat, ndHdrNode, 0);

  cat->hdrnd.nnum       = 0;
  cat->hdrnd.nd.ndNRecs = 3;
  cat->hdrnd.roff[1]    = 0x078;
  cat->hdrnd.roff[2]    = 0x0f8;
  cat->hdrnd.roff[3]    = 0x1f8;

  memset(HFS_NODEREC(cat->hdrnd, 1), 0, 128);

  cat->hdr.bthDepth    = 0;
  cat->hdr.bthRoot     = 0;
  cat->hdr.bthNRecs    = 0;
  cat->hdr.bthFNode    = 0;
  cat->hdr.bthLNode    = 0;
  cat->hdr.bthNodeSize = HFS_BLOCKSZ;
  cat->hdr.bthKeyLen   = 0x25;
  cat->hdr.bthNNodes   = 0;
  cat->hdr.bthFree     = 0;
  for (i = 0; i < 76; ++i)
    cat->hdr.bthResv[i] = 0;

  cat->map = ALLOC(byte, HFS_MAP1SZ);
  if (cat->map == 0)
    ERROR(ENOMEM, 0);

  memset(cat->map, 0, HFS_MAP1SZ);
  BMSET(cat->map, 0);

  cat->mapsz = HFS_MAP1SZ;
  cat->flags = HFS_BT_UPDATE_HDR;

  /* allocate space for header nodes (and initial extents) */

  if (bt_space(ext, 1) == -1 ||
      bt_space(cat, 1) == -1)
    goto fail;

  --ext->hdr.bthFree;
  --cat->hdr.bthFree;

  /* create extent records for bad blocks */

  if (nbadblocks > 0)
    {
      hfsfile bbfile;
      ExtDescriptor extent;
      ExtDataRec *extrec;
      ExtKeyRec key;
      byte record[HFS_MAX_EXTRECLEN];
      unsigned int reclen;

      f_init(&bbfile, &vol, HFS_CNID_BADALLOC, "bad blocks");

      qsort(badalloc, nbadblocks, sizeof(*badalloc),
	    (int (*)(const void *, const void *)) compare);

      for (i = 0; i < nbadblocks; ++i)
	{
	  if (i == 0 || badalloc[i] != extent.xdrStABN)
	    {
	      extent.xdrStABN    = badalloc[i];
	      extent.xdrNumABlks = 1;

	      if (extent.xdrStABN < vol.mdb.drNmAlBlks &&
		  f_addextent(&bbfile, &extent) == -1)
		goto fail;
	    }
	}

      /* flush local extents into extents overflow file */

      f_getptrs(&bbfile, &extrec, 0, 0);

      r_makeextkey(&key, bbfile.fork, bbfile.cat.u.fil.filFlNum, 0);
      r_packextrec(&key, extrec, record, &reclen);

      if (bt_insert(&vol.ext, record, reclen) == -1)
	goto fail;
    }

  vol.flags |= HFS_VOL_MOUNTED;

  /* create root directory */

  if (v_mkdir(&vol, HFS_CNID_ROOTPAR, vname) == -1)
    goto fail;

  vol.mdb.drNxtCNID = 16;  /* first CNID not reserved by Apple */

  /* write boot blocks */

  if (m_zerobb(&vol) == -1)
    goto fail;

  /* zero other unused space, if requested */

  if (vol.flags & HFS_OPT_ZERO)
    {
      block b;
      unsigned long bnum;

      memset(&b, 0, sizeof(b));

      /* between MDB and VBM (never) */

      for (bnum = 3; bnum < vol.mdb.drVBMSt; ++bnum)
	b_writelb(&vol, bnum, &b);

      /* between VBM and first allocation block (sometimes if HFS_OPT_2048) */

      for (bnum = vol.mdb.drVBMSt + vol.vbmsz; bnum < vol.mdb.drAlBlSt; ++bnum)
	b_writelb(&vol, bnum, &b);

      /* between last allocation block and alternate MDB (sometimes) */

      for (bnum = vol.mdb.drAlBlSt + vol.mdb.drNmAlBlks * vol.lpa;
	   bnum < vol.vlen - 2; ++bnum)
	b_writelb(&vol, bnum, &b);

      /* final block (always) */

      b_writelb(&vol, vol.vlen - 1, &b);
    }

  /* flush remaining state and close volume */

  if (v_close(&vol) == -1)
    goto fail;

  FREE(badalloc);

  return 0;

fail:
  v_close(&vol);

  FREE(badalloc);

  return -1;
}
