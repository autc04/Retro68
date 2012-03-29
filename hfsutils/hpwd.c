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
 * $Id: hpwd.c,v 1.7 1998/04/11 08:26:59 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "hpwd.h"

/*
 * NAME:	hpwd->main()
 * DESCRIPTION:	implement hpwd command
 */
int hpwd_main(int argc, char *argv[])
{
  mountent *ent;

  if (argc != 1)
    {
      fprintf(stderr, "Usage: %s\n", argv0);
      return 1;
    }

  ent = hcwd_getvol(-1);
  if (ent == 0)
    {
      fprintf(stderr, "%s: No volume is current; use `hmount' or `hvol'\n",
	      argv0);
      return 1;
    }

  if (strcmp(ent->cwd, ":") == 0)
    printf("%s:\n", ent->vname);
  else
    printf("%s%s:\n", ent->vname, ent->cwd);

  return 0;
}
