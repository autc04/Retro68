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
 * $Id: module.c,v 1.3 1998/04/11 08:27:22 rob Exp $
 */

# include <linux/fs.h>
# include <linux/locks.h>
# include <linux/module.h>

# include "libhfs.h"

/* Superblock Operations =================================================== */

static
struct super_operations hfs_super_operations = {
  0,			/* read_inode */
  0,			/* notify_change */
  0,			/* write_inode */
  0,			/* put_inode */
  0,			/* put_super */
  0,			/* write_super */
  0,			/* statfs */
  0,			/* remount_fs */
};

static
struct super_block *hfs_read_super(struct super_block *sb,
				   void *data, int silent)
{
  char *opts = data;

  MOD_INC_USE_COUNT;

  lock_super(sb);

  set_blocksize(sb->s_dev, HFS_BLOCKSZ);

  sb->s_blocksize      = HFS_BLOCKSZ;
  sb->s_blocksize_bits = HFS_BLOCKSZ_BITS;
  sb->s_op             = &hfs_super_operations;
  sb->s_magic          = HFS_SIGWORD;
  sb->s_mounted        = 0;

  unlock_super(sb);

  return sb;
}

static
void hfs_put_super(struct super_block *sb)
{
  lock_super(sb);

  set_blocksize(sb->s_dev, BLOCK_SIZE);

  sb->s_dev = 0;

  unlock_super(sb);

  MOD_DEC_USE_COUNT;
}

/* Module Functions ======================================================== */

static
struct file_system_type hfs_fs = { hfs_read_super, "hfs", 1, 0 };

int init_module(void)
{
  int err;

  if ((err = register_filesystem(&hfs_fs)) < 0)
    return err;

  return 0;
}

void cleanup_module(void)
{
  int err;

  if ((err = unregister_filesystem(&hfs_fs)) < 0)
    printk("HFS: error %d during unregister_filesystem()\n", err);
}
