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
 * $Id: util.c,v 1.7 1998/04/11 08:27:08 rob Exp $
 */

# include <stdio.h>
# include <string.h>
# include <stdarg.h>

# include "hfsck.h"
# include "util.h"

/*
 * NAME:	mctime()
 * DESCRIPTION:	convert Macintosh time to an ASCII string
 */
char *mctime(unsigned long secs)
{
  time_t date;
  static char str[26];

  if (secs == 0)
    return "(Never)";

  date = d_ltime(secs);
  strcpy(str, ctime(&date));
  str[24] = 0;

  return str;
}

/*
 * NAME:	extstr()
 * DESCRIPTION:	convert an extent descriptor into a printable string
 */
char *extstr(ExtDescriptor *ext)
{
  static char str[20];

  switch (ext->xdrNumABlks)
    {
    case 0:
      return "[]";

    case 1:
      sprintf(str, "1[%u]", ext->xdrStABN);
      break;

    default:
      sprintf(str, "%u[%u..%u]", ext->xdrNumABlks,
	      ext->xdrStABN, ext->xdrStABN + ext->xdrNumABlks - 1);
    }

  return str;
}

/*
 * NAME:	extrecstr()
 * DESCRIPTION:	convert an extent record into a printable string
 */
char *extrecstr(ExtDataRec *rec)
{
  static char str[60];
  ExtDescriptor *ext;
  int i;

  str[0] = 0;

  for (i = 0, ext = &(*rec)[0]; i < 3; ++i, ++ext)
    {
      if (i > 0)
	strcat(str, "+");

      strcat(str, extstr(ext));
    }

  return str;
}

/*
 * NAME:	outhex()
 * DESCRIPTION:	output a block of data in hex format
 */
void outhex(unsigned char *data, unsigned int len)
{
  int toggle = 0;

  while (len--)
    printf("%02x%s", *data++, toggle++ & 0x01 ? " " : "");
}

/*
 * NAME:	ask()
 * DESCRIPTION:	answer question from user
 */
int ask(char *question, ...)
{
  int result = -1;
  va_list args;

  va_start(args, question);

  vprintf(question, args);

  if (! REPAIR)
    {
      printf(".\n");
      result = 0;
    }
  else if (YES)
    {
      printf(": fixing.\n");
      result = 1;
    }
  else
    {
      while (1)
	{
	  char answer[80];

	  if (feof(stdin))
	    {
	      printf("...\n");
	      result = 0;
	      break;
	    }

	  printf(". Fix? ");
	  fflush(stdout);

	  fgets(answer, sizeof(answer), stdin);

	  if (feof(stdin))
	    {
	      printf("\n");
	      result = 0;
	      break;
	    }

	  switch (answer[0])
	    {
	    case 'y':
	    case 'Y':
	      result = 1;
	      break;

	    case 'n':
	    case 'N':
	      result = 0;
	      break;
	    }

	  if (result == -1)
	    vprintf(question, args);
	  else
	    break;
	}
    }

  va_end(args);

  return result;
}
