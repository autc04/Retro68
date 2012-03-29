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
 * $Id: hdump.c,v 1.4 1998/11/02 22:09:18 rob Exp $
 */

# include <stdio.h>

# include "libhfs.h"
# include "volume.h"
# include "low.h"
# include "data.h"

int main(int argc, char *argv[])
{
  hfsvol vol;
  Block0 ddr;
  Partition map;
  unsigned long bnum;
  int i;

  v_init(&vol, HFS_OPT_NOCACHE);

  if (argc != 2)
    {
      fprintf(stderr, "Usage: %s <device>\n", argv[0]);
      goto fail;
    }

  if (v_open(&vol, argv[1], HFS_MODE_RDONLY) == -1)
    {
      fprintf(stderr, "v_open: %s\n", hfs_error);
      goto fail;
    }

  if (l_getddr(&vol, &ddr) == -1)
    {
      fprintf(stderr, "l_getddr: %s\n", hfs_error);
      goto fail;
    }

  if (ddr.sbSig != HFS_DDR_SIGWORD)
    fprintf(stderr, "block 0: not a valid driver descriptor record\n");
  else
    {
      printf("Driver Descriptor Record\n");
      printf("  sbSig      \t= 0x%04x\n",  ddr.sbSig);
      printf("  sbBlkSize  \t= %d\n",  ddr.sbBlkSize);
      printf("  sbBlkCount \t= %ld\n", ddr.sbBlkCount);
      printf("  sbDevType  \t= %d\n",  ddr.sbDevType);
      printf("  sbDevId    \t= %d\n",  ddr.sbDevId);
      printf("  sbData     \t= %ld\n", ddr.sbData);
      printf("  sbDrvrCount\t= %d\n",  ddr.sbDrvrCount);

      printf("  ddBlock[0] \t= %ld\n", ddr.ddBlock);
      printf("  ddSize[0]  \t= %d\n",  ddr.ddSize);
      printf("  ddType[0]  \t= %d\n",  ddr.ddType);

      for (i = 0; i < 243; i += 4)
	{
	  ddr.ddBlock = d_getsl((unsigned char *) &ddr.ddPad[i]);
	  ddr.ddSize  = d_getsw((unsigned char *) &ddr.ddPad[i + 2]);
	  ddr.ddType  = d_getsw((unsigned char *) &ddr.ddPad[i + 3]);

	  if (ddr.ddBlock != 0 ||
	      ddr.ddSize  != 0 ||
	      ddr.ddType  != 0)
	    {
	      printf("  ddBlock[%d] \t= %ld\n", i >> 2, ddr.ddBlock);
	      printf("  ddSize[%d]  \t= %d\n",  i >> 2, ddr.ddSize);
	      printf("  ddType[%d]  \t= %d\n",  i >> 2, ddr.ddType);
	    }
	}
    }

  bnum = 1;
  while (1)
    {
      if (l_getpmentry(&vol, &map, bnum) == -1)
	{
	  fprintf(stderr, "l_getpmentry: %s\n", hfs_error);
	  goto fail;
	}

      if (map.pmSig != HFS_PM_SIGWORD)
	{
	  fprintf(stderr, "block %lu: not a valid partition entry\n", bnum);
	  goto fail;
	}

      printf("Partition Entry %lu\n", bnum);
      printf("  pmSig        \t= 0x%04x\n", map.pmSig);
      printf("  pmSigPad     \t= %d\n",     map.pmSigPad);
      printf("  pmMapBlkCnt  \t= %ld\n",    map.pmMapBlkCnt);
      printf("  pmPyPartStart\t= %ld\n",    map.pmPyPartStart);
      printf("  pmPartBlkCnt \t= %ld\n",    map.pmPartBlkCnt);
      printf("  pmPartName   \t= \"%s\"\n", map.pmPartName);
      printf("  pmParType    \t= \"%s\"\n", map.pmParType);
      printf("  pmLgDataStart\t= %ld\n",    map.pmLgDataStart);
      printf("  pmDataCnt    \t= %ld\n",    map.pmDataCnt);
      printf("  pmPartStatus \t= %ld\n",    map.pmPartStatus);
      printf("  pmLgBootStart\t= %ld\n",    map.pmLgBootStart);
      printf("  pmBootSize   \t= %ld\n",    map.pmBootSize);
      printf("  pmBootAddr   \t= %ld\n",    map.pmBootAddr);
      printf("  pmBootAddr2  \t= %ld\n",    map.pmBootAddr2);
      printf("  pmBootEntry  \t= %ld\n",    map.pmBootEntry);
      printf("  pmBootEntry2 \t= %ld\n",    map.pmBootEntry2);
      printf("  pmBootCksum  \t= %ld\n",    map.pmBootCksum);
      printf("  pmProcessor  \t= \"%s\"\n", map.pmProcessor);

      for (i = 0; i < 188; ++i)
	{
	  if (map.pmPad[i] != 0)
	    printf("  pmPad[%d]\t= %d\n", i, map.pmPad[i]);
	}

      if (bnum++ >= map.pmMapBlkCnt)
	break;
    }

  if (v_close(&vol) == -1)
    {
      fprintf(stderr, "v_close: %s\n", hfs_error);
      goto fail;
    }

  return 0;

fail:
  v_close(&vol);
  return 1;
}
