/*
 * hfsck - tool for checking and repairing the integrity of HFS volumes
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
 * $Id: main.c,v 1.8 1998/11/02 22:08:50 rob Exp $
 */

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <unistd.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <fcntl.h>
# include <errno.h>

# include "hfsck.h"
# include "suid.h"
# include "version.h"

int options;

extern int optind;

/*
 * NAME:	usage()
 * DESCRIPTION:	display usage message
 */
static
int usage(char *argv[])
{
  fprintf(stderr, "Usage: %s [-v] [-n] [-a] device-path [partition-no]\n",
	  argv[0]);

  return 1;
}

/*
 * NAME:	main()
 * DESCRIPTION:	program entry
 */
int main(int argc, char *argv[])
{
  char *path;
  int nparts, pnum, result;
  hfsvol vol;

  suid_init();

  if (argc == 2)
    {
      if (strcmp(argv[1], "--version") == 0)
	{
	  printf("%s - %s\n", hfsutils_version, hfsutils_copyright);
	  printf("`%s --license' for licensing information.\n", argv[0]);
	  return 0;
	}
      else if (strcmp(argv[1], "--license") == 0)
	{
	  printf("\n%s", hfsutils_license);
	  return 0;
	}
    }

  options = HFSCK_REPAIR;

  while (1)
    {
      int opt;

      opt = getopt(argc, argv, "vna");
      if (opt == EOF)
	break;

      switch (opt)
	{
	case '?':
	  return usage(argv);

	case 'v':
	  options |= HFSCK_VERBOSE;
	  break;

	case 'n':
	  options &= ~HFSCK_REPAIR;
	  break;

	case 'a':
	  options |= HFSCK_YES;
	  break;
	}
    }

  if (argc - optind < 1 ||
      argc - optind > 2)
    return usage(argv);

  path = argv[optind];

  suid_enable();
  nparts = hfs_nparts(path);
  suid_disable();

  if (nparts == 0)
    {
      fprintf(stderr, "%s: partitioned medium contains no HFS partitions\n",
	      argv[0]);
      return 1;
    }

  if (argc - optind == 2)
    {
      pnum = atoi(argv[optind + 1]);

      if (pnum < 0)
	{
	  fprintf(stderr, "%s: invalid partition number\n", argv[0]);
	  return 1;
	}

      if (nparts == -1 && pnum > 0)
	{
	  fprintf(stderr, "%s: warning: ignoring partition number for"
		  " non-partitioned medium\n", argv[0]);
	  pnum = 0;
	}
      else if (nparts > 0 && pnum == 0)
	{
	  fprintf(stderr, "%s: cannot specify whole medium"
		  " (has %d partition%s)\n", argv[0], nparts,
		  nparts == 1 ? "" : "s");
	  return 1;
	}
      else if (nparts > 0 && pnum > nparts)
	{
	  fprintf(stderr, "%s: invalid partition number (only %d available)\n",
		  argv[0], nparts);
	  return 1;
	}
    }
  else
    {
      if (nparts > 1)
	{
	  fprintf(stderr, "%s: must specify partition number (%d available)\n",
		  argv[0], nparts);
	  return 1;
	}
      else if (nparts == -1)
	pnum = 0;
      else
	pnum = 1;
    }

  v_init(&vol, HFS_OPT_NOCACHE);

  if (REPAIR)
    {
      suid_enable();
      result = v_open(&vol, path, HFS_MODE_RDWR);
      suid_disable();

      if (result == -1)
	{
	  vol.flags |= HFS_VOL_READONLY;

	  suid_enable();
	  result = v_open(&vol, path, HFS_MODE_RDONLY);
	  suid_disable();
	}
    }

  if (result == -1)
    {
      perror(path);
      return 1;
    }

  if (REPAIR && (vol.flags & HFS_VOL_READONLY))
    {
      fprintf(stderr, "%s: warning: %s not writable; cannot repair\n",
	      argv[0], path);

      options &= ~HFSCK_REPAIR;
    }

  if (v_geometry(&vol, pnum) == -1 ||
      l_getmdb(&vol, &vol.mdb, 0) == -1)
    {
      perror(path);
      v_close(&vol);
      return 1;
    }

  result = hfsck(&vol);

  vol.flags |= HFS_VOL_MOUNTED;

  if (v_close(&vol) == -1)
    {
      perror("closing volume");
      return 1;
    }

  return result;
}
