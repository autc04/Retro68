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
 * $Id: hcopy.c,v 1.8 1998/04/11 08:26:56 rob Exp $
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
# include <errno.h>
# include <sys/stat.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "hcopy.h"
# include "copyin.h"
# include "copyout.h"

extern int optind;

/*
 * NAME:	automode_unix()
 * DESCRIPTION:	automatically choose copyin transfer mode for UNIX path
 */
static
cpifunc automode_unix(const char *path)
{
  int i;
  struct {
    const char *ext;
    cpifunc func;
  } exts[] = {
    { ".bin",  cpi_macb },
    { ".hqx",  cpi_binh },

    { ".txt",  cpi_text },
    { ".c",    cpi_text },
    { ".h",    cpi_text },
    { ".html", cpi_text },
    { ".htm",  cpi_text },
    { ".rtf",  cpi_text },

    { 0,       0        }
  };

  path += strlen(path);

  for (i = 0; exts[i].ext; ++i)
    {
      if (strcasecmp(path - strlen(exts[i].ext), exts[i].ext) == 0)
	return exts[i].func;
    }

  return cpi_raw;
}

/*
 * NAME:	do_copyin()
 * DESCRIPTION:	copy files from UNIX to HFS
 */
static
int do_copyin(hfsvol *vol, int argc, char *argv[], const char *dest, int mode)
{
  hfsdirent ent;
  struct stat sbuf;
  cpifunc copyfile;
  int i, result = 0;

  if (argc > 1 && (hfs_stat(vol, dest, &ent) == -1 ||
		   ! (ent.flags & HFS_ISDIR)))
    {
      ERROR(ENOTDIR, 0);
      hfsutil_perrorp(dest);

      return 1;
    }

  switch (mode)
    {
    case 'm':
      copyfile = cpi_macb;
      break;

    case 'b':
      copyfile = cpi_binh;
      break;

    case 't':
      copyfile = cpi_text;
      break;

    case 'r':
      copyfile = cpi_raw;
      break;
    }

  for (i = 0; i < argc; ++i)
    {
      if (stat(argv[i], &sbuf) != -1 &&
	  S_ISDIR(sbuf.st_mode))
	{
	  ERROR(EISDIR, 0);
	  hfsutil_perrorp(argv[i]);

	  result = 1;
	}
      else
	{
	  if (mode == 'a')
	    copyfile = automode_unix(argv[i]);

	  if (copyfile(argv[i], vol, dest) == -1)
	    {
	      ERROR(errno, cpi_error);
	      hfsutil_perrorp(argv[i]);

	      result = 1;
	    }
	}
    }

  return result;
}

/*
 * NAME:	automode_hfs()
 * DESCRIPTION:	automatically choose copyout transfer mode for HFS path
 */
static
cpofunc automode_hfs(hfsvol *vol, const char *path)
{
  hfsdirent ent;

  if (hfs_stat(vol, path, &ent) != -1)
    {
      if (strcmp(ent.u.file.type, "TEXT") == 0 ||
	  strcmp(ent.u.file.type, "ttro") == 0)
	return cpo_text;
      else if (ent.u.file.rsize == 0)
	return cpo_raw;
    }

  return cpo_macb;
}

/*
 * NAME:	do_copyout()
 * DESCRIPTION:	copy files from HFS to UNIX
 */
static
int do_copyout(hfsvol *vol, int argc, char *argv[], const char *dest, int mode)
{
  struct stat sbuf;
  hfsdirent ent;
  cpofunc copyfile;
  int i, result = 0;

  if (argc > 1 && (stat(dest, &sbuf) == -1 ||
		   ! S_ISDIR(sbuf.st_mode)))
    {
      ERROR(ENOTDIR, 0);
      hfsutil_perrorp(dest);

      return 1;
    }

  switch (mode)
    {
    case 'm':
      copyfile = cpo_macb;
      break;

    case 'b':
      copyfile = cpo_binh;
      break;

    case 't':
      copyfile = cpo_text;
      break;

    case 'r':
      copyfile = cpo_raw;
      break;
    }

  for (i = 0; i < argc; ++i)
    {
      if (hfs_stat(vol, argv[i], &ent) != -1 &&
	  (ent.flags & HFS_ISDIR))
	{
	  ERROR(EISDIR, 0);
	  hfsutil_perrorp(argv[i]);

	  result = 1;
	}
      else
	{
	  if (mode == 'a')
	    copyfile = automode_hfs(vol, argv[i]);

	  if (copyfile(vol, argv[i], dest) == -1)
	    {
	      ERROR(errno, cpo_error);
	      hfsutil_perrorp(argv[i]);

	      result = 1;
	    }
	}
    }

  return result;
}

/*
 * NAME:	usage()
 * DESCRIPTION:	display usage message
 */
static
int usage(void)
{
  fprintf(stderr, "Usage: %s [-m|-b|-t|-r|-a] source-path [...] target-path\n",
	  argv0);

  return 1;
}

/*
 * NAME:	hcopy->main()
 * DESCRIPTION:	implement hcopy command
 */
int hcopy_main(int argc, char *argv[])
{
  int nargs, mode = 'a', result = 0;
  const char *target;
  int fargc;
  char **fargv;
  hfsvol *vol;
  int (*copy)(hfsvol *, int, char *[], const char *, int);

  while (1)
    {
      int opt;

      opt = getopt(argc, argv, "mbtra");
      if (opt == EOF)
	break;

      switch (opt)
	{
	case '?':
	  return usage();

	default:
	  mode = opt;
	}
    }

  nargs = argc - optind;

  if (nargs < 2)
    return usage();

  target = argv[argc - 1];

  if (strchr(target, ':') && target[0] != '.' && target[0] != '/')
    {
      vol = hfsutil_remount(hcwd_getvol(-1), HFS_MODE_ANY);
      if (vol == 0)
	return 1;

      copy  = do_copyin;
      fargc = nargs - 1;
      fargv = &argv[optind];
    }
  else
    {
      vol = hfsutil_remount(hcwd_getvol(-1), HFS_MODE_RDONLY);
      if (vol == 0)
	return 1;

      copy  = do_copyout;
      fargv = hfsutil_glob(vol, nargs - 1, &argv[optind], &fargc, &result);
    }

  if (result == 0)
    result = copy(vol, fargc, fargv, target, mode);

  hfsutil_unmount(vol, &result);

  if (fargv && fargv != &argv[optind])
    free(fargv);

  return result;
}
