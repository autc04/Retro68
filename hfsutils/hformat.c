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
 * $Id: hformat.c,v 1.9 1998/11/02 22:08:31 rob Exp $
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

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "suid.h"
# include "hformat.h"

# define O_FORCE	0x01

extern char *optarg;
extern int optind;

/*
 * NAME:	usage()
 * DESCRIPTION:	display usage message
 */
static
void usage(void)
{
  fprintf(stderr, "Usage: %s [-f] [-l label] path [partition-no]\n", argv0);
}

/*
 * NAME:	do_format()
 * DESCRIPTION:	call hfs_format() with necessary privileges
 */
static
hfsvol *do_format(const char *path, int partno, int mode, const char *vname)
{
  hfsvol *vol = 0;

  suid_enable();

  if (hfs_format(path, partno, mode, vname, 0, 0) != -1)
    vol = hfs_mount(path, partno, HFS_MODE_ANY);

  suid_disable();

  return vol;
}

/*
 * NAME:	hformat->main()
 * DESCRIPTION:	implement hformat command
 */
int hformat_main(int argc, char *argv[])
{
  const char *vname;
  char *path = 0;
  hfsvol *vol;
  hfsvolent ent;
  int nparts, partno, options = 0, result = 0;

  vname = "Untitled";

  while (1)
    {
      int opt;

      opt = getopt(argc, argv, "fl:");
      if (opt == EOF)
	break;

      switch (opt)
	{
	case '?':
	  usage();
	  goto fail;

	case 'f':
	  options |= O_FORCE;
	  break;

	case 'l':
	  vname = optarg;
	  break;
	}
    }

  if (argc - optind < 1 || argc - optind > 2)
    {
      usage();
      goto fail;
    }

  path = hfsutil_abspath(argv[optind]);
  if (path == 0)
    {
      fprintf(stderr, "%s: not enough memory\n", argv0);
      goto fail;
    }

  suid_enable();
  nparts = hfs_nparts(path);
  suid_disable();

  if (argc - optind == 2)
    {
      partno = atoi(argv[optind + 1]);

      if (nparts != -1 && partno == 0)
	{
	  if (options & O_FORCE)
	    {
	      fprintf(stderr,
		      "%s: warning: erasing partition information\n", argv0);
	    }
	  else
	    {
	      fprintf(stderr, "%s: medium is partitioned; "
		      "select partition > 0 or use -f\n", argv0);
	      goto fail;
	    }
	}
    }
  else
    {
      if (nparts > 1)
	{
	  fprintf(stderr,
		  "%s: must specify partition number (%d available)\n",
		  argv0, nparts);
	  goto fail;
	}
      else if (nparts == -1)
	partno = 0;
      else
	partno = 1;
    }

  vol = do_format(path, partno, 0, vname);
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
