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
 * $Id: medium.c,v 1.4 1998/11/02 22:09:04 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>
# include <errno.h>

# include "libhfs.h"
# include "block.h"
# include "low.h"
# include "medium.h"

/* Driver Descriptor Record Routines ======================================= */

/*
 * NAME:	medium->zeroddr()
 * DESCRIPTION:	write a new/empty driver descriptor record
 */
int m_zeroddr(hfsvol *vol)
{
  Block0 ddr;
  int i;

  ASSERT(vol->pnum == 0 && vol->vlen != 0);

  ddr.sbSig       = HFS_DDR_SIGWORD;
  ddr.sbBlkSize   = HFS_BLOCKSZ;
  ddr.sbBlkCount  = vol->vlen;

  ddr.sbDevType   = 0;
  ddr.sbDevId     = 0;
  ddr.sbData      = 0;

  ddr.sbDrvrCount = 0;

  ddr.ddBlock     = 0;
  ddr.ddSize      = 0;
  ddr.ddType      = 0;

  for (i = 0; i < 243; ++i)
    ddr.ddPad[i] = 0;

  return l_putddr(vol, &ddr);
}

/* Partition Map Routines ================================================== */

/*
 * NAME:	medium->zeropm()
 * DESCRIPTION:	write new/empty partition map
 */
int m_zeropm(hfsvol *vol, unsigned int maxparts)
{
  Partition map;
  unsigned int i;

  ASSERT(vol->pnum == 0 && vol->vlen != 0);

  if (maxparts < 2)
    ERROR(EINVAL, "must allow at least 2 partitions");

  /* first entry: partition map itself */

  map.pmSig         = HFS_PM_SIGWORD;
  map.pmSigPad      = 0;
  map.pmMapBlkCnt   = 2;

  map.pmPyPartStart = 1;
  map.pmPartBlkCnt  = maxparts;

  strcpy((char *) map.pmPartName, "Apple");
  strcpy((char *) map.pmParType,  "Apple_partition_map");

  map.pmLgDataStart = 0;
  map.pmDataCnt     = map.pmPartBlkCnt;

  map.pmPartStatus  = 0;

  map.pmLgBootStart = 0;
  map.pmBootSize    = 0;
  map.pmBootAddr    = 0;
  map.pmBootAddr2   = 0;
  map.pmBootEntry   = 0;
  map.pmBootEntry2  = 0;
  map.pmBootCksum   = 0;

  strcpy((char *) map.pmProcessor, "");

  for (i = 0; i < 188; ++i)
    map.pmPad[i] = 0;

  if (l_putpmentry(vol, &map, 1) == -1)
    goto fail;

  /* second entry: rest of medium */

  map.pmPyPartStart = 1 + maxparts;
  map.pmPartBlkCnt  = vol->vlen - 1 - maxparts;

  strcpy((char *) map.pmPartName, "Extra");
  strcpy((char *) map.pmParType,  "Apple_Free");

  map.pmDataCnt = map.pmPartBlkCnt;

  if (l_putpmentry(vol, &map, 2) == -1)
    goto fail;

  /* zero rest of partition map's partition */

  if (maxparts > 2)
    {
      block b;

      memset(&b, 0, sizeof(b));

      for (i = 3; i <= maxparts; ++i)
	{
	  if (b_writepb(vol, i, &b, 1) == -1)
	    goto fail;
	}
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	medium->findpmentry()
 * DESCRIPTION:	locate a partition map entry
 */
int m_findpmentry(hfsvol *vol, const char *type,
		  Partition *map, unsigned long *start)
{
  unsigned long bnum;
  int found = 0;

  if (start && *start > 0)
    {
      bnum = *start;

      if (bnum++ >= (unsigned long) map->pmMapBlkCnt)
	ERROR(EINVAL, "partition not found");
    }
  else
    bnum = 1;

  while (1)
    {
      if (l_getpmentry(vol, map, bnum) == -1)
	{
	  found = -1;
	  goto fail;
	}

      if (map->pmSig != HFS_PM_SIGWORD)
	{
	  found = -1;

	  if (map->pmSig == HFS_PM_SIGWORD_OLD)
	    ERROR(EINVAL, "old partition map format not supported");
	  else
	    ERROR(EINVAL, "invalid partition map");
	}

      if (strcmp((char *) map->pmParType, type) == 0)
	{
	  found = 1;
	  goto done;
	}

      if (bnum++ >= (unsigned long) map->pmMapBlkCnt)
	ERROR(EINVAL, "partition not found");
    }

done:
  if (start)
    *start = bnum;

fail:
  return found;
}

/*
 * NAME:	medium->mkpart()
 * DESCRIPTION:	create a new partition from available free space
 */
int m_mkpart(hfsvol *vol,
	     const char *name, const char *type, unsigned long len)
{
  Partition map;
  unsigned int nparts, maxparts;
  unsigned long bnum, start, remain;
  int found;

  if (strlen(name) > 32 ||
      strlen(type) > 32)
    ERROR(EINVAL, "partition name/type can each be at most 32 chars");

  if (len == 0)
    ERROR(EINVAL, "partition length must be > 0");

  found = m_findpmentry(vol, "Apple_partition_map", &map, 0);
  if (found == -1)
    goto fail;

  if (! found)
    ERROR(EIO, "cannot find partition map's partition");

  nparts   = map.pmMapBlkCnt;
  maxparts = map.pmPartBlkCnt;

  bnum = 0;
  do
    {
      found = m_findpmentry(vol, "Apple_Free", &map, &bnum);
      if (found == -1)
	goto fail;

      if (! found)
	ERROR(ENOSPC, "no available partitions");
    }
  while (len > (unsigned long) map.pmPartBlkCnt);

  start  = (unsigned long) map.pmPyPartStart + len;
  remain = (unsigned long) map.pmPartBlkCnt  - len;

  if (remain && nparts >= maxparts)
    ERROR(EINVAL, "must allocate all blocks in free space");

  map.pmPartBlkCnt = len;

  strcpy((char *) map.pmPartName, name);
  strcpy((char *) map.pmParType,  type);

  map.pmLgDataStart = 0;
  map.pmDataCnt     = len;

  map.pmPartStatus  = 0;

  if (l_putpmentry(vol, &map, bnum) == -1)
    goto fail;

  if (remain)
    {
      map.pmPyPartStart = start;
      map.pmPartBlkCnt  = remain;

      strcpy((char *) map.pmPartName, "Extra");
      strcpy((char *) map.pmParType,  "Apple_Free");

      map.pmDataCnt = remain;

      if (l_putpmentry(vol, &map, ++nparts) == -1)
	goto fail;

      for (bnum = 1; bnum <= nparts; ++bnum)
	{
	  if (l_getpmentry(vol, &map, bnum) == -1)
	    goto fail;

	  map.pmMapBlkCnt = nparts;

	  if (l_putpmentry(vol, &map, bnum) == -1)
	    goto fail;
	}
    }

  return 0;

fail:
  return -1;
}

/* Boot Blocks Routines ==================================================== */

/*
 * NAME:	medium->zerobb()
 * DESCRIPTION:	write new/empty volume boot blocks
 */
int m_zerobb(hfsvol *vol)
{
  block b;

  memset(&b, 0, sizeof(b));

  if (b_writelb(vol, 0, &b) == -1 ||
      b_writelb(vol, 1, &b) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}
