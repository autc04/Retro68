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
 * $Id: low.c,v 1.8 1998/11/02 22:09:03 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>
# include <errno.h>

# include "libhfs.h"
# include "low.h"
# include "data.h"
# include "block.h"
# include "file.h"

/*
 * NAME:	low->getddr()
 * DESCRIPTION:	read a driver descriptor record
 */
int l_getddr(hfsvol *vol, Block0 *ddr)
{
  block b;
  const byte *ptr = b;
  int i;

  if (b_readpb(vol, 0, &b, 1) == -1)
    goto fail;

  d_fetchsw(&ptr, &ddr->sbSig);
  d_fetchsw(&ptr, &ddr->sbBlkSize);
  d_fetchsl(&ptr, &ddr->sbBlkCount);
  d_fetchsw(&ptr, &ddr->sbDevType);
  d_fetchsw(&ptr, &ddr->sbDevId);
  d_fetchsl(&ptr, &ddr->sbData);
  d_fetchsw(&ptr, &ddr->sbDrvrCount);
  d_fetchsl(&ptr, &ddr->ddBlock);
  d_fetchsw(&ptr, &ddr->ddSize);
  d_fetchsw(&ptr, &ddr->ddType);

  for (i = 0; i < 243; ++i)
    d_fetchsw(&ptr, &ddr->ddPad[i]);

  ASSERT(ptr - b == HFS_BLOCKSZ);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->putddr()
 * DESCRIPTION:	write a driver descriptor record
 */
int l_putddr(hfsvol *vol, const Block0 *ddr)
{
  block b;
  byte *ptr = b;
  int i;

  d_storesw(&ptr, ddr->sbSig);
  d_storesw(&ptr, ddr->sbBlkSize);
  d_storesl(&ptr, ddr->sbBlkCount);
  d_storesw(&ptr, ddr->sbDevType);
  d_storesw(&ptr, ddr->sbDevId);
  d_storesl(&ptr, ddr->sbData);
  d_storesw(&ptr, ddr->sbDrvrCount);
  d_storesl(&ptr, ddr->ddBlock);
  d_storesw(&ptr, ddr->ddSize);
  d_storesw(&ptr, ddr->ddType);

  for (i = 0; i < 243; ++i)
    d_storesw(&ptr, ddr->ddPad[i]);

  ASSERT(ptr - b == HFS_BLOCKSZ);

  if (b_writepb(vol, 0, &b, 1) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->getpmentry()
 * DESCRIPTION:	read a partition map entry
 */
int l_getpmentry(hfsvol *vol, Partition *map, unsigned long bnum)
{
  block b;
  const byte *ptr = b;
  int i;

  if (b_readpb(vol, bnum, &b, 1) == -1)
    goto fail;

  d_fetchsw(&ptr, &map->pmSig);
  d_fetchsw(&ptr, &map->pmSigPad);
  d_fetchsl(&ptr, &map->pmMapBlkCnt);
  d_fetchsl(&ptr, &map->pmPyPartStart);
  d_fetchsl(&ptr, &map->pmPartBlkCnt);

  strncpy((char *) map->pmPartName, (const char *) ptr, 32);
  map->pmPartName[32] = 0;
  ptr += 32;

  strncpy((char *) map->pmParType, (const char *) ptr, 32);
  map->pmParType[32] = 0;
  ptr += 32;

  d_fetchsl(&ptr, &map->pmLgDataStart);
  d_fetchsl(&ptr, &map->pmDataCnt);
  d_fetchsl(&ptr, &map->pmPartStatus);
  d_fetchsl(&ptr, &map->pmLgBootStart);
  d_fetchsl(&ptr, &map->pmBootSize);
  d_fetchsl(&ptr, &map->pmBootAddr);
  d_fetchsl(&ptr, &map->pmBootAddr2);
  d_fetchsl(&ptr, &map->pmBootEntry);
  d_fetchsl(&ptr, &map->pmBootEntry2);
  d_fetchsl(&ptr, &map->pmBootCksum);

  strncpy((char *) map->pmProcessor, (const char *) ptr, 16);
  map->pmProcessor[16] = 0;
  ptr += 16;

  for (i = 0; i < 188; ++i)
    d_fetchsw(&ptr, &map->pmPad[i]);

  ASSERT(ptr - b == HFS_BLOCKSZ);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->putpmentry()
 * DESCRIPTION:	write a partition map entry
 */
int l_putpmentry(hfsvol *vol, const Partition *map, unsigned long bnum)
{
  block b;
  byte *ptr = b;
  int i;

  d_storesw(&ptr, map->pmSig);
  d_storesw(&ptr, map->pmSigPad);
  d_storesl(&ptr, map->pmMapBlkCnt);
  d_storesl(&ptr, map->pmPyPartStart);
  d_storesl(&ptr, map->pmPartBlkCnt);

  memset(ptr, 0, 32);
  strncpy((char *) ptr, (const char *) map->pmPartName, 32);
  ptr += 32;

  memset(ptr, 0, 32);
  strncpy((char *) ptr, (const char *) map->pmParType, 32);
  ptr += 32;

  d_storesl(&ptr, map->pmLgDataStart);
  d_storesl(&ptr, map->pmDataCnt);
  d_storesl(&ptr, map->pmPartStatus);
  d_storesl(&ptr, map->pmLgBootStart);
  d_storesl(&ptr, map->pmBootSize);
  d_storesl(&ptr, map->pmBootAddr);
  d_storesl(&ptr, map->pmBootAddr2);
  d_storesl(&ptr, map->pmBootEntry);
  d_storesl(&ptr, map->pmBootEntry2);
  d_storesl(&ptr, map->pmBootCksum);

  memset(ptr, 0, 16);
  strncpy((char *) ptr, (const char *) map->pmProcessor, 16);
  ptr += 16;

  for (i = 0; i < 188; ++i)
    d_storesw(&ptr, map->pmPad[i]);

  ASSERT(ptr - b == HFS_BLOCKSZ);

  if (b_writepb(vol, bnum, &b, 1) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->getbb()
 * DESCRIPTION:	read a volume's boot blocks
 */
int l_getbb(hfsvol *vol, BootBlkHdr *bb, byte *bootcode)
{
  block b;
  const byte *ptr = b;

  if (b_readlb(vol, 0, &b) == -1)
    goto fail;

  d_fetchsw(&ptr, &bb->bbID);
  d_fetchsl(&ptr, &bb->bbEntry);
  d_fetchsw(&ptr, &bb->bbVersion);
  d_fetchsw(&ptr, &bb->bbPageFlags);

  d_fetchstr(&ptr, bb->bbSysName,    sizeof(bb->bbSysName));
  d_fetchstr(&ptr, bb->bbShellName,  sizeof(bb->bbShellName));
  d_fetchstr(&ptr, bb->bbDbg1Name,   sizeof(bb->bbDbg1Name));
  d_fetchstr(&ptr, bb->bbDbg2Name,   sizeof(bb->bbDbg2Name));
  d_fetchstr(&ptr, bb->bbScreenName, sizeof(bb->bbScreenName));
  d_fetchstr(&ptr, bb->bbHelloName,  sizeof(bb->bbHelloName));
  d_fetchstr(&ptr, bb->bbScrapName,  sizeof(bb->bbScrapName));

  d_fetchsw(&ptr, &bb->bbCntFCBs);
  d_fetchsw(&ptr, &bb->bbCntEvts);
  d_fetchsl(&ptr, &bb->bb128KSHeap);
  d_fetchsl(&ptr, &bb->bb256KSHeap);
  d_fetchsl(&ptr, &bb->bbSysHeapSize);
  d_fetchsw(&ptr, &bb->filler);
  d_fetchsl(&ptr, &bb->bbSysHeapExtra);
  d_fetchsl(&ptr, &bb->bbSysHeapFract);

  ASSERT(ptr - b == 148);

  if (bootcode)
    {
      memcpy(bootcode, ptr, HFS_BOOTCODE1LEN);

      if (b_readlb(vol, 1, &b) == -1)
	goto fail;

      memcpy(bootcode + HFS_BOOTCODE1LEN, b, HFS_BOOTCODE2LEN);
    }

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->putbb()
 * DESCRIPTION:	write a volume's boot blocks
 */
int l_putbb(hfsvol *vol, const BootBlkHdr *bb, const byte *bootcode)
{
  block b;
  byte *ptr = b;

  d_storesw(&ptr, bb->bbID);
  d_storesl(&ptr, bb->bbEntry);
  d_storesw(&ptr, bb->bbVersion);
  d_storesw(&ptr, bb->bbPageFlags);

  d_storestr(&ptr, bb->bbSysName,    sizeof(bb->bbSysName));
  d_storestr(&ptr, bb->bbShellName,  sizeof(bb->bbShellName));
  d_storestr(&ptr, bb->bbDbg1Name,   sizeof(bb->bbDbg1Name));
  d_storestr(&ptr, bb->bbDbg2Name,   sizeof(bb->bbDbg2Name));
  d_storestr(&ptr, bb->bbScreenName, sizeof(bb->bbScreenName));
  d_storestr(&ptr, bb->bbHelloName,  sizeof(bb->bbHelloName));
  d_storestr(&ptr, bb->bbScrapName,  sizeof(bb->bbScrapName));

  d_storesw(&ptr, bb->bbCntFCBs);
  d_storesw(&ptr, bb->bbCntEvts);
  d_storesl(&ptr, bb->bb128KSHeap);
  d_storesl(&ptr, bb->bb256KSHeap);
  d_storesl(&ptr, bb->bbSysHeapSize);
  d_storesw(&ptr, bb->filler);
  d_storesl(&ptr, bb->bbSysHeapExtra);
  d_storesl(&ptr, bb->bbSysHeapFract);

  ASSERT(ptr - b == 148);

  if (bootcode)
    memcpy(ptr, bootcode, HFS_BOOTCODE1LEN);
  else
    memset(ptr, 0, HFS_BOOTCODE1LEN);

  if (b_writelb(vol, 0, &b) == -1)
    goto fail;

  if (bootcode)
    memcpy(&b, bootcode + HFS_BOOTCODE1LEN, HFS_BOOTCODE2LEN);
  else
    memset(&b, 0, HFS_BOOTCODE2LEN);

  if (b_writelb(vol, 1, &b) == -1)
    goto fail;

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->getmdb()
 * DESCRIPTION:	read a master directory block
 */
int l_getmdb(hfsvol *vol, MDB *mdb, int backup)
{
  block b;
  const byte *ptr = b;
  int i;

  if (b_readlb(vol, backup ? vol->vlen - 2 : 2, &b) == -1)
    goto fail;

  d_fetchsw(&ptr, &mdb->drSigWord);
  d_fetchsl(&ptr, &mdb->drCrDate);
  d_fetchsl(&ptr, &mdb->drLsMod);
  d_fetchsw(&ptr, &mdb->drAtrb);
  d_fetchuw(&ptr, &mdb->drNmFls);
  d_fetchuw(&ptr, &mdb->drVBMSt);
  d_fetchuw(&ptr, &mdb->drAllocPtr);
  d_fetchuw(&ptr, &mdb->drNmAlBlks);
  d_fetchul(&ptr, &mdb->drAlBlkSiz);
  d_fetchul(&ptr, &mdb->drClpSiz);
  d_fetchuw(&ptr, &mdb->drAlBlSt);
  d_fetchsl(&ptr, &mdb->drNxtCNID);
  d_fetchuw(&ptr, &mdb->drFreeBks);

  d_fetchstr(&ptr, mdb->drVN, sizeof(mdb->drVN));

  ASSERT(ptr - b == 64);

  d_fetchsl(&ptr, &mdb->drVolBkUp);
  d_fetchsw(&ptr, &mdb->drVSeqNum);
  d_fetchul(&ptr, &mdb->drWrCnt);
  d_fetchul(&ptr, &mdb->drXTClpSiz);
  d_fetchul(&ptr, &mdb->drCTClpSiz);
  d_fetchuw(&ptr, &mdb->drNmRtDirs);
  d_fetchul(&ptr, &mdb->drFilCnt);
  d_fetchul(&ptr, &mdb->drDirCnt);

  for (i = 0; i < 8; ++i)
    d_fetchsl(&ptr, &mdb->drFndrInfo[i]);

  ASSERT(ptr - b == 124);

  d_fetchuw(&ptr, &mdb->drEmbedSigWord);
  d_fetchuw(&ptr, &mdb->drEmbedExtent.xdrStABN);
  d_fetchuw(&ptr, &mdb->drEmbedExtent.xdrNumABlks);

  d_fetchul(&ptr, &mdb->drXTFlSize);

  for (i = 0; i < 3; ++i)
    {
      d_fetchuw(&ptr, &mdb->drXTExtRec[i].xdrStABN);
      d_fetchuw(&ptr, &mdb->drXTExtRec[i].xdrNumABlks);
    }

  ASSERT(ptr - b == 146);

  d_fetchul(&ptr, &mdb->drCTFlSize);

  for (i = 0; i < 3; ++i)
    {
      d_fetchuw(&ptr, &mdb->drCTExtRec[i].xdrStABN);
      d_fetchuw(&ptr, &mdb->drCTExtRec[i].xdrNumABlks);
    }

  ASSERT(ptr - b == 162);

  return 0;

fail:
  return -1;
}

/*
 * NAME:	low->putmdb()
 * DESCRIPTION:	write master directory block(s)
 */
int l_putmdb(hfsvol *vol, const MDB *mdb, int backup)
{
  block b;
  byte *ptr = b;
  int i;

  d_storesw(&ptr, mdb->drSigWord);
  d_storesl(&ptr, mdb->drCrDate);
  d_storesl(&ptr, mdb->drLsMod);
  d_storesw(&ptr, mdb->drAtrb);
  d_storeuw(&ptr, mdb->drNmFls);
  d_storeuw(&ptr, mdb->drVBMSt);
  d_storeuw(&ptr, mdb->drAllocPtr);
  d_storeuw(&ptr, mdb->drNmAlBlks);
  d_storeul(&ptr, mdb->drAlBlkSiz);
  d_storeul(&ptr, mdb->drClpSiz);
  d_storeuw(&ptr, mdb->drAlBlSt);
  d_storesl(&ptr, mdb->drNxtCNID);
  d_storeuw(&ptr, mdb->drFreeBks);

  d_storestr(&ptr, mdb->drVN, sizeof(mdb->drVN));

  ASSERT(ptr - b == 64);

  d_storesl(&ptr, mdb->drVolBkUp);
  d_storesw(&ptr, mdb->drVSeqNum);
  d_storeul(&ptr, mdb->drWrCnt);
  d_storeul(&ptr, mdb->drXTClpSiz);
  d_storeul(&ptr, mdb->drCTClpSiz);
  d_storeuw(&ptr, mdb->drNmRtDirs);
  d_storeul(&ptr, mdb->drFilCnt);
  d_storeul(&ptr, mdb->drDirCnt);

  for (i = 0; i < 8; ++i)
    d_storesl(&ptr, mdb->drFndrInfo[i]);

  ASSERT(ptr - b == 124);

  d_storeuw(&ptr, mdb->drEmbedSigWord);
  d_storeuw(&ptr, mdb->drEmbedExtent.xdrStABN);
  d_storeuw(&ptr, mdb->drEmbedExtent.xdrNumABlks);

  d_storeul(&ptr, mdb->drXTFlSize);

  for (i = 0; i < 3; ++i)
    {
      d_storeuw(&ptr, mdb->drXTExtRec[i].xdrStABN);
      d_storeuw(&ptr, mdb->drXTExtRec[i].xdrNumABlks);
    }

  ASSERT(ptr - b == 146);

  d_storeul(&ptr, mdb->drCTFlSize);

  for (i = 0; i < 3; ++i)
    {
      d_storeuw(&ptr, mdb->drCTExtRec[i].xdrStABN);
      d_storeuw(&ptr, mdb->drCTExtRec[i].xdrNumABlks);
    }

  ASSERT(ptr - b == 162);

  memset(ptr, 0, HFS_BLOCKSZ - (ptr - b));

  if (b_writelb(vol, 2, &b) == -1 ||
      (backup && b_writelb(vol, vol->vlen - 2, &b) == -1))
    goto fail;

  return 0;

fail:
  return -1;
}
