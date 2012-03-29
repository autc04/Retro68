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
 * $Id: ck_btree.c,v 1.7 1998/04/11 08:27:07 rob Exp $
 */

# include <stdio.h>

# include "hfsck.h"
# include "util.h"

# include "ck_btree.h"

/*
 * NAME:	ck->btree()
 * DESCRIPTION:	verify/repair a b*-tree
 */
int ck_btree(btree *bt)
{
  printf("*** Checking %s B*-tree\n", bt->f.name);

  if (bt_readhdr(bt) == -1)
    return -1;

  if (VERBOSE)
    {
      printf("  bthDepth    = %u\n",  bt->hdr.bthDepth);
      printf("  bthRoot     = %lu\n", bt->hdr.bthRoot);
      printf("  bthNRecs    = %lu\n", bt->hdr.bthNRecs);
      printf("  bthFNode    = %lu\n", bt->hdr.bthFNode);
      printf("  bthLNode    = %lu\n", bt->hdr.bthLNode);
      printf("  bthNodeSize = %u\n",  bt->hdr.bthNodeSize);
      printf("  bthKeyLen   = %u\n",  bt->hdr.bthKeyLen);
      printf("  bthNNodes   = %lu\n", bt->hdr.bthNNodes);
      printf("  bthFree     = %lu\n", bt->hdr.bthFree);
    }

# if 0
  if (VERBOSE)
    {
      node n;
      int i;

      n.bt   = bt;
      n.nnum = bt->hdr.bthFNode;

      while (n.nnum)
	{
	  if (bt_getnode(&n) == -1)
	    return -1;

	  if (n.nnum == bt->hdr.bthFNode)
	    printf("  { ");
	  else
	    printf("} { ");

	  for (i = 0; i < n.nd.ndNRecs; ++i)
	    {
	      byte *ptr;

	      ptr = HFS_NODEREC(n, i);

	      outhex(ptr, 1 + HFS_RECKEYLEN(ptr));
	      printf(": ");
	      outhex(HFS_RECDATA(ptr),
		     HFS_NODEREC(n, i + 1) - HFS_RECDATA(ptr));
	      printf("\n");

	      if (i < n.nd.ndNRecs - 1)
		printf("    ");
	    }

	  n.nnum = n.nd.ndFLink;
	}

      printf("}\n");
    }
# endif

  return 0;
}
