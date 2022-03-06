/* Definitions of target machine for GNU compiler,
   for IBM RS/6000 POWER running AIX.
   Copyright (C) 2000-2015 Free Software Foundation, Inc.

   This file is part of GCC.

   GCC is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published
   by the Free Software Foundation; either version 3, or (at your
   option) any later version.

   GCC is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License
   along with GCC; see the file COPYING3.  If not see
   <http://www.gnu.org/licenses/>.  */


#undef TARGET_OS_CPP_BUILTINS
/* __POWERPC__ must be defined for some header files */
#define TARGET_OS_CPP_BUILTINS()          \
  do                                      \
    {                                     \
      builtin_define ("__ppc__");               \
      builtin_define ("__PPC__");               \
      builtin_define ("__POWERPC__");           \
      builtin_define ("__NATURAL_ALIGNMENT__"); \
      builtin_assert ("system=macos");     \
      builtin_assert ("cpu=powerpc");     \
      builtin_assert ("machine=powerpc"); \
      builtin_define("pascal=__attribute__((__pascal__))");	\
      builtin_define("__IEEE_BIG_ENDIAN"); \
    }                                     \
  while (0)

/* --no-check-sections  :   sections overlap on purpose!
*/

#define LINK_SPEC "%{!r:-btextro} -bhalt:4 -bnodelcsect \
--no-check-sections \
%{shared:-bM:SRE}"

/* TODO: add libroot to some of these, maybe replace -lc */
#define LIB_SPEC "-lc"
#define LIBGCC_SPEC "-lgcc"
#define LINK_GCC_C_SEQUENCE_SPEC "--start-group -lgcc -lc --end-group"

/* TODO: we'll need a startfile... */
#undef STARTFILE_SPEC
#define STARTFILE_SPEC ""
