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
 * $Id: humount.c,v 1.6 1998/04/11 08:26:59 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <string.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "humount.h"

/*
 * NAME:	humount->main()
 * DESCRIPTION:	implement humount command
 */
int humount_main(int argc, char *argv[])
{
  int vnum;
  mountent *ent;

  if (argc > 2)
    {
      fprintf(stderr, "Usage: %s [volume-name-or-path]\n", argv0);
      return 1;
    }

  if (argc == 1)
    {
      if (hcwd_umounted(-1) == -1 &&
	  hcwd_getvol(-1) == 0)
	{
	  fprintf(stderr, "%s: No volume is current\n", argv0);
	  return 1;
	}

      return 0;
    }

  for (ent = hcwd_getvol(vnum = 0); ent; ent = hcwd_getvol(++vnum))
    {
      if (hfsutil_samepath(argv[1], ent->path) ||
	  strcasecmp(argv[1], ent->vname) == 0)
	{
	  hcwd_umounted(vnum);
	  return 0;
	}
    }

  fprintf(stderr, "%s: Unknown volume \"%s\"\n", argv0, argv[1]);

  return 1;
}
