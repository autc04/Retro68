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
 * $Id: hls.c,v 1.8 1998/09/28 23:21:50 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# ifdef HAVE_UNISTD_H
#  include <unistd.h>
# endif

# ifdef HAVE_TERMIOS_H
#  include <termios.h>
# endif

# ifdef HAVE_SYS_IOCTL_H
#  include <sys/ioctl.h>
# else
int ioctl(int, int, ...);
# endif

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <time.h>
# include <ctype.h>
# include <errno.h>

# include "hfs.h"
# include "hcwd.h"
# include "hfsutil.h"
# include "darray.h"
# include "dlist.h"
# include "dstring.h"
# include "hls.h"

# define HLS_ALL_FILES		0x0001
# define HLS_ESCAPE		0x0002
# define HLS_QUOTE		0x0004
# define HLS_QMARK_CTRL		0x0008
# define HLS_IMMEDIATE_DIRS	0x0010
# define HLS_CATIDS		0x0020
# define HLS_REVERSE		0x0040
# define HLS_SIZE		0x0080
# define HLS_INDICATOR		0x0100
# define HLS_RECURSIVE		0x0200
# define HLS_NAME		0x0400
# define HLS_SPACE		0x0800

# define F_MASK			0x0007
# define F_LONG			0x0000
# define F_ONE			0x0001
# define F_MANY			0x0002
# define F_HORIZ		0x0003
# define F_COMMAS		0x0004

# define T_MASK			0x0008
# define T_MOD			0x0000
# define T_CREATE		0x0008

# define S_MASK			0x0030
# define S_NAME			0x0000
# define S_TIME			0x0010
# define S_SIZE			0x0020

# define PATH(ent)	((ent).path ? (ent).path : (ent).dirent.name)

typedef struct _queueent_ {
  char *path;
  hfsdirent dirent;
  void (*free)(struct _queueent_ *);
} queueent;

extern char *optarg;
extern int optind;

/*
 * NAME:	usage()
 * DESCRIPTION:	display usage message
 */
static
int usage(void)
{
  fprintf(stderr, "Usage: %s [options] [hfs-path ...]\n", argv0);

  return 1;
}

/*
 * NAME:	dpfree()
 * DESCRIPTION:	free a queue entry containing dynamically-allocated data
 */
static
void dpfree(queueent *ent)
{
  free(ent->path);
}

/*
 * NAME:	qnew()
 * DESCRIPTION:	create a new queue array
 */
static
darray *qnew(void)
{
  return darr_new(sizeof(queueent));
}

/*
 * NAME:	qfree()
 * DESCRIPTION:	free a queue array
 */
static
void qfree(darray *array)
{
  int i, sz;
  queueent *ents;

  sz   = darr_size(array);
  ents = darr_array(array);

  for (i = 0; i < sz; ++i)
    if (ents[i].free)
      ents[i].free(&ents[i]);

  darr_free(array);
}

static
int reverse;

/*
 * NAME:	compare_names()
 * DESCRIPTION:	lexicographically compare two filenames
 */
static
int compare_names(const queueent *ent1, const queueent *ent2)
{
  return reverse * strcasecmp(PATH(*ent1), PATH(*ent2));
}

/*
 * NAME:	compare_mtimes()
 * DESCRIPTION:	chronologically compare two modification dates
 */
static
int compare_mtimes(const queueent *ent1, const queueent *ent2)
{
  return reverse * (ent2->dirent.mddate - ent1->dirent.mddate);
}

/*
 * NAME:	compare_ctimes()
 * DESCRIPTION:	chronologically compare two creation dates
 */
static
int compare_ctimes(const queueent *ent1, const queueent *ent2)
{
  return reverse * (ent2->dirent.crdate - ent1->dirent.crdate);
}

/*
 * NAME:	compare_sizes()
 * DESCRIPTION:	compare two file sizes
 */
static
int compare_sizes(const queueent *ent1, const queueent *ent2)
{
  return reverse *
    ((ent2->dirent.u.file.dsize + ent2->dirent.u.file.rsize) -
     (ent1->dirent.u.file.dsize + ent1->dirent.u.file.rsize));
}

/*
 * NAME:	sortfiles()
 * DESCRIPTION:	arrange files in order according to sort selection
 */
static
void sortfiles(darray *files, int flags, int options)
{
  int (*compare)(const queueent *, const queueent *);

  switch (options & S_MASK)
    {
    case S_NAME:
      compare = compare_names;
      break;

    case S_TIME:
      switch (options & T_MASK)
	{
	case T_MOD:
	  compare = compare_mtimes;
	  break;

	case T_CREATE:
	  compare = compare_ctimes;
	  break;

	default:
	  abort();
	}
      break;

    case S_SIZE:
      compare = compare_sizes;
      break;

    default:
      return;
    }

  reverse = (flags & HLS_REVERSE) ? -1 : 1;

  darr_sort(files, (int (*)(const void *, const void *)) compare);
}

/*
 * NAME:	outpath()
 * DESCRIPTION:	modulate an output string given current flags
 */
static
int outpath(dstring *str, queueent *ent, int flags)
{
  const char *path;

  path = PATH(*ent);

  dstr_shrink(str, 0);

  if ((flags & HLS_QUOTE) &&
      dstr_append(str, "\"", 1) == -1)
    return -1;

  if (flags & (HLS_ESCAPE | HLS_QUOTE | HLS_QMARK_CTRL))
    {
      const char *ptr;

      for (ptr = path; *ptr; ++ptr)
	{
	  const char *add;
	  char buf[5];

	  if (flags & HLS_ESCAPE)
	    {
	      switch (*ptr)
		{
		case '\\':
		  add = "\\\\";
		  break;

		case '\n':
		  add = "\\n";
		  break;

		case '\b':
		  add = "\\b";
		  break;

		case '\r':
		  add = "\\r";
		  break;

		case '\t':
		  add = "\\t";
		  break;

		case '\f':
		  add = "\\f";
		  break;

		case ' ':
		  add = "\\ ";
		  break;

		case '\"':
		  add = "\\\"";
		  break;

		default:
		  if (isgraph(*ptr))
		    {
		      sprintf(buf, "%c", *ptr);
		      add = buf;
		    }
		  else
		    {
		      sprintf(buf, "\\%03o", (unsigned char) *ptr);
		      add = buf;
		    }
		}
	    }
	  else  /* ! (flags & HLS_ESCAPE) */
	    {
	      if (isprint(*ptr) || ! (flags & HLS_QMARK_CTRL))
		{
		  sprintf(buf, "%c", *ptr);
		  add = buf;
		}
	      else
		{
		  sprintf(buf, "?");
		  add = buf;
		}
	    }

	  if (dstr_append(str, add, -1) == -1)
	    return -1;
	}
    }
  else
    {
      if (dstr_append(str, path, -1) == -1)
	return -1;
    }

  if ((flags & HLS_QUOTE) &&
      dstr_append(str, "\"", 1) == -1)
    return -1;

  if (flags & HLS_INDICATOR)
    {
      char c = 0;

      if (ent->dirent.flags & HFS_ISDIR)
	c = ':';
      else if (strcmp(ent->dirent.u.file.type, "APPL") == 0)
	c = '*';

      if (c && dstr_append(str, &c, 1) == -1)
	return -1;
    }

  return 0;
}

/*
 * NAME:	misclen()
 * DESCRIPTION:	string length of miscellaneous section
 */
static
int misclen(int flags)
{
  return ((flags & HLS_CATIDS) ? 8 : 0) +
         ((flags & HLS_SIZE)   ? 5 : 0);
}

/*
 * NAME:	showmisc()
 * DESCRIPTION:	output miscellaneous numbers
 */
static
void showmisc(hfsdirent *ent, int flags)
{
  unsigned long size;

  size = ent->u.file.rsize + ent->u.file.dsize;

  if (flags & HLS_CATIDS)
    printf("%7lu ", ent->cnid);
  if (flags & HLS_SIZE)
    printf("%4lu ", size / 1024 + (size % 1024 != 0));
}

/*
 * NAME:	show_long()
 * DESCRIPTION:	output a list of files in long format
 */
static
void show_long(int sz, queueent *ents, char **strs,
	       int flags, int options, int width)
{
  int i;
  time_t now;

  now = time(0);

  for (i = 0; i < sz; ++i)
    {
      hfsdirent *ent;
      time_t when;
      char timebuf[26];

      ent = &ents[i].dirent;

      switch (options & T_MASK)
	{
	case T_MOD:
	  when = ent->mddate;
	  break;

	case T_CREATE:
	  when = ent->crdate;
	  break;

	default:
	  abort();
	}

      strcpy(timebuf, ctime(&when));

      if (now > when + 6L * 30L * 24L * 60L * 60L ||
	  now < when - 60L * 60L)
	strcpy(timebuf + 11, timebuf + 19);

      timebuf[16] = 0;

      showmisc(ent, flags);

      if (ent->flags & HFS_ISDIR)
	printf("d%c %9u item%c               %s %s\n",
	       ent->fdflags & HFS_FNDR_ISINVISIBLE ? 'i' : ' ',
	       ent->u.dir.valence, ent->u.dir.valence == 1 ? ' ' : 's',
	       timebuf + 4, strs[i]);
      else
	printf("%c%c %4s/%4s %9lu %9lu %s %s\n",
	       ent->flags & HFS_ISLOCKED ? 'F' : 'f',
	       ent->fdflags & HFS_FNDR_ISINVISIBLE ? 'i' : ' ',
	       ent->u.file.type, ent->u.file.creator,
	       ent->u.file.rsize, ent->u.file.dsize,
	       timebuf + 4, strs[i]);
    }
}

/*
 * NAME:	show_one()
 * DESCRIPTION:	output a list of files in single-column format
 */
static
void show_one(int sz, queueent *ents, char **strs,
	      int flags, int options, int width)
{
  int i;

  for (i = 0; i < sz; ++i)
    {
      showmisc(&ents[i].dirent, flags);
      printf("%s\n", strs[i]);
    }
}

/*
 * NAME:	show_many()
 * DESCRIPTION:	output a list of files in vertical-column format
 */
static
void show_many(int sz, queueent *ents, char **strs,
	       int flags, int options, int width)
{
  int i, len, misc, maxlen = 0, rows, cols, row;

  misc = misclen(flags);

  for (i = 0; i < sz; ++i)
    {
      len = strlen(strs[i]) + misc;
      if (len > maxlen)
	maxlen = len;
    }

  maxlen += 2;

  cols = width / maxlen;
  if (cols == 0)
    cols = 1;

  rows = sz / cols + (sz % cols != 0);

  for (row = 0; row < rows; ++row)
    {
      i = row;

      while (1)
	{
	  showmisc(&ents[i].dirent, flags);
	  printf("%s", strs[i]);

	  i += rows;
	  if (i >= sz)
	    break;

	  for (len = strlen(strs[i - rows]) + misc;
	       len < maxlen; ++len)
	    putchar(' ');
	}

      putchar('\n');
    }
}

/*
 * NAME:	show_horiz()
 * DESCRIPTION:	output a list of files in horizontal-column format
 */
static
void show_horiz(int sz, queueent *ents, char **strs,
		int flags, int options, int width)
{
  int i, len, misc, maxlen = 0, cols;

  misc = misclen(flags);

  for (i = 0; i < sz; ++i)
    {
      len = strlen(strs[i]) + misc;
      if (len > maxlen)
	maxlen = len;
    }

  maxlen += 2;

  cols = width / maxlen;
  if (cols == 0)
    cols = 1;

  for (i = 0; i < sz; ++i)
    {
      if (i)
	{
	  if (i % cols == 0)
	    putchar('\n');
	  else
	    {
	      for (len = strlen(strs[i - 1]) + misc;
		   len < maxlen; ++len)
		putchar(' ');
	    }
	}

      showmisc(&ents[i].dirent, flags);
      printf("%s", strs[i]);
    }

  if (i)
    putchar('\n');
}

/*
 * NAME:	show_commas()
 * DESCRIPTION:	output a list of files in comma-delimited format
 */
static
void show_commas(int sz, queueent *ents, char **strs,
		 int flags, int options, int width)
{
  int i, pos = 0;

  for (i = 0; i < sz; ++i)
    {
      hfsdirent *ent;
      int len;

      ent = &ents[i].dirent;
      len = strlen(strs[i]) + misclen(flags) + ((i < sz - 1) ? 2 : 0);

      if (pos && pos + len >= width)
	{
	  putchar('\n');
	  pos = 0;
	}

      showmisc(ent, flags);
      printf("%s", strs[i]);

      if (i < sz - 1)
	{
	  putchar(',');
	  putchar(' ');
	}

      pos += len;
    }

  if (pos)
    putchar('\n');
}

/*
 * NAME:	showfiles()
 * DESCRIPTION:	display a set of files
 */
static
int showfiles(darray *files, int flags, int options, int width)
{
  dlist list;
  int i, sz, result = 0;
  queueent *ents;
  dstring str;
  char **strs;
  void (*show)(int, queueent *, char **, int, int, int);

  if (dl_init(&list) == -1)
    {
      fprintf(stderr, "%s: not enough memory\n", argv0);
      return -1;
    }

  sz   = darr_size(files);
  ents = darr_array(files);

  dstr_init(&str);

  for (i = 0; i < sz; ++i)
    {
      if (outpath(&str, &ents[i], flags) == -1 ||
	  dl_append(&list, dstr_string(&str)) == -1)
	{
	  result = -1;
	  break;
	}
    }

  dstr_free(&str);

  strs = dl_array(&list);

  switch (options & F_MASK)
    {
    case F_LONG:
      show = show_long;
      break;

    case F_ONE:
      show = show_one;
      break;

    case F_MANY:
      show = show_many;
      break;

    case F_HORIZ:
      show = show_horiz;
      break;

    case F_COMMAS:
      show = show_commas;
      break;

    default:
      abort();
    }

  show(sz, ents, strs, flags, options, width);

  dl_free(&list);

  return result;
}

/*
 * NAME:	process()
 * DESCRIPTION:	sort and display results
 */
static
int process(hfsvol *vol, darray *dirs, darray *files,
	    int flags, int options, int width)
{
  int i, dsz, fsz;
  queueent *ents;
  int result = 0;

  dsz = darr_size(dirs);
  fsz = darr_size(files);

  if (fsz)
    {
      sortfiles(files, flags, options);
      if (showfiles(files, flags, options, width) == -1)
	result = -1;

      flags |= HLS_NAME | HLS_SPACE;
    }
  else if (dsz > 1)
    flags |= HLS_NAME;

  ents = darr_array(dirs);

  for (i = 0; i < dsz; ++i)
    {
      const char *path;
      hfsdir *dir;
      queueent ent;

      darr_shrink(files, 0);

      path = PATH(ents[i]);
      dir  = hfs_opendir(vol, path);
      if (dir == 0)
	{
	  hfsutil_perrorp(path);
	  result = -1;
	  continue;
	}

      while (hfs_readdir(dir, &ent.dirent) != -1)
	{
	  if ((ent.dirent.fdflags & HFS_FNDR_ISINVISIBLE) &&
	      ! (flags & HLS_ALL_FILES))
	    continue;

	  ent.path = 0;
	  ent.free = 0;

	  if (darr_append(files, &ent) == 0)
	    {
	      fprintf(stderr, "%s: not enough memory\n", argv0);
	      result = -1;
	      break;
	    }

	  if ((ent.dirent.flags & HFS_ISDIR) && (flags & HLS_RECURSIVE))
	    {
	      dstring str;

	      dstr_init(&str);

	      if (strchr(path, ':') == 0 &&
		  dstr_append(&str, ":", 1) == -1)
		result = -1;

	      if (dstr_append(&str, path, -1) == -1)
		result = -1;

	      if (path[strlen(path) - 1] != ':' &&
		  dstr_append(&str, ":", 1) == -1)
		result = -1;

	      if (dstr_append(&str, ent.dirent.name, -1) == -1)
		result = -1;

	      ent.path = strdup(dstr_string(&str));
	      if (ent.path)
		ent.free = dpfree;
	      else
		result = -1;

	      dstr_free(&str);

	      if (darr_append(dirs, &ent) == 0)
		{
		  result = -1;
		  if (ent.path)
		    free(ent.path);
		}

	      if (result)
		{
		  fprintf(stderr, "%s: not enough memory\n", argv0);
		  break;
		}

	      dsz  = darr_size(dirs);
	      ents = darr_array(dirs);
	    }
	}

      hfs_closedir(dir);

      if (result)
	break;

      if (flags & HLS_SPACE)
	printf("\n");
      if (flags & HLS_NAME)
	printf("%s%s", path,
	       path[strlen(path) - 1] == ':' ? "\n" : ":\n");

      sortfiles(files, flags, options);
      if (showfiles(files, flags, options, width) == -1)
	result = -1;

      flags |= HLS_NAME | HLS_SPACE;
    }

  return result;
}

/*
 * NAME:	queuepath()
 * DESCRIPTION:	append a file or directory to the list to process
 */
static
int queuepath(hfsvol *vol, char *path, darray *dirs, darray *files, int flags)
{
  queueent ent;
  darray *array;

  if (hfs_stat(vol, path, &ent.dirent) == -1)
    {
      hfsutil_perrorp(path);
      return (errno == ENOENT) ? 0 : -1;
    }

  ent.path = path;
  ent.free = 0;

  array = ((ent.dirent.flags & HFS_ISDIR) &&
	   ! (flags & HLS_IMMEDIATE_DIRS)) ? dirs : files;

  if (darr_append(array, &ent) == 0)
    {
      fprintf(stderr, "%s: not enough memory\n", argv0);
      return -1;
    }

  return 0;
}

/*
 * NAME:	hls->main()
 * DESCRIPTION:	implement hls command
 */
int hls_main(int argc, char *argv[])
{
  hfsvol *vol;
  int fargc, i;
  char **fargv = 0;
  int result = 0;
  int flags, options, width;
  char *ptr;
  darray *dirs, *files;

  options = T_MOD | S_NAME;

  if (isatty(STDOUT_FILENO))
    {
      options |= F_MANY;
      flags    = HLS_QMARK_CTRL;
    }
  else
    {
      options |= F_ONE;
      flags    = 0;
    }

  if (strcmp(bargv0, "hdir") == 0)
    options = (options & ~F_MASK) | F_LONG;

  ptr   = getenv("COLUMNS");
  width = ptr ? atoi(ptr) : 80;

# ifdef TIOCGWINSZ
  {
    struct winsize ws;

    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) != -1 &&
	ws.ws_col != 0)
      width = ws.ws_col;
  }
# endif

  while (1)
    {
      int opt;

      opt = getopt(argc, argv, "1abcdfilmqrstxw:CFNQRSU");
      if (opt == EOF)
	break;

      switch (opt)
	{
	case '?':
	  return usage();

	case '1':
	  options = (options & ~F_MASK) | F_ONE;
	  break;

	case 'a':
	  flags |= HLS_ALL_FILES;
	  break;

	case 'b':
	  flags |= HLS_ESCAPE;
	  flags &= ~HLS_QMARK_CTRL;
	  break;

	case 'c':
	  options = (options & ~(T_MASK | S_MASK)) | T_CREATE | S_TIME;
	  break;

	case 'd':
	  flags |= HLS_IMMEDIATE_DIRS;
	  break;

	case 'f':
	  flags |= HLS_ALL_FILES;
	  flags &= ~HLS_SIZE;
	  options &= ~S_MASK;
	  if ((options & F_MASK) == F_LONG)
	    options = (options & ~F_MASK) |
	      (isatty(STDOUT_FILENO) ? F_MANY : F_ONE);
	  break;

	case 'i':
	  flags |= HLS_CATIDS;
	  break;

	case 'l':
	  options = (options & ~F_MASK) | F_LONG;
	  break;

	case 'm':
	  options = (options & ~F_MASK) | F_COMMAS;
	  break;

	case 'q':
	  flags |= HLS_QMARK_CTRL;
	  flags &= ~HLS_ESCAPE;
	  break;

	case 'r':
	  flags |= HLS_REVERSE;
	  break;

	case 's':
	  flags |= HLS_SIZE;
	  break;

	case 't':
	  options = (options & ~S_MASK) | S_TIME;
	  break;

	case 'x':
	  options = (options & ~F_MASK) | F_HORIZ;
	  break;

	case 'w':
	  width = atoi(optarg);
	  break;

	case 'C':
	  options = (options & ~F_MASK) | F_MANY;
	  break;

	case 'F':
	  flags |= HLS_INDICATOR;
	  break;

	case 'N':
	  flags &= ~(HLS_ESCAPE | HLS_QMARK_CTRL);
	  break;

	case 'Q':
	  flags |= HLS_QUOTE | HLS_ESCAPE;
	  flags &= ~HLS_QMARK_CTRL;
	  break;

	case 'R':
	  flags |= HLS_RECURSIVE;
	  break;

	case 'S':
	  options = (options & ~S_MASK) | S_SIZE;
	  break;

	case 'U':
	  options &= ~S_MASK;
	  break;
	}
    }

  vol = hfsutil_remount(hcwd_getvol(-1), HFS_MODE_RDONLY);
  if (vol == 0)
    return 1;

  fargv = hfsutil_glob(vol, argc - optind, &argv[optind], &fargc, &result);

  dirs  = qnew();
  files = qnew();
  if (result == 0 && (dirs == 0 || files == 0))
    {
      fprintf(stderr, "%s: not enough memory\n", argv0);
      result = 1;
    }

  if (result == 0)
    {
      if (fargc == 0)
	{
	  if (queuepath(vol, ":", dirs, files, flags) == -1)
	    result = 1;
	}
      else
	{
	  for (i = 0; i < fargc; ++i)
	    {
	      if (queuepath(vol, fargv[i], dirs, files, flags) == -1)
		{
		  result = 1;
		  break;
		}
	    }
	}
    }

  if (result == 0 && process(vol, dirs, files, flags, options, width) == -1)
    result = 1;

  if (files)
    qfree(files);
  if (dirs)
    qfree(dirs);

  hfsutil_unmount(vol, &result);

  if (fargv)
    free(fargv);

  return result;
}
