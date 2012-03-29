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
 * $Id: btree.c,v 1.10 1998/11/02 22:08:54 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>
# include <errno.h>

# include "libhfs.h"
# include "btree.h"
# include "data.h"
# include "file.h"
# include "block.h"
# include "node.h"

/*
 * NAME:	btree->getnode()
 * DESCRIPTION:	retrieve a numbered node from a B*-tree file
 */
int bt_getnode(node *np, btree *bt, unsigned long nnum)
{
  block *bp = &np->data;
  const byte *ptr;
  int i;

  np->bt   = bt;
  np->nnum = nnum;

# if 0
  fprintf(stderr, "BTREE: GET vol \"%s\" btree \"%s\" node %lu\n",
	  bt->f.vol->mdb.drVN, bt->f.name, np->nnum);
# endif

  /* verify the node exists and is marked as in-use */

  if (nnum > 0 && nnum >= bt->hdr.bthNNodes)
    ERROR(EIO, "read nonexistent b*-tree node");
  else if (bt->map && ! BMTST(bt->map, nnum))
    ERROR(EIO, "read unallocated b*-tree node");

  if (f_getblock(&bt->f, nnum, bp) == -1)
    goto fail;

  ptr = *bp;

  d_fetchul(&ptr, &np->nd.ndFLink);
  d_fetchul(&ptr, &np->nd.ndBLink);
  d_fetchsb(&ptr, &np->nd.ndType);
  d_fetchsb(&ptr, &np->nd.ndNHeight);
  d_fetchuw(&ptr, &np->nd.ndNRecs);
  d_fetchsw(&ptr, &np->nd.ndResv2);

  if (np->nd.ndNRecs > HFS_MAX_NRECS)
    ERROR(EIO, "too many b*-tree node records");

  i = np->nd.ndNRecs + 1;

  ptr = *bp + HFS_BLOCKSZ - (2 * i);

  while (i--)
    d_fetchuw(&ptr, &np->roff[i]);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	btree->putnode()
 * DESCRIPTION:	store a numbered node into a B*-tree file
 */
int bt_putnode(node *np)
{
  btree *bt = np->bt;
  block *bp = &np->data;
  byte *ptr;
  int i;

# if 0
  fprintf(stderr, "BTREE: PUT vol \"%s\" btree \"%s\" node %lu\n",
	  bt->f.vol->mdb.drVN, bt->f.name, np->nnum);
# endif

  /* verify the node exists and is marked as in-use */

  if (np->nnum > 0 && np->nnum >= bt->hdr.bthNNodes)
    ERROR(EIO, "write nonexistent b*-tree node");
  else if (bt->map && ! BMTST(bt->map, np->nnum))
    ERROR(EIO, "write unallocated b*-tree node");

  ptr = *bp;

  d_storeul(&ptr, np->nd.ndFLink);
  d_storeul(&ptr, np->nd.ndBLink);
  d_storesb(&ptr, np->nd.ndType);
  d_storesb(&ptr, np->nd.ndNHeight);
  d_storeuw(&ptr, np->nd.ndNRecs);
  d_storesw(&ptr, np->nd.ndResv2);

  if (np->nd.ndNRecs > HFS_MAX_NRECS)
    ERROR(EIO, "too many b*-tree node records");

  i = np->nd.ndNRecs + 1;

  ptr = *bp + HFS_BLOCKSZ - (2 * i);

  while (i--)
    d_storeuw(&ptr, np->roff[i]);

  return f_putblock(&bt->f, np->nnum, bp);

fail:
  return -1;
}

/*
 * NAME:	btree->readhdr()
 * DESCRIPTION:	read the header node of a B*-tree
 */
int bt_readhdr(btree *bt)
{
  const byte *ptr;
  byte *map = 0;
  int i;
  unsigned long nnum;

  if (bt_getnode(&bt->hdrnd, bt, 0) == -1)
    goto fail;

  if (bt->hdrnd.nd.ndType != ndHdrNode ||
      bt->hdrnd.nd.ndNRecs != 3 ||
      bt->hdrnd.roff[0] != 0x00e ||
      bt->hdrnd.roff[1] != 0x078 ||
      bt->hdrnd.roff[2] != 0x0f8 ||
      bt->hdrnd.roff[3] != 0x1f8)
    ERROR(EIO, "malformed b*-tree header node");

  /* read header record */

  ptr = HFS_NODEREC(bt->hdrnd, 0);

  d_fetchuw(&ptr, &bt->hdr.bthDepth);
  d_fetchul(&ptr, &bt->hdr.bthRoot);
  d_fetchul(&ptr, &bt->hdr.bthNRecs);
  d_fetchul(&ptr, &bt->hdr.bthFNode);
  d_fetchul(&ptr, &bt->hdr.bthLNode);
  d_fetchuw(&ptr, &bt->hdr.bthNodeSize);
  d_fetchuw(&ptr, &bt->hdr.bthKeyLen);
  d_fetchul(&ptr, &bt->hdr.bthNNodes);
  d_fetchul(&ptr, &bt->hdr.bthFree);

  for (i = 0; i < 76; ++i)
    d_fetchsb(&ptr, &bt->hdr.bthResv[i]);

  if (bt->hdr.bthNodeSize != HFS_BLOCKSZ)
    ERROR(EINVAL, "unsupported b*-tree node size");

  /* read map record; construct btree bitmap */
  /* don't set bt->map until we're done, since getnode() checks it */

  map = ALLOC(byte, HFS_MAP1SZ);
  if (map == 0)
    ERROR(ENOMEM, 0);

  memcpy(map, HFS_NODEREC(bt->hdrnd, 2), HFS_MAP1SZ);
  bt->mapsz = HFS_MAP1SZ;

  /* read continuation map records, if any */

  nnum = bt->hdrnd.nd.ndFLink;

  while (nnum)
    {
      node n;
      byte *newmap;

      if (bt_getnode(&n, bt, nnum) == -1)
	goto fail;

      if (n.nd.ndType != ndMapNode ||
	  n.nd.ndNRecs != 1 ||
	  n.roff[0] != 0x00e ||
	  n.roff[1] != 0x1fa)
	ERROR(EIO, "malformed b*-tree map node");

      newmap = REALLOC(map, byte, bt->mapsz + HFS_MAPXSZ);
      if (newmap == 0)
	ERROR(ENOMEM, 0);

      map = newmap;

      memcpy(map + bt->mapsz, HFS_NODEREC(n, 0), HFS_MAPXSZ);
      bt->mapsz += HFS_MAPXSZ;

      nnum = n.nd.ndFLink;
    }

  bt->map = map;

  return 0;

fail:
  FREE(map);
  return -1;
}

/*
 * NAME:	btree->writehdr()
 * DESCRIPTION:	write the header node of a B*-tree
 */
int bt_writehdr(btree *bt)
{
  byte *ptr, *map;
  unsigned long mapsz, nnum;
  int i;

  ASSERT(bt->hdrnd.bt == bt &&
	 bt->hdrnd.nnum == 0 &&
	 bt->hdrnd.nd.ndType == ndHdrNode &&
	 bt->hdrnd.nd.ndNRecs == 3);

  ptr = HFS_NODEREC(bt->hdrnd, 0);

  d_storeuw(&ptr, bt->hdr.bthDepth);
  d_storeul(&ptr, bt->hdr.bthRoot);
  d_storeul(&ptr, bt->hdr.bthNRecs);
  d_storeul(&ptr, bt->hdr.bthFNode);
  d_storeul(&ptr, bt->hdr.bthLNode);
  d_storeuw(&ptr, bt->hdr.bthNodeSize);
  d_storeuw(&ptr, bt->hdr.bthKeyLen);
  d_storeul(&ptr, bt->hdr.bthNNodes);
  d_storeul(&ptr, bt->hdr.bthFree);

  for (i = 0; i < 76; ++i)
    d_storesb(&ptr, bt->hdr.bthResv[i]);

  memcpy(HFS_NODEREC(bt->hdrnd, 2), bt->map, HFS_MAP1SZ);

  if (bt_putnode(&bt->hdrnd) == -1)
    goto fail;

  map   = bt->map   + HFS_MAP1SZ;
  mapsz = bt->mapsz - HFS_MAP1SZ;

  nnum  = bt->hdrnd.nd.ndFLink;

  while (mapsz)
    {
      node n;

      if (nnum == 0)
	ERROR(EIO, "truncated b*-tree map");

      if (bt_getnode(&n, bt, nnum) == -1)
	goto fail;

      if (n.nd.ndType != ndMapNode ||
	  n.nd.ndNRecs != 1 ||
	  n.roff[0] != 0x00e ||
	  n.roff[1] != 0x1fa)
	ERROR(EIO, "malformed b*-tree map node");

      memcpy(HFS_NODEREC(n, 0), map, HFS_MAPXSZ);

      if (bt_putnode(&n) == -1)
	goto fail;

      map   += HFS_MAPXSZ;
      mapsz -= HFS_MAPXSZ;

      nnum = n.nd.ndFLink;
    }

  bt->flags &= ~HFS_BT_UPDATE_HDR;

  return 0;

fail:
  return -1;
}

/* High-Level B*-Tree Routines ============================================= */

/*
 * NAME:	btree->space()
 * DESCRIPTION:	assert space for new records, or extend the file
 */
int bt_space(btree *bt, unsigned int nrecs)
{
  unsigned int nnodes;
  long space;

  nnodes = nrecs * (bt->hdr.bthDepth + 1);

  if (nnodes <= bt->hdr.bthFree)
    goto done;

  /* make sure the extents tree has room too */

  if (bt != &bt->f.vol->ext)
    {
      if (bt_space(&bt->f.vol->ext, 1) == -1)
	goto fail;
    }

  space = f_alloc(&bt->f);
  if (space == -1)
    goto fail;

  nnodes = space * (bt->f.vol->mdb.drAlBlkSiz / bt->hdr.bthNodeSize);

  bt->hdr.bthNNodes += nnodes;
  bt->hdr.bthFree   += nnodes;

  bt->flags |= HFS_BT_UPDATE_HDR;

  bt->f.vol->flags |= HFS_VOL_UPDATE_ALTMDB;

  while (bt->hdr.bthNNodes > bt->mapsz * 8)
    {
      byte *newmap;
      node mapnd;

      /* extend tree map */

      newmap = REALLOC(bt->map, byte, bt->mapsz + HFS_MAPXSZ);
      if (newmap == 0)
	ERROR(ENOMEM, 0);

      memset(newmap + bt->mapsz, 0, HFS_MAPXSZ);

      bt->map    = newmap;
      bt->mapsz += HFS_MAPXSZ;

      n_init(&mapnd, bt, ndMapNode, 0);
      if (n_new(&mapnd) == -1)
	goto fail;

      mapnd.nd.ndNRecs = 1;
      mapnd.roff[1]    = 0x1fa;

      /* link the new map node */

      if (bt->hdrnd.nd.ndFLink == 0)
	{
	  bt->hdrnd.nd.ndFLink = mapnd.nnum;
	  mapnd.nd.ndBLink     = 0;
	}
      else
	{
	  node n;
	  unsigned long nnum;

	  nnum = bt->hdrnd.nd.ndFLink;

	  while (1)
	    {
	      if (bt_getnode(&n, bt, nnum) == -1)
		goto fail;

	      if (n.nd.ndFLink == 0)
		break;

	      nnum = n.nd.ndFLink;
	    }

	  n.nd.ndFLink     = mapnd.nnum;
	  mapnd.nd.ndBLink = n.nnum;

	  if (bt_putnode(&n) == -1)
	    goto fail;
	}

      if (bt_putnode(&mapnd) == -1)
	goto fail;
    }

done:
  return 0;

fail:
  return -1;
}

/*
 * NAME:	insertx()
 * DESCRIPTION:	recursively locate a node and insert a record
 */
static
int insertx(node *np, byte *record, int *reclen)
{
  node child;
  byte *rec;
  int result = 0;

  if (n_search(np, record))
    ERROR(EIO, "b*-tree record already exists");

  switch (np->nd.ndType)
    {
    case ndIndxNode:
      if (np->rnum == -1)
	rec = HFS_NODEREC(*np, 0);
      else
	rec = HFS_NODEREC(*np, np->rnum);

      if (bt_getnode(&child, np->bt, d_getul(HFS_RECDATA(rec))) == -1 ||
	  insertx(&child, record, reclen) == -1)
	goto fail;

      if (np->rnum == -1)
	{
	  n_index(&child, rec, 0);
	  if (*reclen == 0)
	    {
	      result = bt_putnode(np);
	      goto done;
	    }
	}

      if (*reclen)
	result = n_insert(np, record, reclen);

      break;

    case ndLeafNode:
      result = n_insert(np, record, reclen);
      break;

    default:
      ERROR(EIO, "unexpected b*-tree node");
    }

done:
  return result;

fail:
  return -1;
}

/*
 * NAME:	btree->insert()
 * DESCRIPTION:	insert a new node record into a tree
 */
int bt_insert(btree *bt, const byte *record, unsigned int reclen)
{
  node root;
  byte newrec[HFS_MAX_RECLEN];

  if (bt->hdr.bthRoot == 0)
    {
      /* create root node */

      n_init(&root, bt, ndLeafNode, 1);
      if (n_new(&root) == -1 ||
	  bt_putnode(&root) == -1)
	goto fail;

      bt->hdr.bthDepth = 1;
      bt->hdr.bthRoot  = root.nnum;
      bt->hdr.bthFNode = root.nnum;
      bt->hdr.bthLNode = root.nnum;

      bt->flags |= HFS_BT_UPDATE_HDR;
    }
  else if (bt_getnode(&root, bt, bt->hdr.bthRoot) == -1)
    goto fail;

  memcpy(newrec, record, reclen);

  if (insertx(&root, newrec, &reclen) == -1)
    goto fail;

  if (reclen)
    {
      byte oroot[HFS_MAX_RECLEN];
      unsigned int orootlen;

      /* root node was split; create a new root */

      n_index(&root, oroot, &orootlen);

      n_init(&root, bt, ndIndxNode, root.nd.ndNHeight + 1);
      if (n_new(&root) == -1)
	goto fail;

      ++bt->hdr.bthDepth;
      bt->hdr.bthRoot = root.nnum;

      bt->flags |= HFS_BT_UPDATE_HDR;

      /* insert index records for new root */

      n_search(&root, oroot);
      n_insertx(&root, oroot, orootlen);

      n_search(&root, newrec);
      n_insertx(&root, newrec, reclen);

      if (bt_putnode(&root) == -1)
	goto fail;
    }

  ++bt->hdr.bthNRecs;
  bt->flags |= HFS_BT_UPDATE_HDR;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	deletex()
 * DESCRIPTION:	recursively locate a node and delete a record
 */
static
int deletex(node *np, const byte *key, byte *record, int *flag)
{
  node child;
  byte *rec;
  int found, result = 0;

  found = n_search(np, key);

  switch (np->nd.ndType)
    {
    case ndIndxNode:
      if (np->rnum == -1)
	ERROR(EIO, "b*-tree record not found");

      rec = HFS_NODEREC(*np, np->rnum);

      if (bt_getnode(&child, np->bt, d_getul(HFS_RECDATA(rec))) == -1 ||
	  deletex(&child, key, rec, flag) == -1)
	goto fail;

      if (*flag)
	{
	  *flag = 0;

	  if (HFS_RECKEYLEN(rec) == 0)
	    {
	      result = n_delete(np, record, flag);
	      break;
	    }

	  if (np->rnum == 0)
	    {
	      /* propagate index record change into parent */

	      n_index(np, record, 0);
	      *flag = 1;
	    }

	  result = bt_putnode(np);
	}

      break;

    case ndLeafNode:
      if (found == 0)
	ERROR(EIO, "b*-tree record not found");

      result = n_delete(np, record, flag);
      break;

    default:
      ERROR(EIO, "unexpected b*-tree node");
    }

  return result;

fail:
  return -1;
}

/*
 * NAME:	btree->delete()
 * DESCRIPTION:	remove a node record from a tree
 */
int bt_delete(btree *bt, const byte *key)
{
  node root;
  byte record[HFS_MAX_RECLEN];
  int flag = 0;

  if (bt->hdr.bthRoot == 0)
    ERROR(EIO, "empty b*-tree");

  if (bt_getnode(&root, bt, bt->hdr.bthRoot) == -1 ||
      deletex(&root, key, record, &flag) == -1)
    goto fail;

  if (bt->hdr.bthDepth > 1 && root.nd.ndNRecs == 1)
    {
      const byte *rec;

      /* root only has one record; eliminate it and decrease the tree depth */

      rec = HFS_NODEREC(root, 0);

      --bt->hdr.bthDepth;
      bt->hdr.bthRoot = d_getul(HFS_RECDATA(rec));

      if (n_free(&root) == -1)
	goto fail;
    }
  else if (bt->hdr.bthDepth == 1 && root.nd.ndNRecs == 0)
    {
      /* root node was deleted */

      bt->hdr.bthDepth = 0;
      bt->hdr.bthRoot  = 0;
    }

  --bt->hdr.bthNRecs;
  bt->flags |= HFS_BT_UPDATE_HDR;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	btree->search()
 * DESCRIPTION:	locate a data record given a search key
 */
int bt_search(btree *bt, const byte *key, node *np)
{
  int found = 0;
  unsigned long nnum;

  nnum = bt->hdr.bthRoot;

  if (nnum == 0)
    ERROR(ENOENT, 0);

  while (1)
    {
      const byte *rec;

      if (bt_getnode(np, bt, nnum) == -1)
	{
	  found = -1;
	  goto fail;
	}

      found = n_search(np, key);

      switch (np->nd.ndType)
	{
	case ndIndxNode:
	  if (np->rnum == -1)
	    ERROR(ENOENT, 0);

	  rec  = HFS_NODEREC(*np, np->rnum);
	  nnum = d_getul(HFS_RECDATA(rec));

	  break;

	case ndLeafNode:
	  if (! found)
	    ERROR(ENOENT, 0);

	  goto done;

	default:
	  found = -1;
	  ERROR(EIO, "unexpected b*-tree node");
	}
    }

done:
fail:
  return found;
}
