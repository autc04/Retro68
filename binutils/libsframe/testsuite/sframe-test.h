/* sframe-test.h -- Common libsframe testsuite header.

   Copyright (C) 2022-2026 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#ifndef _SFRAME_TEST_H
#define _SFRAME_TEST_H

#include "config.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#include "sframe-api.h"

/* DejaGnu should not use gnulib's vsnprintf replacement here.  */
#undef vsnprintf

/* PR 33168: Solaris <sys/wait.h> with __EXTENSIONS__ defined gets a
   declaration of wait().  This conflicts with <dejagnu.h>'s wait
   definition that is only removed after DejaGnu 1.6.3.  */

#define wait dg_wait
/* Add prototype to avoid warning.  */
void wait (void);
#include <dejagnu.h>
#undef wait

#define TEST(cond, ...)							\
  do									\
    {									\
      if (cond)								\
	pass (__VA_ARGS__);						\
      else								\
	fail (__VA_ARGS__);						\
    }									\
    while (0)

#endif /* _SFRAME_TEST_H */
