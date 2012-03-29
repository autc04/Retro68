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
 * $Id: hcd.c,v 1.8 1998/11/02 22:08:30 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <stdlib.h>
# include <string.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "hcd.h"

/*
 * NAME:	hcd->main()
 * DESCRIPTION:	implement hcd command
 */
int hcd_main(int argc, char *argv[])
{
  mountent *ment;
  hfsvol *vol;
  hfsvolent vent;
  char *path, root[HFS_MAX_VLEN + 1 + 1];
  int fargc;
  char **fargv = 0;
  int result = 0;

  if (argc > 2)
    {
      fprintf(stderr, "Usage: %s [hfs-path]\n", argv0);
      return 1;
    }

  vol = hfsutil_remount(ment = hcwd_getvol(-1), HFS_MODE_RDONLY);
  if (vol == 0)
    return 1;

  if (argc == 2)
    {
      fargv = hfsutil_glob(vol, 1, &argv[1], &fargc, &result);
      if (result == 0)
	{
	  if (fargc != 1)
	    {
	      fprintf(stderr, "%s: %s: ambiguous path\n", argv0, argv[1]);
	      result = 1;
	    }
	  else
	    path = fargv[0];
	}
    }
  else
    {
      hfs_vstat(vol, &vent);

      strcpy(root, vent.name);
      strcat(root, ":");
      path = root;
    }

  if (result == 0)
    {
      if (hfs_chdir(vol, path) == -1)
	{
	  hfsutil_perrorp(path);
	  result = 1;
	}
      else
	{
	  path = hfsutil_getcwd(vol);
	  if (path == 0)
	    {
	      hfsutil_perror("Can't get new HFS directory path");
	      result = 1;
	    }

	  if (result == 0 && hcwd_setcwd(ment, path) == -1)
	    {
	      perror("Can't set new HFS directory");
	      result = 1;
	    }

	  if (path)
	    free(path);
	}
    }

  hfsutil_unmount(vol, &result);

  if (fargv)
    free(fargv);

  return result;
}
