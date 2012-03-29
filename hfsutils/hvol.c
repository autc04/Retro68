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
 * $Id: hvol.c,v 1.7 1998/04/11 08:27:00 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <string.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "hvol.h"

/*
 * NAME:	showvol()
 * DESCRIPTION:	output information about a mounted volume
 */
static
int showvol(mountent *ment)
{
  hfsvol *vol;
  hfsvolent vent;
  int result = 0;

  printf("Current volume is mounted from");
  if (ment->partno > 0)
    printf(" partition %d of", ment->partno);
  printf(":\n  %s\n", ment->path);

  vol = hfsutil_remount(ment, HFS_MODE_ANY);
  if (vol == 0)
    return 1;

  printf("\n");

  hfs_vstat(vol, &vent);
  hfsutil_pinfo(&vent);
  hfsutil_unmount(vol, &result);

  return result;
}

/*
 * NAME:	hvol->main()
 * DESCRIPTION:	implement hvol command
 */
int hvol_main(int argc, char *argv[])
{
  int vnum;
  mountent *ment;

  if (argc > 2)
    {
      fprintf(stderr, "Usage: %s [volume-name-or-path]\n", argv0);
      return 1;
    }

  if (argc == 1)
    {
      int output = 0, header = 0;

      ment = hcwd_getvol(-1);
      if (ment)
	{
	  showvol(ment);
	  output = 1;
	}

      for (vnum = 0; ; ++vnum)
	{
	  mountent *ent;

	  ent = hcwd_getvol(vnum);
	  if (ent == 0)
	    break;

	  if (ent == ment)
	    continue;

	  if (header == 0)
	    {
	      printf("%s volumes:\n", ment ? "\nOther known" : "Known");
	      header = 1;
	    }

	  if (ent->partno <= 0)
	    printf("  %-35s     \"%s\"\n", ent->path, ent->vname);
	  else
	    printf("  %-35s %2d  \"%s\"\n", ent->path, ent->partno,
		   ent->vname);

	  output = 1;
	}

      if (output == 0)
	printf("No known volumes; use `hmount' to introduce new volumes\n");

      return 0;
    }

  for (ment = hcwd_getvol(vnum = 0); ment; ment = hcwd_getvol(++vnum))
    {
      if (hfsutil_samepath(argv[1], ment->path) ||
	  strcasecmp(argv[1], ment->vname) == 0)
	{
	  hcwd_setvol(vnum);
	  return showvol(ment);
	}
    }

  fprintf(stderr, "%s: Unknown volume \"%s\"\n", argv0, argv[1]);

  return 1;
}
