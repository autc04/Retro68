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
 * $Id: hfsck.h,v 1.6 1998/04/11 08:27:08 rob Exp $
 */

# include "libhfs.h"
# include "data.h"
# include "block.h"
# include "low.h"
# include "file.h"
# include "btree.h"
# include "node.h"
# include "record.h"
# include "volume.h"

# define HFSCK_REPAIR	0x0001
# define HFSCK_VERBOSE	0x0100
# define HFSCK_YES	0x0200

# define REPAIR		(options & HFSCK_REPAIR)
# define VERBOSE	(options & HFSCK_VERBOSE)
# define YES		(options & HFSCK_YES)

extern int options;

int hfsck(hfsvol *);
