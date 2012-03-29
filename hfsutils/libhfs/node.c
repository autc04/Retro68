/*
 * libhfs - library for reading and writing Macintosh HFS volumes
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
 * $Id: node.c,v 1.9 1998/11/02 22:09:05 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>
# include <errno.h>

# include "libhfs.h"
# include "node.h"
# include "data.h"
# include "btree.h"

/* total bytes used by records (NOT including record offsets) */

# define NODEUSED(n)	\
  ((size_t) ((n).roff[(n).nd.ndNRecs] - (n).roff[0]))

/* total bytes available for new records (INCLUDING record offsets) */

# define NODEFREE(n)	\
  ((size_t) (HFS_BLOCKSZ - (n).roff[(n).nd.ndNRecs] -  \
	     2 * ((n).nd.ndNRecs + 1)))

/*
 * NAME:	node->init()
 * DESCRIPTION:	construct an empty node
 */
void n_init(node *np, btree *bt, int type, int height)
{
  np->bt   = bt;
  np->nnum = (unsigned long) -1;

  np->nd.ndFLink   = 0;
  np->nd.ndBLink   = 0;
  np->nd.ndType    = type;
  np->nd.ndNHeight = height;
  np->nd.ndNRecs   = 0;
  np->nd.ndResv2   = 0;

  np->rnum    = -1;
  np->roff[0] = 0x00e;

  memset(&np->data, 0, sizeof(np->data));
}

/*
 * NAME:	node->new()
 * DESCRIPTION:	allocate a new b*-tree node
 */
int n_new(node *np)
{
  btree *bt = np->bt;
  unsigned long num;

  if (bt->hdr.bthFree == 0)
    ERROR(EIO, "b*-tree full");

  num = 0;
  while (num < bt->hdr.bthNNodes && BMTST(bt->map, num))
    ++num;

  if (num == bt->hdr.bthNNodes)
    ERROR(EIO, "free b*-tree node not found");

  np->nnum = num;

  BMSET(bt->map, num);
  --bt->hdr.bthFree;

  bt->flags |= HFS_BT_UPDATE_HDR;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	node->free()
 * DESCRIPTION:	deallocate and remove a b*-tree node
 */
int n_free(node *np)
{
  btree *bt = np->bt;
  node sib;

  if (bt->hdr.bthFNode == np->nnum)
    bt->hdr.bthFNode = np->nd.ndFLink;

  if (bt->hdr.bthLNode == np->nnum)
    bt->hdr.bthLNode = np->nd.ndBLink;

  if (np->nd.ndFLink > 0)
    {
      if (bt_getnode(&sib, bt, np->nd.ndFLink) == -1)
	goto fail;

      sib.nd.ndBLink = np->nd.ndBLink;

      if (bt_putnode(&sib) == -1)
	goto fail;
    }

  if (np->nd.ndBLink > 0)
    {
      if (bt_getnode(&sib, bt, np->nd.ndBLink) == -1)
	goto fail;

      sib.nd.ndFLink = np->nd.ndFLink;

      if (bt_putnode(&sib) == -1)
	goto fail;
    }

  BMCLR(bt->map, np->nnum);
  ++bt->hdr.bthFree;

  bt->flags |= HFS_BT_UPDATE_HDR;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	compact()
 * DESCRIPTION:	clean up a node, removing deleted records
 */
static
void compact(node *np)
{
  byte *ptr;
  int offset, nrecs, i;

  offset = 0x00e;
  ptr    = np->data + offset;
  nrecs  = 0;

  for (i = 0; i < np->nd.ndNRecs; ++i)
    {
      const byte *rec;
      int reclen;

      rec    = HFS_NODEREC(*np, i);
      reclen = HFS_RECLEN(*np, i);

      if (HFS_RECKEYLEN(rec) > 0)
	{
	  np->roff[nrecs++] = offset;
	  offset += reclen;

	  if (ptr == rec)
	    ptr += reclen;
	  else
	    {
	      while (reclen--)
		*ptr++ = *rec++;
	    }
	}
    }

  np->roff[nrecs] = offset;
  np->nd.ndNRecs  = nrecs;
}

/*
 * NAME:	node->search()
 * DESCRIPTION:	locate a record in a node, or the record it should follow
 */
int n_search(node *np, const byte *pkey)
{
  const btree *bt = np->bt;
  byte key1[HFS_MAX_KEYLEN], key2[HFS_MAX_KEYLEN];
  int i, comp = -1;

  bt->keyunpack(pkey, key2);

  for (i = np->nd.ndNRecs; i--; )
    {
      const byte *rec;

      rec = HFS_NODEREC(*np, i);

      if (HFS_RECKEYLEN(rec) == 0)
	continue;  /* deleted record */

      bt->keyunpack(rec, key1);
      comp = bt->keycompare(key1, key2);

      if (comp <= 0)
	break;
    }

  np->rnum = i;

  return comp == 0;
}

/*
 * NAME:	node->index()
 * DESCRIPTION:	create an index record from a key and node pointer
 */
void n_index(const node *np, byte *record, unsigned int *reclen)
{
  const byte *key = HFS_NODEREC(*np, 0);

  if (np->bt == &np->bt->f.vol->cat)
    {
      /* force the key length to be 0x25 */

      HFS_SETKEYLEN(record, 0x25);
      memset(record + 1, 0, 0x25);
      memcpy(record + 1, key + 1, HFS_RECKEYLEN(key));
    }
  else
    memcpy(record, key, HFS_RECKEYSKIP(key));

  d_putul(HFS_RECDATA(record), np->nnum);

  if (reclen)
    *reclen = HFS_RECKEYSKIP(record) + 4;
}

/*
 * NAME:	split()
 * DESCRIPTION:	divide a node into two and insert a record
 */
static
int split(node *left, byte *record, unsigned int *reclen)
{
  btree *bt = left->bt;
  node n, *right = &n, *side = 0;
  int mark, i;

  /* create a second node by cloning the first */

  *right = *left;

  if (n_new(right) == -1)
    goto fail;

  left->nd.ndFLink  = right->nnum;
  right->nd.ndBLink = left->nnum;

  /* divide all records evenly between the two nodes */

  mark = (NODEUSED(*left) + 2 * left->nd.ndNRecs + *reclen + 2) >> 1;

  if (left->rnum == -1)
    {
      side  = left;
      mark -= *reclen + 2;
    }

  for (i = 0; i < left->nd.ndNRecs; ++i)
    {
      node *np;
      byte *rec;

      np  = (mark > 0) ? right : left;
      rec = HFS_NODEREC(*np, i);

      mark -= HFS_RECLEN(*np, i) + 2;

      HFS_SETKEYLEN(rec, 0);

      if (left->rnum == i)
	{
	  side  = (mark > 0) ? left : right;
	  mark -= *reclen + 2;
	}
    }

  compact(left);
  compact(right);

  /* insert the new record and store the modified nodes */

  ASSERT(side);

  n_search(side, record);
  n_insertx(side, record, *reclen);

  if (bt_putnode(left) == -1 ||
      bt_putnode(right) == -1)
    goto fail;

  /* create an index record in the parent for the new node */

  n_index(right, record, reclen);

  /* update link pointers */

  if (bt->hdr.bthLNode == left->nnum)
    {
      bt->hdr.bthLNode = right->nnum;
      bt->flags |= HFS_BT_UPDATE_HDR;
    }

  if (right->nd.ndFLink > 0)
    {
      node sib;

      if (bt_getnode(&sib, right->bt, right->nd.ndFLink) == -1)
	goto fail;

      sib.nd.ndBLink = right->nnum;

      if (bt_putnode(&sib) == -1)
	goto fail;
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	node->insertx()
 * DESCRIPTION:	insert a record into a node (which must already have room)
 */
void n_insertx(node *np, const byte *record, unsigned int reclen)
{
  int rnum, i;
  byte *ptr;

  rnum = np->rnum + 1;

  /* push other records down to make room */

  for (ptr = HFS_NODEREC(*np, np->nd.ndNRecs) + reclen;
       ptr > HFS_NODEREC(*np, rnum) + reclen; --ptr)
    *(ptr - 1) = *(ptr - 1 - reclen);

  ++np->nd.ndNRecs;

  for (i = np->nd.ndNRecs; i > rnum; --i)
    np->roff[i] = np->roff[i - 1] + reclen;

  /* write the new record */

  memcpy(HFS_NODEREC(*np, rnum), record, reclen);
}

/*
 * NAME:	node->insert()
 * DESCRIPTION:	insert a new record into a node; return a record for parent
 */
int n_insert(node *np, byte *record, unsigned int *reclen)
{
  /* check for free space */

  if (np->nd.ndNRecs >= HFS_MAX_NRECS ||
      *reclen + 2 > NODEFREE(*np))
    return split(np, record, reclen);

  n_insertx(np, record, *reclen);
  *reclen = 0;

  return bt_putnode(np);
}

/*
 * NAME:	join()
 * DESCRIPTION:	combine two nodes into a single node
 */
static
int join(node *left, node *right, byte *record, int *flag)
{
  int i, offset;

  /* copy records and offsets */

  memcpy(HFS_NODEREC(*left, left->nd.ndNRecs),
	 HFS_NODEREC(*right, 0), NODEUSED(*right));

  offset = left->roff[left->nd.ndNRecs] - right->roff[0];

  for (i = 1; i <= right->nd.ndNRecs; ++i)
    left->roff[++left->nd.ndNRecs] = offset + right->roff[i];

  if (bt_putnode(left) == -1)
    goto fail;

  /* eliminate node and update link pointers */

  if (n_free(right) == -1)
    goto fail;

  HFS_SETKEYLEN(record, 0);
  *flag = 1;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	node->delete()
 * DESCRIPTION:	remove a record from a node
 */
int n_delete(node *np, byte *record, int *flag)
{
  byte *rec;

  rec = HFS_NODEREC(*np, np->rnum);

  HFS_SETKEYLEN(rec, 0);
  compact(np);

  if (np->nd.ndNRecs == 0)
    {
      if (n_free(np) == -1)
	goto fail;

      HFS_SETKEYLEN(record, 0);
      *flag = 1;

      return 0;
    }

  /* see if we can join with our left sibling */

  if (np->nd.ndBLink > 0)
    {
      node left;

      if (bt_getnode(&left, np->bt, np->nd.ndBLink) == -1)
	goto fail;

      if (np->nd.ndNRecs + left.nd.ndNRecs <= HFS_MAX_NRECS &&
	  NODEUSED(*np) + 2 * np->nd.ndNRecs <= NODEFREE(left))
	return join(&left, np, record, flag);
    }

  if (np->rnum == 0)
    {
      /* special case: first record changed; update parent record key */

      n_index(np, record, 0);
      *flag = 1;
    }

  return bt_putnode(np);

fail:
  return -1;
}
