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
 * $Id: hfsutil.c,v 1.9 1998/09/28 23:21:49 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <time.h>
# include <ctype.h>
# include <errno.h>
# include <sys/stat.h>

# ifdef HAVE_UNISTD_H
#  include <unistd.h>
# else
char *getcwd(char *buf, size_t size);
# endif

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "suid.h"
# include "glob.h"
# include "version.h"

# include "hattrib.h"
# include "hcd.h"
# include "hcopy.h"
# include "hdel.h"
# include "hformat.h"
# include "hls.h"
# include "hmkdir.h"
# include "hmount.h"
# include "hpwd.h"
# include "hrename.h"
# include "hrmdir.h"
# include "humount.h"
# include "hvol.h"

const char *argv0, *bargv0;

/*
 * NAME:	main()
 * DESCRIPTION:	program entry dispatch
 */
int main(int argc, char *argv[])
{
  int i, len;
  const char *dot;

  struct {
    const char *name;
    int (*func)(int, char *[]);
  } list[] = {
    { "hattrib", hattrib_main },
    { "hcd",     hcd_main     },
    { "hcopy",   hcopy_main   },
    { "hdel",    hdel_main    },
    { "hdir",    hls_main     },
    { "hformat", hformat_main },
    { "hls",     hls_main     },
    { "hmkdir",  hmkdir_main  },
    { "hmount",  hmount_main  },
    { "hpwd",    hpwd_main    },
    { "hrename", hrename_main },
    { "hrmdir",  hrmdir_main  },
    { "humount", humount_main },
    { "hvol",    hvol_main    },
    { 0,         0            }
  };

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

  argv0 = argv[0];

  bargv0 = strrchr(argv0, '/');
  if (bargv0 == 0)
    bargv0 = argv0;
  else
    ++bargv0;

  dot = strchr(bargv0, '.');
  len = dot ? dot - bargv0 : strlen(bargv0);

  for (i = 0; list[i].name; ++i)
    {
      if (strncmp(bargv0, list[i].name, len) == 0)
	{
	  int result;

	  bargv0 = list[i].name;

	  if (hcwd_init() == -1)
	    {
	      perror("Failed to initialize HFS working directories");
	      return 1;
	    }

	  result = list[i].func(argc, argv);

	  if (hcwd_finish() == -1)
	    {
	      perror("Failed to save working directory state");
	      return 1;
	    }

	  return result;
	}
    }

  fprintf(stderr, "%s: Unknown operation `%s'\n", argv0, bargv0);
  return 1;
}

/*
 * NAME:	hfsutil->perror()
 * DESCRIPTION:	output an HFS error
 */
void hfsutil_perror(const char *msg)
{
  const char *str = strerror(errno);

  if (hfs_error == 0)
    fprintf(stderr, "%s: %s: %c%s\n", argv0, msg, tolower(*str), str + 1);
  else
    fprintf(stderr, "%s: %s: %s (%s)\n", argv0, msg, hfs_error, str);
}

/*
 * NAME:	hfsutil->perrorp()
 * DESCRIPTION:	output an HFS error for a pathname
 */
void hfsutil_perrorp(const char *path)
{
  const char *str = strerror(errno);

  if (hfs_error == 0)
    fprintf(stderr, "%s: \"%s\": %c%s\n", argv0, path, tolower(*str), str + 1);
  else
    fprintf(stderr, "%s: \"%s\": %s (%s)\n", argv0, path, hfs_error, str);
}

/*
 * NAME:	hfsutil->remount()
 * DESCRIPTION:	mount a volume as though it were still mounted
 */
hfsvol *hfsutil_remount(mountent *ment, int flags)
{
  hfsvol *vol;
  hfsvolent vent;

  if (ment == 0)
    {
      fprintf(stderr, "%s: No volume is current; use `hmount' or `hvol'\n",
	      argv0);
      return 0;
    }

  suid_enable();
  vol = hfs_mount(ment->path, ment->partno, flags);
  suid_disable();

  if (vol == 0)
    {
      hfsutil_perror(ment->path);
      return 0;
    }

  hfs_vstat(vol, &vent);

  if (strcmp(vent.name, ment->vname) != 0)
    {
      fprintf(stderr, "%s: Expected volume \"%s\" not found\n",
	      argv0, ment->vname);
      fprintf(stderr, "%s: Replace media on %s or use `hmount'\n",
	      argv0, ment->path);

      hfs_umount(vol);
      return 0;
    }

  if (hfs_chdir(vol, ment->cwd) == -1)
    {
      fprintf(stderr, "%s: Current HFS directory \"%s%s:\" no longer exists\n",
	      argv0, ment->vname, ment->cwd);
    }

  return vol;
}

/*
 * NAME:	hfsutil->unmount()
 * DESCRIPTION:	unmount a volume
 */
void hfsutil_unmount(hfsvol *vol, int *result)
{
  if (hfs_umount(vol) == -1 && *result == 0)
    {
      hfsutil_perror("Error closing HFS volume");
      *result = 1;
    }
}

/*
 * NAME:	hfsutil->pinfo()
 * DESCRIPTION:	print information about a volume
 */
void hfsutil_pinfo(hfsvolent *ent)
{
  printf("Volume name is \"%s\"%s\n", ent->name,
	 (ent->flags & HFS_ISLOCKED) ? " (locked)" : "");
  printf("Volume was created on %s", ctime(&ent->crdate));
  printf("Volume was last modified on %s", ctime(&ent->mddate));
  printf("Volume has %lu bytes free\n", ent->freebytes);
}

/*
 * NAME:	hfsutil->glob()
 * DESCRIPTION:	perform filename globbing
 */
char **hfsutil_glob(hfsvol *vol, int argc, char *argv[],
		    int *nelts, int *result)
{
  char **fargv;

  fargv = hfs_glob(vol, argc, argv, nelts);
  if (fargv == 0 && *result == 0)
    {
      fprintf(stderr, "%s: globbing error\n", argv0);
      *result = 1;
    }

  return fargv;
}

/*
 * NAME:	hfsutil->getcwd()
 * DESCRIPTION:	return full path to current directory (must be free()'d)
 */
char *hfsutil_getcwd(hfsvol *vol)
{
  char *path, name[HFS_MAX_FLEN + 1 + 1];
  long cwd;
  int pathlen;

  path    = malloc(1);
  path[0] = 0;
  pathlen = 0;
  cwd     = hfs_getcwd(vol);

  while (cwd != HFS_CNID_ROOTPAR)
    {
      char *new;
      int namelen, i;

      if (hfs_dirinfo(vol, &cwd, name) == -1)
	return 0;

      if (pathlen)
	strcat(name, ":");

      namelen = strlen(name);

      new = realloc(path, namelen + pathlen + 1);
      if (new == 0)
	{
	  free(path);
	  ERROR(ENOMEM, 0);
	  return 0;
	}

      if (pathlen == 0)
	new[0] = 0;

      path = new;

      /* push string down to make room for path prefix (memmove()-ish) */

      i = pathlen + 1;
      for (new = path + namelen + pathlen; i--; new--)
	*new = *(new - namelen);

      memcpy(path, name, namelen);

      pathlen += namelen;
    }

  return path;
}

/*
 * NAME:	hfsutil->samepath()
 * DESCRIPTION:	return 1 iff paths refer to same object
 */
int hfsutil_samepath(const char *path1, const char *path2)
{
  struct stat sbuf1, sbuf2;

  return
    stat(path1, &sbuf1) == 0 &&
    stat(path2, &sbuf2) == 0 &&
    sbuf1.st_dev == sbuf2.st_dev &&
    sbuf1.st_ino == sbuf2.st_ino;
}

/*
 * NAME:	hfsutil->abspath()
 * DESCRIPTION:	make given UNIX path absolute (must be free()'d)
 */
char *hfsutil_abspath(const char *path)
{
  char *cwd, *buf;
  size_t len;

  if (path[0] == '/')
    return strdup(path);

  cwd = getenv("PWD");
  if (cwd && hfsutil_samepath(cwd, "."))
    {
      buf = malloc(strlen(cwd) + 1 + strlen(path) + 1);
      if (buf == 0)
	return 0;

      strcpy(buf, cwd);
    }
  else
    {
      len = 32;
      cwd = malloc(len);
      if (cwd == 0)
	return 0;

      while (getcwd(cwd, len) == 0)
	{
	  if (errno != ERANGE)
	    {
	      free(cwd);
	      return 0;
	    }

	  len <<= 1;
	  buf = realloc(cwd, len);
	  if (buf == 0)
	    {
	      free(cwd);
	      return 0;
	    }

	  cwd = buf;
	}

      buf = realloc(cwd, strlen(cwd) + 1 + strlen(path) + 1);
      if (buf == 0)
	{
	  free(cwd);
	  return 0;
	}
    }

  strcat(buf, "/");
  strcat(buf, path);

  return buf;
}
