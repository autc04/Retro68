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
 * $Id: hmkdir.c,v 1.6 1998/04/11 08:26:58 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <stdlib.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "hmkdir.h"

/*
 * NAME:	hmkdir->main()
 * DESCRIPTION:	implement hmkdir command
 */
int hmkdir_main(int argc, char *argv[])
{
  hfsvol *vol;
  char **fargv;
  int fargc, i, result = 0;

  if (argc < 2)
    {
      fprintf(stderr, "Usage: %s hfs-path [...]\n", argv0);
      return 1;
    }

  vol = hfsutil_remount(hcwd_getvol(-1), HFS_MODE_ANY);
  if (vol == 0)
    return 1;

  fargv = hfsutil_glob(vol, argc - 1, &argv[1], &fargc, &result);

  if (result == 0)
    {
      for (i = 0; i < fargc; ++i)
	{
	  if (hfs_mkdir(vol, fargv[i]) == -1)
	    {
	      hfsutil_perrorp(fargv[i]);
	      result = 1;
	    }
	}
    }

  hfsutil_unmount(vol, &result);

  if (fargv)
    free(fargv);

  return result;
}
