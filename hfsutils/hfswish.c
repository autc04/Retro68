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
 * $Id: hfswish.c,v 1.9 1998/04/11 08:26:57 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdio.h>
# include <stdlib.h>

# include <tk.h>

# include "tclhfs.h"
# include "xhfs.h"
# include "suid.h"
# include "images.h"

static
char *argv0;

# define DEFBITMAP(interp, name)  \
         Tk_DefineBitmap(interp, Tk_GetUid(#name),  \
			 (char *) name##_bits, name##_width, name##_height)

/*
 * NAME:	Tcl->AppInit()
 * DESCRIPTION:	initialize interpreter and execute main script
 */
int Tcl_AppInit(Tcl_Interp *interp)
{
  if (Tcl_Init(interp) == TCL_ERROR ||
      Tk_Init(interp)  == TCL_ERROR ||
      Hfs_Init(interp) == TCL_ERROR)
    return TCL_ERROR;

  /* initialize bitmaps */

  if (DEFBITMAP(interp, macdaemon)        == TCL_ERROR ||
      DEFBITMAP(interp, macdaemon_mask)   == TCL_ERROR ||

      DEFBITMAP(interp, stop)             == TCL_ERROR ||
      DEFBITMAP(interp, caution)          == TCL_ERROR ||
      DEFBITMAP(interp, note)             == TCL_ERROR ||

      DEFBITMAP(interp, floppy)           == TCL_ERROR ||
      DEFBITMAP(interp, harddisk)         == TCL_ERROR ||
      DEFBITMAP(interp, cdrom)            == TCL_ERROR ||

      DEFBITMAP(interp, floppy_mask)      == TCL_ERROR ||
      DEFBITMAP(interp, harddisk_mask)    == TCL_ERROR ||
      DEFBITMAP(interp, cdrom_mask)       == TCL_ERROR ||

      DEFBITMAP(interp, sm_floppy)        == TCL_ERROR ||
      DEFBITMAP(interp, sm_harddisk)      == TCL_ERROR ||
      DEFBITMAP(interp, sm_cdrom)         == TCL_ERROR ||

      DEFBITMAP(interp, folder)           == TCL_ERROR ||
      DEFBITMAP(interp, document)         == TCL_ERROR ||
      DEFBITMAP(interp, application)      == TCL_ERROR ||

      DEFBITMAP(interp, folder_mask)      == TCL_ERROR ||
      DEFBITMAP(interp, document_mask)    == TCL_ERROR ||
      DEFBITMAP(interp, application_mask) == TCL_ERROR ||

      DEFBITMAP(interp, sm_folder)        == TCL_ERROR ||
      DEFBITMAP(interp, sm_document)      == TCL_ERROR ||
      DEFBITMAP(interp, sm_application)   == TCL_ERROR ||

      DEFBITMAP(interp, help)             == TCL_ERROR ||
      DEFBITMAP(interp, padlock)          == TCL_ERROR)
    return TCL_ERROR;

  /* execute main script */

  Tcl_SetVar(interp, "argv0", argv0, TCL_GLOBAL_ONLY);

  if (Tcl_Eval(interp, xhfs) == TCL_ERROR)
    {
      fprintf(stderr, "Error: %s\n", interp->result);
      exit(1);
    }

  return TCL_OK;
}

/*
 * NAME:	main()
 * DESCRIPTION:	program entry
 */
int main(int argc, char *argv[])
{
  int nargc;
  char **nargv;
  int i;

  suid_init();

  argv0 = argv[0];

  nargc = argc + 2;
  nargv = malloc(sizeof(*nargv) * nargc);
  if (nargv == 0)
    {
      perror(argv[0]);
      return 1;
    }

  nargv[0] = argv0;
  nargv[1] = "/dev/null";
  nargv[2] = "--";

  for (i = 3; i < nargc; ++i)
    nargv[i] = argv[i - 2];

  Tk_Main(nargc, nargv, Tcl_AppInit);

  return 0;  /* not reached */
}
