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
 * $Id: tclhfs.c,v 1.12 1998/11/02 22:08:32 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# ifdef HAVE_UNISTD_H
#  include <unistd.h>
# endif

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <ctype.h>
# include <limits.h>

# include <tcl.h>

# include "tclhfs.h"
# include "hfs.h"
# include "glob.h"
# include "copyin.h"
# include "copyout.h"
# include "charset.h"
# include "suid.h"
# include "version.h"

extern int errno;

# define ERROR(code, str)	(hfs_error = (str), errno = (code))

# define SIZE(type, n)		((size_t) (sizeof(type) * (n)))
# define ALLOC(type, n)		((type *) malloc(SIZE(type, n)))
# define ALLOCX(type, n)	((n) ? ALLOC(type, n) : (type *) 0)
# define FREE(ptr)		((ptr) ? (void) free((void *) ptr) : (void) 0)

# define REALLOC(ptr, type, n)  \
    ((type *) ((ptr) ? realloc(ptr, SIZE(type, n)) : malloc(SIZE(type, n))))
# define REALLOCX(ptr, type, n)  \
    ((n) ? REALLOC(ptr, type, n) : (FREE(ptr), (type *) 0))

# define CHARLEN(type)		((sizeof(type) * CHAR_BIT + 2) / 3 + 1)

static
int err_umount, err_close;

typedef struct {
  hfsvol *vol;
  unsigned long cwd;
} volref;

typedef struct {
  hfsfile *file;
  Tcl_Interp *interp;
  Tcl_Command cmd;
} fileref;

Tcl_HashTable volumes;	/* set containing mounted volumes (no values) */
Tcl_HashTable files;	/* mapping of frefs -> vrefs */

/*
 * NAME:	error()
 * DESCRIPTION:	return a Tcl error for an HFS error
 */
static
int error(Tcl_Interp *interp, const char *msg)
{
  const char *str;
  char c[2];

  str  = strerror(errno);
  c[0] = tolower(*str);
  c[1] = 0;

  Tcl_ResetResult(interp);

  if (msg)
    Tcl_AppendResult(interp, msg, ": ", (char *) 0);

  if (hfs_error == 0)
    Tcl_AppendResult(interp, c, str + 1, (char *) 0);
  else
    Tcl_AppendResult(interp, hfs_error, " (", str, ")", (char *) 0);

  return TCL_ERROR;
}

/*
 * NAME:	direntstr()
 * DESCRIPTION:	return a Tcl stat list for a single HFS entity
 */
static
char *direntstr(hfsdirent *ent)
{
  char
    cnid[CHARLEN(unsigned long) + 1],
    parid[CHARLEN(unsigned long) + 1],
    rsize[CHARLEN(unsigned long) + 1],
    dsize[CHARLEN(unsigned long) + 1],
    crdate[CHARLEN(long) + 1],
    mddate[CHARLEN(long) + 1],
    bkdate[CHARLEN(long) + 1];
  register int argc;
  char *argv[24];
  int locked, invis;

  argc = 0;

  argv[argc++] = "name";
  argv[argc++] = ent->name;

  sprintf(cnid,   "%lu", ent->cnid);
  sprintf(parid,  "%lu", ent->parid);

  argv[argc++] = "cnid";
  argv[argc++] = cnid;

  argv[argc++] = "parid";
  argv[argc++] = parid;

  argv[argc++] = "kind";

  if (ent->flags & HFS_ISDIR)
    {
      argv[argc++] = "directory";

      sprintf(dsize, "%u", ent->u.dir.valence);

      argv[argc++] = "size";
      argv[argc++] = dsize;

      argv[argc++] = "flags";
      argv[argc++] = (ent->fdflags & HFS_FNDR_ISINVISIBLE) ? "invis" : "";
    }
  else
    {
      argv[argc++] = "file";

      argv[argc++] = "type";
      argv[argc++] = ent->u.file.type;

      argv[argc++] = "creator";
      argv[argc++] = ent->u.file.creator;

      locked = ent->flags & HFS_ISLOCKED;
      invis  = ent->fdflags & HFS_FNDR_ISINVISIBLE;

      argv[argc++] = "flags";
      argv[argc++] = (locked && invis) ? "locked invis" :
	(locked ? "locked" : (invis ? "invis" : ""));

      sprintf(rsize,  "%lu", ent->u.file.rsize);
      sprintf(dsize,  "%lu", ent->u.file.dsize);

      argv[argc++] = "rsize";
      argv[argc++] = rsize;

      argv[argc++] = "dsize";
      argv[argc++] = dsize;
    }

  sprintf(crdate, "%ld", (long) ent->crdate);
  sprintf(mddate, "%ld", (long) ent->mddate);
  sprintf(bkdate, "%ld", (long) ent->bkdate);

  argv[argc++] = "crdate";
  argv[argc++] = crdate;

  argv[argc++] = "mddate";
  argv[argc++] = mddate;

  argv[argc++] = "bkdate";
  argv[argc++] = bkdate;

  return Tcl_Merge(argc, argv);
}

/*
 * NAME:	getdir()
 * DESCRIPTION:	collect and return the contents of an HFS directory
 */
static
int getdir(Tcl_Interp *interp, volref *vref, const char *path)
{
  hfsvol *vol = vref->vol;
  hfsdir *dir;
  hfsdirent ent;
  char *str;

  if (hfs_setcwd(vol, vref->cwd) == -1 ||
      hfs_stat(vol, path, &ent) == -1)
    return error(interp, 0);

  if (ent.flags & HFS_ISDIR)
    {
      dir = hfs_opendir(vol, path);
      if (dir == 0)
	return error(interp, 0);

      while (hfs_readdir(dir, &ent) != -1)
	{
	  str = direntstr(&ent);
	  if (str == 0)
	    {
	      hfs_closedir(dir);
	      Tcl_SetResult(interp, "out of memory", TCL_STATIC);
	      return TCL_ERROR;
	    }

	  Tcl_AppendElement(interp, str);

	  free(str);
	}

      if (hfs_closedir(dir) == -1)
	return error(interp, 0);
    }
  else  /* ! HFS_ISDIR */
    {
      str = direntstr(&ent);
      if (str == 0)
	{
	  interp->result = "out of memory";
	  return TCL_ERROR;
	}

      Tcl_AppendElement(interp, str);

      free(str);
    }

  return TCL_OK;
}

/*
 * NAME:	file->del()
 * DESCRIPTION:	called by Tcl when a file reference is deleted
 */
static
void file_del(ClientData clientData)
{
  fileref *fref = clientData;
  Tcl_HashEntry *entry;

  entry = Tcl_FindHashEntry(&files, (char *) fref);
  if (entry)
    Tcl_DeleteHashEntry(entry);

  err_close = hfs_close(fref->file);

  FREE(fref);
}

/*
 * NAME:	file->cmd()
 * DESCRIPTION:	operate on an HFS file
 */
static
int file_cmd(ClientData clientData, Tcl_Interp *interp,
	     int argc, char *argv[])
{
  fileref *fref = clientData;
  hfsfile *file = fref->file;

  switch (argc)
    {
    case 1:
      interp->result = "missing command";
      return TCL_ERROR;

    case 2:
      if (strcmp(argv[1], "close") == 0)
	{
	  Tcl_DeleteCommand(interp, argv[0]);
	  if (err_close == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "tell") == 0)
	{
	  long offset;

	  offset = hfs_seek(file, 0, HFS_SEEK_CUR);
	  if (offset == -1)
	    return error(interp, 0);

	  sprintf(interp->result, "%lu", offset);
	}
      else if (strcmp(argv[1], "stat") == 0)
	{
	  hfsdirent ent;
	  char *str;

	  if (hfs_fstat(file, &ent) == -1)
	    return error(interp, 0);

	  str = direntstr(&ent);
	  if (str == 0)
	    {
	      interp->result = "out of memory";
	      return TCL_ERROR;
	    }

	  Tcl_SetResult(interp, str, TCL_DYNAMIC);
	}
      else if (strcmp(argv[1], "getfork") == 0)
	{
	  interp->result = (hfs_getfork(file) == 0) ? "data" : "rsrc";
	}
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    case 3:
      if (strcmp(argv[1], "setfork") == 0 ||
	  strcmp(argv[1], "fork") == 0)
	{
	  int fork;

	  if (strcmp(argv[2], "data") == 0)
	    fork = 0;
	  else if (strcmp(argv[2], "rsrc") == 0 ||
		   strcmp(argv[2], "resource") == 0)
	    fork = 1;
	  else
	    {
	      interp->result = "bad arg to setfork: must be data or rsrc";
	      return TCL_ERROR;
	    }

	  hfs_setfork(file, fork);
	}
      else if (strcmp(argv[1], "seek") == 0)
	{
	  long offset;

	  if (Tcl_ExprLong(interp, argv[2], &offset) != TCL_OK)
	    return TCL_ERROR;

	  offset = hfs_seek(file, offset, HFS_SEEK_SET);
	  if (offset == -1)
	    return error(interp, 0);

	  sprintf(interp->result, "%lu", offset);
	}
      else if (strcmp(argv[1], "read") == 0)
	{
	  long bytes;
	  char *mem;

	  if (Tcl_ExprLong(interp, argv[2], &bytes) != TCL_OK)
	    return TCL_ERROR;

	  if (bytes < 0)
	    {
	      interp->result = "size must be >= 0";
	      return TCL_ERROR;
	    }

	  mem = ALLOC(char, bytes + 1);
	  if (mem == 0)
	    {
	      interp->result = "out of memory";
	      return TCL_ERROR;
	    }

	  bytes = hfs_read(file, mem, bytes);
	  if (bytes == -1)
	    {
	      free(mem);
	      return error(interp, 0);
	    }

	  mem[bytes] = 0;

	  Tcl_SetResult(interp, mem, TCL_DYNAMIC);
	}
      else if (strcmp(argv[1], "write") == 0)
	{
	  long bytes;

	  bytes = hfs_write(file, argv[2], strlen(argv[2]));
	  if (bytes == -1)
	    return error(interp, 0);

	  sprintf(interp->result, "%lu", bytes);
	}
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    case 4:
      if (strcmp(argv[1], "seek") == 0)
	{
	  long offset;
	  int whence;

	  if (Tcl_ExprLong(interp, argv[2], &offset) != TCL_OK)
	    return TCL_ERROR;

	  if (strcmp(argv[3], "start") == 0 ||
	      strcmp(argv[3], "set") == 0)
	    whence = HFS_SEEK_SET;
	  else if (strcmp(argv[3], "current") == 0 ||
		   strcmp(argv[3], "cur") == 0)
	    whence = HFS_SEEK_CUR;
	  else if (strcmp(argv[3], "end") == 0)
	    whence = HFS_SEEK_END;
	  else
	    {
	      interp->result = "bad arg 3: must be start, current, or end";
	      return TCL_ERROR;
	    }

	  offset = hfs_seek(file, offset, whence);
	  if (offset == -1)
	    return error(interp, 0);

	  sprintf(interp->result, "%lu", offset);
	}
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    default:
      Tcl_AppendResult(interp, "bad command \"", argv[1],
		       "\" or wrong # args", (char *) 0);
      return TCL_ERROR;
    }

  return TCL_OK;
}

/*
 * NAME:	fork->native()
 * DESCRIPTION:	copy a single fork in native mode
 */
static
int fork_native(Tcl_Interp *interp, hfsfile *ifile, hfsfile *ofile)
{
  char buf[HFS_BLOCKSZ * 8];
  long chunk, bytes;

  while (1)
    {
      chunk = hfs_read(ifile, buf, sizeof(buf));
      if (chunk == -1)
	return error(interp, "error reading source file");
      else if (chunk == 0)
	break;

      bytes = hfs_write(ofile, buf, chunk);
      if (bytes == -1)
	return error(interp, "error writing destination file");
      else if (bytes != chunk)
	return error(interp, "wrote incomplete chunk");
    }

  return TCL_OK;
}

/*
 * NAME:	file->ref()
 * DESCRIPTION:	called to initialize a new file reference
 */
static
void file_ref(Tcl_Interp *interp, volref *vref, fileref *fref, hfsfile *file)
{
  static int id = 0;
  Tcl_CmdInfo info;
  Tcl_HashEntry *entry;
  int new;

  do
    sprintf(interp->result, "hfsfile%d", id++);
  while (Tcl_GetCommandInfo(interp, interp->result, &info));

  fref->file   = file;
  fref->interp = interp;
  fref->cmd    = Tcl_CreateCommand(interp, interp->result,
				   file_cmd, fref, file_del);

  entry = Tcl_CreateHashEntry(&files, (char *) fref, &new);
  Tcl_SetHashValue(entry, vref);
}

/*
 * NAME:	do_copynative()
 * DESCRIPTION:	perform native HFS file copy
 */
static
int do_copynative(Tcl_Interp *interp, hfsfile *ifile, hfsfile *ofile)
{
  int result;

  if (hfs_setfork(ifile, 0) == -1 ||
      hfs_setfork(ofile, 0) == -1)
    return error(interp, "error opening data fork");

  result = fork_native(interp, ifile, ofile);
  if (result != TCL_OK)
    return result;

  if (hfs_setfork(ifile, 1) == -1 ||
      hfs_setfork(ofile, 1) == -1)
    return error(interp, "error opening resource fork");

  result = fork_native(interp, ifile, ofile);
  if (result != TCL_OK)
    return result;

  return TCL_OK;
}

/*
 * NAME:	copynative()
 * DESCRIPTION:	copy an HFS file to another HFS volume
 */
static
int copynative(Tcl_Interp *interp, volref *srcvref, char *argv[])
{
  volref *dstvref;
  Tcl_CmdInfo info;
  Tcl_HashEntry *entry = 0;
  hfsdirent ent;
  const char *srcname, *dstname;
  hfsfile *ifile, *ofile;
  int result;
  unsigned long cnid;

  if (Tcl_GetCommandInfo(interp, argv[3], &info))
    entry = Tcl_FindHashEntry(&volumes, (char *) info.clientData);

  if (entry == 0)
    {
      Tcl_AppendResult(interp, "unknown volume \"", argv[3], "\"", (char *) 0);
      return TCL_ERROR;
    }

  dstvref = info.clientData;

  srcname = argv[2];
  dstname = argv[4];

  if (hfs_setcwd(srcvref->vol, srcvref->cwd) == -1)
    return error(interp, 0);

  ifile = hfs_open(srcvref->vol, srcname);
  if (ifile == 0)
    return error(interp, "can't open source file");

  if (hfs_setcwd(dstvref->vol, dstvref->cwd) == -1)
    {
      error(interp, 0);
      hfs_close(ifile);
      return TCL_ERROR;
    }

  cnid = 0;

  if (hfs_stat(dstvref->vol, dstname, &ent) != -1)
    {
      if (ent.flags & HFS_ISDIR)
	{
	  if (hfs_setcwd(dstvref->vol, ent.cnid) == -1)
	    {
	      error(interp, 0);
	      hfs_close(ifile);
	      return TCL_ERROR;
	    }

	  dstname = srcname;

	  if (hfs_stat(dstvref->vol, dstname, &ent) != -1)
	    cnid = ent.cnid;
	}
      else
	cnid = ent.cnid;
    }

  if (hfs_fstat(ifile, &ent) == -1)
    {
      error(interp, "can't stat source file");
      hfs_close(ifile);
      return TCL_ERROR;
    }

  if (srcvref->vol == dstvref->vol &&
      ent.cnid == cnid)
    {
      interp->result = "source and destination files are the same";
      hfs_close(ifile);
      return TCL_ERROR;
    }

  hfs_delete(dstvref->vol, dstname);

  ofile = hfs_create(dstvref->vol, dstname,
		     ent.u.file.type, ent.u.file.creator);
  if (ofile == 0)
    {
      error(interp, "can't create destination file");
      hfs_close(ifile);
      return TCL_ERROR;
    }

  result = do_copynative(interp, ifile, ofile);

  ent.fdflags &= ~(HFS_FNDR_ISONDESK | HFS_FNDR_HASBEENINITED);

  if (result == TCL_OK && hfs_fsetattr(ofile, &ent) == -1)
    result = error(interp, "can't set destination file attributes");

  if (hfs_close(ofile) == -1 && result == TCL_OK)
    result = error(interp, "error closing destination file");

  if (hfs_close(ifile) == -1 && result == TCL_OK)
    result = error(interp, "error closing source file");

  return result;
}

/*
 * NAME:	copyin()
 * DESCRIPTION:	copy a UNIX file into an HFS volume
 */
static
int copyin(Tcl_Interp *interp, hfsvol *vol, char *argv[])
{
  cpifunc copyfile;

  if (strcmp(argv[2], "macbinary") == 0 ||
      strcmp(argv[2], "macb") == 0)
    copyfile = cpi_macb;
  else if (strcmp(argv[2], "binhex") == 0 ||
	   strcmp(argv[2], "binh") == 0)
    copyfile = cpi_binh;
  else if (strcmp(argv[2], "text") == 0)
    copyfile = cpi_text;
  else if (strcmp(argv[2], "raw") == 0 ||
	   strcmp(argv[2], "data") == 0)
    copyfile = cpi_raw;
  else
    {
      interp->result = "bad mode: must be macb, binh, text, or raw";
      return TCL_ERROR;
    }

  if (copyfile(argv[3], vol, argv[4]) == -1)
    {
      ERROR(errno, cpi_error);
      return error(interp, 0);
    }

  return TCL_OK;
}

/*
 * NAME:	copyout()
 * DESCRIPTION:	copy an HFS file out to a UNIX file
 */
static
int copyout(Tcl_Interp *interp, hfsvol *vol, char *argv[])
{
  cpofunc copyfile;

  if (strcmp(argv[2], "macbinary") == 0 ||
      strcmp(argv[2], "macb") == 0)
    copyfile = cpo_macb;
  else if (strcmp(argv[2], "binhex") == 0 ||
	   strcmp(argv[2], "binh") == 0)
    copyfile = cpo_binh;
  else if (strcmp(argv[2], "text") == 0)
    copyfile = cpo_text;
  else if (strcmp(argv[2], "raw") == 0 ||
	   strcmp(argv[2], "data") == 0)
    copyfile = cpo_raw;
  else
    {
      interp->result = "bad mode: must be macb, binh, text, or raw";
      return TCL_ERROR;
    }

  if (copyfile(vol, argv[3], argv[4]) == -1)
    {
      ERROR(errno, cpo_error);
      return error(interp, 0);
    }

  return TCL_OK;
}

/*
 * NAME:	do_zero()
 * DESCRIPTION:	call hfs_zero() with necessary privileges
 */
static
int do_zero(const char *path, unsigned int nparts, unsigned long *len)
{
  int result;

  suid_enable();
  result = hfs_zero(path, nparts, len);
  suid_disable();

  return result;
}

/*
 * NAME:	do_mkpart()
 * DESCRIPTION:	call hfs_mkpart() with necessary privileges
 */
static
int do_mkpart(const char *path, unsigned long len)
{
  int result;

  suid_enable();
  result = hfs_mkpart(path, len);
  suid_disable();

  return result;
}

/*
 * NAME:	do_format()
 * DESCRIPTION:	call hfs_format() with necessary privileges
 */
static
int do_format(const char *path, int partno, int mode, const char *vname,
	      unsigned int nbadblocks, unsigned long badblocks[])
{
  int result;

  suid_enable();
  result = hfs_format(path, partno, mode, vname, nbadblocks, badblocks);
  suid_disable();

  return result;
}

/*
 * NAME:	vol->del()
 * DESCRIPTION:	called by Tcl when a volume reference is deleted
 */
static
void vol_del(ClientData clientData)
{
  volref *vref = clientData;
  Tcl_HashEntry *entry;

  entry = Tcl_FindHashEntry(&volumes, (char *) vref);
  if (entry)
    Tcl_DeleteHashEntry(entry);

  do
    {
      Tcl_HashSearch search;

      for (entry = Tcl_FirstHashEntry(&files, &search); entry;
	   entry = Tcl_NextHashEntry(&search))
	{
	  if (Tcl_GetHashValue(entry) == vref)
	    {
	      fileref *fref = (fileref *) Tcl_GetHashKey(&files, entry);

	      Tcl_DeleteCommand(fref->interp,
				Tcl_GetCommandName(fref->interp, fref->cmd));
	      break;
	    }
	}
    }
  while (entry);

  err_umount = hfs_umount(vref->vol);

  FREE(vref);
}

/*
 * NAME:	vol->cmd()
 * DESCRIPTION:	operate on an HFS volume
 */
static
int vol_cmd(ClientData clientData, Tcl_Interp *interp,
	    int argc, char *argv[])
{
  volref *vref = clientData;
  hfsvol *vol  = vref->vol;

  switch (argc)
    {
    case 1:
      interp->result = "missing command";
      return TCL_ERROR;

    case 2:
      if (strcmp(argv[1], "vname") == 0)
	{
	  hfsvolent ent;

	  hfs_vstat(vol, &ent);
	  Tcl_SetResult(interp, ent.name, TCL_VOLATILE);
	}
      else if (strcmp(argv[1], "size") == 0)
	{
	  hfsvolent ent;

	  hfs_vstat(vol, &ent);
	  sprintf(interp->result, "%lu %lu", ent.totbytes, ent.freebytes);
	}
      else if (strcmp(argv[1], "crdate") == 0)
	{
	  hfsvolent ent;

	  hfs_vstat(vol, &ent);
	  sprintf(interp->result, "%ld", (long) ent.crdate);
	}
      else if (strcmp(argv[1], "mddate") == 0)
	{
	  hfsvolent ent;

	  hfs_vstat(vol, &ent);
	  sprintf(interp->result, "%ld", (long) ent.mddate);
	}
      else if (strcmp(argv[1], "islocked") == 0)
	{
	  hfsvolent ent;

	  hfs_vstat(vol, &ent);
	  if (ent.flags & HFS_ISLOCKED)
	    interp->result = "1";
	  else
	    interp->result = "0";
	}
      else if (strcmp(argv[1], "umount") == 0)
	{
	  Tcl_DeleteCommand(interp, argv[0]);
	  if (err_umount == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "cwd") == 0)
	sprintf(interp->result, "%lu", vref->cwd);
      else if (strcmp(argv[1], "path") == 0)
	{
	  char name[HFS_MAX_FLEN + 1];
	  long id;
	  int listc, i;
	  char **listv;
	  char *result;

	  id = vref->cwd;
	  while (id != HFS_CNID_ROOTPAR)
	    {
	      if (hfs_dirinfo(vol, &id, name) == -1)
		return error(interp, 0);

	      Tcl_AppendElement(interp, name);
	    }

	  /* reverse the resulting list */

	  if (Tcl_SplitList(interp, interp->result, &listc, &listv) != TCL_OK)
	    return TCL_ERROR;

	  for (i = 0; i < listc / 2; ++i)
	    {
	      char *tmp;

	      tmp = listv[i];
	      listv[i] = listv[listc - 1 - i];
	      listv[listc - 1 - i] = tmp;
	    }

	  result = Tcl_Merge(listc, listv);
	  free(listv);

	  Tcl_SetResult(interp, result, TCL_DYNAMIC);
	}
      else if (strcmp(argv[1], "dir") == 0)
	{
	  if (getdir(interp, vref, ":") != TCL_OK)
	    return TCL_ERROR;
	}
      else if (strcmp(argv[1], "flush") == 0)
	{
	  if (hfs_flush(vol) == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "sepchar") == 0)
	interp->result = ":";
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    case 3:
      if (strcmp(argv[1], "cd") == 0 ||
	  strcmp(argv[1], "chdir") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_chdir(vol, argv[2]) == -1)
	    return error(interp, 0);

	  vref->cwd = hfs_getcwd(vol);
	}
      else if (strcmp(argv[1], "dirinfo") == 0)
	{
	  long id;
	  char name[HFS_MAX_FLEN + 1], idstr[CHARLEN(unsigned long) + 1];

	  if (Tcl_ExprLong(interp, argv[2], &id) != TCL_OK)
	    return TCL_ERROR;

	  if (hfs_dirinfo(vol, &id, name) == -1)
	    return error(interp, 0);

	  sprintf(idstr, "%lu", id);
	  Tcl_AppendElement(interp, name);
	  Tcl_AppendElement(interp, idstr);
	}
      else if (strcmp(argv[1], "dir") == 0)
	{
	  if (getdir(interp, vref, argv[2]) != TCL_OK)
	    return TCL_ERROR;
	}
      else if (strcmp(argv[1], "open") == 0)
	{
	  fileref *fref;
	  hfsfile *file;

	  fref = ALLOC(fileref, 1);
	  if (fref == 0)
	    {
	      interp->result = "out of memory";
	      return TCL_ERROR;
	    }

	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      (file = hfs_open(vol, argv[2])) == 0)
	    {
	      FREE(fref);
	      return error(interp, 0);
	    }

	  file_ref(interp, vref, fref, file);
	}
      else if (strcmp(argv[1], "stat") == 0)
	{
	  hfsdirent ent;
	  char *str;

	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_stat(vol, argv[2], &ent) == -1)
	    return error(interp, 0);

	  str = direntstr(&ent);
	  if (str == 0)
	    {
	      interp->result = "out of memory";
	      return TCL_ERROR;
	    }

	  Tcl_SetResult(interp, str, TCL_DYNAMIC);
	}
      else if (strcmp(argv[1], "mkdir") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_mkdir(vol, argv[2]) == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "rmdir") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_rmdir(vol, argv[2]) == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "delete") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_delete(vol, argv[2]) == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "touch") == 0)
	{
	  hfsdirent ent;

	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_stat(vol, argv[2], &ent) == -1)
	    return error(interp, 0);

	  ent.mddate = time(0);

	  if (hfs_setattr(vol, argv[2], &ent) == -1)
	    return error(interp, 0);
	}
      else if (strcmp(argv[1], "glob") == 0)
	{
	  int listc, fargc;
	  char **listv, **fargv, *result;

	  if (hfs_setcwd(vol, vref->cwd) == -1)
	    return error(interp, 0);

	  if (Tcl_SplitList(interp, argv[2], &listc, &listv) != TCL_OK)
	    return TCL_ERROR;

	  fargv = hfs_glob(vol, listc, listv, &fargc);
	  free(listv);

	  if (fargv == 0)
	    {
	      interp->result = "globbing error";
	      return TCL_ERROR;
	    }

	  result = Tcl_Merge(fargc, fargv);
	  free(fargv);

	  Tcl_SetResult(interp, result, TCL_DYNAMIC);
	}
      else if (strcmp(argv[1], "bless") == 0)
	{
	  hfsvolent volent;
	  hfsdirent dirent;

	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_vstat(vol, &volent) == -1 ||
	      hfs_stat(vol, argv[2], &dirent) == -1)
	    return error(interp, 0);

	  volent.blessed = dirent.cnid;

	  if (hfs_vsetattr(vol, &volent) == -1)
	    return error(interp, 0);
	}
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    case 4:
      if (strcmp(argv[1], "rename") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      hfs_rename(vol, argv[2], argv[3]) == -1)
	    return error(interp, 0);
	}
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    case 5:
      if (strcmp(argv[1], "create") == 0)
	{
	  fileref *fref;
	  hfsfile *file;

	  if (strlen(argv[3]) != 4 ||
	      strlen(argv[4]) != 4)
	    {
	      interp->result = "type and creator must be 4 character strings";
	      return TCL_ERROR;
	    }

	  fref = ALLOC(fileref, 1);
	  if (fref == 0)
	    {
	      interp->result = "out of memory";
	      return TCL_ERROR;
	    }

	  if (hfs_setcwd(vol, vref->cwd) == -1 ||
	      (file = hfs_create(vol, argv[2], argv[3], argv[4])) == 0)
	    {
	      FREE(fref);
	      return error(interp, 0);
	    }

	  file_ref(interp, vref, fref, file);
	}
      else if (strcmp(argv[1], "copy") == 0)
	return copynative(interp, vref, argv);
      else if (strcmp(argv[1], "copyin") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1)
	    return error(interp, 0);

	  return copyin(interp, vol, argv);
	}
      else if (strcmp(argv[1], "copyout") == 0)
	{
	  if (hfs_setcwd(vol, vref->cwd) == -1)
	    return error(interp, 0);

	  return copyout(interp, vol, argv);
	}
      else
	{
	  Tcl_AppendResult(interp, "bad command \"", argv[1],
			   "\" or wrong # args", (char *) 0);
	  return TCL_ERROR;
	}
      break;

    default:
      Tcl_AppendResult(interp, "bad command \"", argv[1],
		       "\" or wrong # args", (char *) 0);
      return TCL_ERROR;
    }

  return TCL_OK;
}

/*
 * NAME:	cmd->hfs()
 * DESCRIPTION:	Tcl HFS command callback
 */
static
int cmd_hfs(ClientData clientData, Tcl_Interp *interp,
	    int argc, char *argv[])
{
  static int id = 0;

  if (argc < 2)
    {
      interp->result = "wrong # args";
      return TCL_ERROR;
    }

  if (strcmp(argv[1], "mount") == 0)
    {
      int partno;
      hfsvol *vol;
      volref *vref;
      Tcl_CmdInfo info;
      Tcl_HashEntry *entry;
      int new;

      if (argc < 3 || argc > 4)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      if (argc == 4)
	{
	  if (Tcl_GetInt(interp, argv[3], &partno) != TCL_OK)
	    return TCL_ERROR;
	}
      else
	{
	  int nparts;

	  suid_enable();
	  nparts = hfs_nparts(argv[2]);
	  suid_disable();

	  if (nparts > 1)
	    {
	      sprintf(interp->result, "must specify partition number "
		      "(%d available)", nparts);
	      return TCL_ERROR;
	    }
	  else if (nparts == -1)
	    partno = 0;
	  else
	    partno = 1;
	}

      vref = ALLOC(volref, 1);
      if (vref == 0)
	{
	  interp->result = "out of memory";
	  return TCL_ERROR;
	}

      suid_enable();
      vol = hfs_mount(argv[2], partno, HFS_MODE_ANY);
      suid_disable();

      if (vol == 0)
	{
	  error(interp, "can't mount volume");
	  FREE(vref);
	  return TCL_ERROR;
	}

      vref->vol = vol;
      vref->cwd = HFS_CNID_ROOTDIR;

      entry = Tcl_CreateHashEntry(&volumes, (char *) vref, &new);

      do
	sprintf(interp->result, "hfsvol%d", id++);
      while (Tcl_GetCommandInfo(interp, interp->result, &info));

      Tcl_CreateCommand(interp, interp->result,
			vol_cmd, vref, vol_del);
    }
  else if (strcmp(argv[1], "zero") == 0)
    {
      int nparts;
      unsigned long len;

      if (argc != 4)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      if (Tcl_GetInt(interp, argv[3], &nparts) != TCL_OK)
	return TCL_ERROR;

      if (do_zero(argv[2], nparts, &len) == -1)
	return error(interp, 0);

      sprintf(interp->result, "%lu", len);
    }
  else if (strcmp(argv[1], "mkpart") == 0)
    {
      unsigned int len;

      if (argc != 4)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      if (Tcl_GetInt(interp, argv[3], &len) != TCL_OK)
	return TCL_ERROR;

      if (do_mkpart(argv[2], len) == -1)
	return error(interp, 0);
    }
  else if (strcmp(argv[1], "nparts") == 0)
    {
      int nparts;

      if (argc != 3)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      suid_enable();
      nparts = hfs_nparts(argv[2]);
      suid_disable();

      sprintf(interp->result, "%d", nparts);
    }
  else if (strcmp(argv[1], "format") == 0)
    {
      int partno;

      if (argc < 5 || argc > 6)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      if (Tcl_GetInt(interp, argv[3], &partno) != TCL_OK)
	return TCL_ERROR;

      if (argc == 6)
	{
	  int listc, i;
	  char **listv;
	  unsigned long *badblocks;

	  if (Tcl_SplitList(interp, argv[5], &listc, &listv) != TCL_OK)
	    return TCL_ERROR;

	  badblocks = ALLOCX(unsigned long, listc);
	  if (listc && badblocks == 0)
	    {
	      free(listv);

	      interp->result = "out of memory";
	      return TCL_ERROR;
	    }

	  for (i = 0; i < listc; ++i)
	    {
	      if (Tcl_ExprLong(interp, listv[i],
			       (long *) &badblocks[i]) != TCL_OK)
		{
		  free(listv);
		  FREE(badblocks);
		  return TCL_ERROR;
		}
	    }

	  free(listv);

	  if (do_format(argv[2], partno, 0, argv[4], listc, badblocks) == -1)
	    {
	      FREE(badblocks);

	      return error(interp, 0);
	    }

	  FREE(badblocks);
	}
      else
	{
	  if (do_format(argv[2], partno, 0, argv[4], 0, 0) == -1)
	    return error(interp, 0);
	}
    }
  else if (strcmp(argv[1], "flushall") == 0)
    hfs_flushall();
  else if (strcmp(argv[1], "chartrans") == 0)
    {
      char *result;

      if (argc != 5)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      if ((strcmp(argv[2], "latin1") != 0 &&
	   strcmp(argv[2], "macroman") != 0) ||
	  (strcmp(argv[3], "latin1") != 0 &&
	   strcmp(argv[3], "macroman") != 0))
	{
	  interp->result = "bad arg to chartrans: "
	    "charsets must be one of latin1, macroman";
	  return TCL_ERROR;
	}

      if (strcmp(argv[2], "latin1") == 0 &&
	  strcmp(argv[3], "macroman") == 0)
	result = cs_macroman(argv[4], 0);
      else if (strcmp(argv[2], "macroman") == 0 &&
	       strcmp(argv[3], "latin1") == 0)
	result = cs_latin1(argv[4], 0);
      else
	{
	  Tcl_SetResult(interp, argv[4], TCL_VOLATILE);
	  return TCL_OK;
	}

      if (result == 0)
	{
	  interp->result = "out of memory";
	  return TCL_ERROR;
	}

      Tcl_SetResult(interp, result, TCL_DYNAMIC);
    }
  else if (strcmp(argv[1], "version") == 0)
    {
      if (argc != 2)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      interp->result = (char *) hfsutils_version;
    }
  else if (strcmp(argv[1], "copyright") == 0)
    {
      if (argc != 2)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      interp->result = (char *) hfsutils_copyright;
    }
  else if (strcmp(argv[1], "author") == 0)
    {
      if (argc != 2)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      interp->result = (char *) hfsutils_author;
    }
  else if (strcmp(argv[1], "license") == 0)
    {
      if (argc != 2)
	{
	  interp->result = "wrong # args";
	  return TCL_ERROR;
	}

      interp->result = (char *) hfsutils_license;
    }
  else
    {
      Tcl_AppendResult(interp, "bad hfs command \"", argv[1],
		       "\": should be one of "
		       "mount, zero, mkpart, format, flushall, "
		       "version, copyright, author, license",
		       (char *) 0);
      return TCL_ERROR;
    }

  return TCL_OK;
}

/*
 * NAME:	cmd->exit()
 * DESCRIPTION:	called to terminate; clean up volume state
 */
static
int cmd_exit(ClientData clientData, Tcl_Interp *interp,
	     int argc, char *argv[])
{
  int status = 0;

  if (argc > 2)
    {
      interp->result = "wrong # args: should be \"exit ?returnCode?\"";
      return TCL_ERROR;
    }

  if (argc == 2 && Tcl_GetInt(interp, argv[1], &status) != TCL_OK)
    return TCL_ERROR;

  hfs_umountall();

  exit(status);

  return TCL_OK;
}

/*
 * NAME:	Hfs->Init()
 * DESCRIPTION:	initialize Tcl components for HFS handling
 */
int Hfs_Init(Tcl_Interp *interp)
{
  Tcl_InitHashTable(&volumes, TCL_ONE_WORD_KEYS);
  Tcl_InitHashTable(&files,   TCL_ONE_WORD_KEYS);

  Tcl_CreateCommand(interp, "hfs",   cmd_hfs,   0, 0);
  Tcl_CreateCommand(interp, "exit",  cmd_exit,  0, 0);

  return TCL_OK;
}
