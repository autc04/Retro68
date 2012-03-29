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
 * $Id: acconfig.h,v 1.5 1998/04/11 08:27:11 rob Exp $
 */

/*****************************************************************************
 * Definitions selected automatically by `configure'                         *
 *****************************************************************************/
@TOP@

/* Define if you want to enable diagnostic debugging support. */
#undef DEBUG

@BOTTOM@

/*****************************************************************************
 * End of automatically configured definitions                               *
 *****************************************************************************/

# ifdef DEBUG
#  include <stdio.h>
# endif
