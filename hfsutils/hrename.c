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
 * $Id: hrename.c,v 1.7 1998/04/11 08:26:59 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <stdlib.h>
# include <errno.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "hrename.h"

/*
 * NAME:	do_rename()
 * DESCRIPTION:	move/rename files
 */
static
int do_rename(hfsvol *vol, int argc, char *argv[], const char *dest)
{
  hfsdirent ent;
  int i, result = 0;

  if (argc > 1 && (hfs_stat(vol, dest, &ent) == -1 ||
		   ! (ent.flags & HFS_ISDIR)))
    {
      ERROR(ENOTDIR, 0);
      hfsutil_perrorp(dest);

      return 1;
    }

  for (i = 0; i < argc; ++i)
    {
      if (hfs_rename(vol, argv[i], dest) == -1)
	{
	  hfsutil_perrorp(argv[i]);
	  result = 1;
	}
    }

  return result;
}

/*
 * NAME:	hrename->main()
 * DESCRIPTION:	implement hrename command
 */
int hrename_main(int argc, char *argv[])
{
  mountent *ment;
  hfsvol *vol;
  int fargc;
  char **fargv;
  int result = 0;

  if (argc < 3)
    {
      fprintf(stderr, "Usage: %s hfs-src-path [...] hfs-target-path\n", argv0);
      return 1;
    }

  vol = hfsutil_remount(ment = hcwd_getvol(-1), HFS_MODE_ANY);
  if (vol == 0)
    return 1;

  fargv = hfsutil_glob(vol, argc - 2, &argv[1], &fargc, &result);

  if (result == 0)
    result = do_rename(vol, fargc, fargv, argv[argc - 1]);

  if (result == 0)
    {
      char *path;

      path = hfsutil_getcwd(vol);
      if (path == 0)
	{
	  hfsutil_perror("Can't get current HFS directory path");
	  result = 1;
	}
      else if (hcwd_setcwd(ment, path) == -1)
	{
	  perror("Can't set current HFS directory");
	  result = 1;
	}

      if (path)
	free(path);
    }

  hfsutil_unmount(vol, &result);

  if (fargv)
    free(fargv);

  return result;
}
