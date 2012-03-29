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
 * $Id: glob.c,v 1.6 1998/04/11 08:26:55 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>

# include "dlist.h"
# include "dstring.h"
# include "hfs.h"
# include "glob.h"

/*
 * NAME:	strmatch()
 * DESCRIPTION:	return 1 iff a string matches a given (glob) pattern
 */
static
int strmatch(const char *str, const char *pat)
{
  while (1)
    {
      if (*str == 0 && *pat != 0 && *pat != '*')
	return 0;

      switch (*pat)
	{
	case 0:
	  return (*str == 0);

	case '*':
	  if (*++pat == 0)
	    return 1;

	  while (1)
	    {
	      if (strmatch(str, pat))
		return 1;

	      if (*str++ == 0)
		return 0;
	    }

	case '?':
	  break;

	case '[':
	  {
	    ++pat;

	    while (1)
	      {
		unsigned char p0, p1, s;

		p0 = *pat;

		if (p0 == ']' || p0 == 0)
		  return 0;

		s = *str;

		if (hfs_charorder[p0] == hfs_charorder[s])
		  break;

		if (pat[1] == '-')
		  {
		    p1 = pat[2];

		    if (p1 == 0)
		      return 0;

		    if ((hfs_charorder[p0] <= hfs_charorder[s] &&
			 hfs_charorder[p1] >= hfs_charorder[s]) ||
			(hfs_charorder[p0] >= hfs_charorder[s] &&
			 hfs_charorder[p1] <= hfs_charorder[s]))
		      break;

		    pat += 2;
		  }

		++pat;
	      }

	    while (*pat != ']')
	      {
		if (*pat == 0)
		  {
		    --pat;
		    break;
		  }

		++pat;
	      }
	  }
	  break;

	case '\\':
	  if (*++pat == 0)
	    return 0;

	  /* fall through */

	default:
	  if (hfs_charorder[(unsigned char) *pat] !=
	      hfs_charorder[(unsigned char) *str])
	    return 0;
	}

      ++pat, ++str;
    }
}

/*
 * NAME:	doglob()
 * DESCRIPTION:	perform recursive depth-first traversal of path to be globbed
 */
static
int doglob(hfsvol *vol, dlist *list, const char *dir, const char *rem)
{
  dstring new;
  int special, len, result = 0;
  const char *obrace, *cbrace, *ptr;

  dstr_init(&new);

  special = 0;
  obrace = cbrace = 0;

  for (ptr = rem; *ptr && (obrace || *ptr != ':'); ++ptr)
    {
      switch (*ptr)
	{
	case '{':
	  if (obrace == 0)
	    obrace = ptr;
	  break;

	case '}':
	  if (obrace && cbrace == 0)
	    cbrace = ptr;
	  break;

	case '\\':
	  if (*++ptr == 0)
	    --ptr;

	case '*':
	case '[':
	case '?':
	  special = 1;
	  break;
	}
    }

  if (obrace)
    {
      const char *elt;

      if (cbrace == 0 ||
	  dstr_append(&new, rem, obrace - rem) == -1)
	{
	  dstr_free(&new);
	  return -1;
	}
      len = dstr_length(&new);

      for (ptr = obrace; *ptr != '}'; )
	{
	  elt = ptr + 1;

	  ptr = elt;
	  while (*ptr != '}' && *ptr != ',')
	    ++ptr;

	  if (dstr_append(&new, elt, ptr - elt) == -1 ||
	      dstr_append(&new, cbrace + 1, -1) == -1 ||
	      doglob(vol, list, dir, dstr_string(&new)) == -1)
	    {
	      dstr_free(&new);
	      return -1;
	    }

	  dstr_shrink(&new, len);
	}

      dstr_free(&new);
      return 0;
    }

  if (dstr_append(&new, dir, -1) == -1)
    {
      dstr_free(&new);
      return -1;
    }
  len = dstr_length(&new);

  if (special)
    {
      hfsdirent ent;
      hfsdir *d;
      dstring pat;
      int found = 0;

      dstr_init(&pat);
      if (dstr_append(&pat, rem, ptr - rem) == -1)
	{
	  dstr_free(&pat);
	  dstr_free(&new);
	  return -1;
	}

      if (*dir == 0 && strchr(rem, ':') == 0)
	d = hfs_opendir(vol, ":");
      else
	d = hfs_opendir(vol, dir);

      if (d == 0)
	{
	  dstr_free(&pat);
	  dstr_free(&new);
	  return -1;
	}

      while (hfs_readdir(d, &ent) != -1)
	{
	  if (ent.fdflags & HFS_FNDR_ISINVISIBLE)
	    continue;

	  if (strmatch(ent.name, dstr_string(&pat)))
	    {
	      dstr_shrink(&new, len);
	      if (dstr_append(&new, ent.name, -1) == -1)
		{
		  result = -1;
		  break;
		}

	      if (*ptr == 0)
		{
		  found  = 1;
		  result = dl_append(list, dstr_string(&new));

		  if (result == -1)
		    break;
		}
	      else if (ent.flags & HFS_ISDIR)
		{
		  if (dstr_append(&new, ":", 1) == -1)
		    result = -1;
		  else
		    {
		      found  = 1;
		      result = doglob(vol, list, dstr_string(&new), ptr + 1);
		    }

		  if (result == -1)
		    break;
		}
	    }
	}

      hfs_closedir(d);

      if (result == 0 && ! found)
	{
	  dstr_shrink(&new, len);
	  if (dstr_append(&new, rem, -1) == -1)
	    result = -1;
	  else
	    {
	      char *ptr, *rem;

	      for (rem = dstr_string(&new) + len, ptr = rem; *rem;
		   ++rem, ++ptr)
		{
		  if (*rem == '\\')
		    ++rem;

		  *ptr = *rem;
		}
	      *ptr = 0;

	      result = dl_append(list, dstr_string(&new));
	    }
	}

      dstr_free(&pat);
      dstr_free(&new);

      return result;
    }

  if (dstr_append(&new, rem, ptr - rem) == -1)
    result = -1;
  else
    {
      if (*ptr)
	{
	  if (dstr_append(&new, ":", 1) == -1)
	    result = -1;
	  else
	    result = doglob(vol, list, dstr_string(&new), ptr + 1);

	  dstr_free(&new);
	  return result;
	}

      result = dl_append(list, dstr_string(&new));
    }

  dstr_free(&new);
  return result;
}

/*
 * NAME:	hfs->glob()
 * DESCRIPTION:	perform glob pattern matching
 */
char **hfs_glob(hfsvol *vol, int argc, char *argv[], int *nelts)
{
  dlist list;
  int i;

  if (dl_init(&list) == -1)
    return 0;

  for (i = 0; i < argc; ++i)
    {
      if (doglob(vol, &list, "", argv[i]) == -1)
	{
	  dl_free(&list);
	  return 0;
	}
    }

  *nelts = dl_size(&list);

  return dl_array(&list);
}
