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
 * $Id: hfssh.c,v 1.8 1998/04/11 08:26:57 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# ifdef HAVE_UNISTD_H
#  include <unistd.h>
# endif

# include <tcl.h>

# include "tclhfs.h"
# include "suid.h"

/*
 * NAME:	Tcl->AppInit()
 * DESCRIPTION:	initialize interpreter
 */
int Tcl_AppInit(Tcl_Interp *interp)
{
  Tcl_SetVar(interp, "hfs_interactive",
	     isatty(STDIN_FILENO) ? "1" : "0", TCL_GLOBAL_ONLY);

  if (Tcl_Init(interp) == TCL_ERROR)
    return TCL_ERROR;

  if (Hfs_Init(interp) == TCL_ERROR)
    return TCL_ERROR;

  return TCL_OK;
}

/*
 * NAME:	main()
 * DESCRIPTION:	program entry
 */
int main(int argc, char *argv[])
{
  suid_init();

  Tcl_Main(argc, argv, Tcl_AppInit);

  return 0;  /* not reached */
}
