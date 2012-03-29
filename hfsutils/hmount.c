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
 * $Id: hmount.c,v 1.8 1998/04/11 08:26:59 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <stdlib.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "suid.h"
# include "hmount.h"

/*
 * NAME:	hmount->main()
 * DESCRIPTION:	implement hmount command
 */
int hmount_main(int argc, char *argv[])
{
  char *path = 0;
  hfsvol *vol;
  hfsvolent ent;
  int nparts, partno, result = 0;

  if (argc < 2 || argc > 3)
    {
      fprintf(stderr, "Usage: %s source-path [partition-no]\n", argv0);
      goto fail;
    }

  path = hfsutil_abspath(argv[1]);
  if (path == 0)
    {
      fprintf(stderr, "%s: not enough memory\n", argv0);
      goto fail;
    }

  suid_enable();
  nparts = hfs_nparts(path);
  suid_disable();

  if (nparts >= 0)
    printf("%s: contains %d HFS partition%s\n", path, nparts,
	   nparts == 1 ? "" : "s");

  if (argc == 3)
    partno = atoi(argv[2]);
  else
    {
      if (nparts > 1)
	{
	  fprintf(stderr, "%s: must specify partition number\n", argv0);
	  goto fail;
	}
      else if (nparts == -1)
	partno = 0;
      else
	partno = 1;
    }

  suid_enable();
  vol = hfs_mount(path, partno, HFS_MODE_ANY);
  suid_disable();

  if (vol == 0)
    {
      hfsutil_perror(path);
      goto fail;
    }

  hfs_vstat(vol, &ent);
  hfsutil_pinfo(&ent);

  if (hcwd_mounted(ent.name, ent.crdate, path, partno) == -1)
    {
      perror("Failed to record mount");
      result = 1;
    }

  hfsutil_unmount(vol, &result);

  free(path);

  return result;

fail:
  if (path)
    free(path);

  return 1;
}
