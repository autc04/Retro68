dnl -*- shell-script -*-
dnl
dnl libhfs - library for reading and writing Macintosh HFS volumes
dnl Copyright (C) 1996-1998 Robert Leslie
dnl
dnl This program is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2 of the License, or
dnl (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program; if not, write to the Free Software
dnl Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
dnl
dnl $Id: configure.in,v 1.5 1998/04/11 08:27:12 rob Exp $
dnl

AC_INIT(libhfs.h)
AC_CONFIG_HEADER(config.h)

AC_ARG_ENABLE(debug,
    [  --enable-debug          enable diagnostic debugging support])

if test "x$enable_debug" = xyes
then
    AC_DEFINE(DEBUG)
fi

dnl Checks for programs.

AC_PROG_MAKE_SET
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_RANLIB
AC_PROG_LN_S

AC_PROG_GCC_TRADITIONAL

dnl Checks for header files.

AC_HEADER_STDC
AC_CHECK_HEADERS(unistd.h fcntl.h)

dnl Checks for typedefs, structures, and compiler characteristics.

AC_TYPE_SIZE_T
AC_STRUCT_TM

AC_C_CONST

dnl Checks for library functions.

AC_FUNC_MEMCMP
AC_CHECK_FUNCS(mktime)

dnl Create output files.

AC_OUTPUT(Makefile)
