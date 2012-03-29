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
 * $Id: charset.c,v 1.5 1998/11/02 22:08:23 rob Exp $
 */

# ifdef HAVE_CONFIG_H
#  include "config.h"
# endif

# include <stdlib.h>
# include <string.h>

# include "charset.h"

static const
UCS2 macroman[256] = {
  0x0000, 0x0001, 0x0002, 0x0003, 0x0004, 0x0005, 0x0006, 0x0007,
  0x0008, 0x0009, 0x000a, 0x000b, 0x000c, 0x000d, 0x000e, 0x000f,
  0x0010, 0x0011, 0x0012, 0x0013, 0x0014, 0x0015, 0x0016, 0x0017,
  0x0018, 0x0019, 0x001a, 0x001b, 0x001c, 0x001d, 0x001e, 0x001f,

  0x0020, 0x0021, 0x0022, 0x0023, 0x0024, 0x0025, 0x0026, 0x0027,
  0x0028, 0x0029, 0x002a, 0x002b, 0x002c, 0x002d, 0x002e, 0x002f,
  0x0030, 0x0031, 0x0032, 0x0033, 0x0034, 0x0035, 0x0036, 0x0037,
  0x0038, 0x0039, 0x003a, 0x003b, 0x003c, 0x003d, 0x003e, 0x003f,

  0x0040, 0x0041, 0x0042, 0x0043, 0x0044, 0x0045, 0x0046, 0x0047,
  0x0048, 0x0049, 0x004a, 0x004b, 0x004c, 0x004d, 0x004e, 0x004f,
  0x0050, 0x0051, 0x0052, 0x0053, 0x0054, 0x0055, 0x0056, 0x0057,
  0x0058, 0x0059, 0x005a, 0x005b, 0x005c, 0x005d, 0x005e, 0x005f,

  0x0060, 0x0061, 0x0062, 0x0063, 0x0064, 0x0065, 0x0066, 0x0067,
  0x0068, 0x0069, 0x006a, 0x006b, 0x006c, 0x006d, 0x006e, 0x006f,
  0x0070, 0x0071, 0x0072, 0x0073, 0x0074, 0x0075, 0x0076, 0x0077,
  0x0078, 0x0079, 0x007a, 0x007b, 0x007c, 0x007d, 0x007e, 0x007f,

  0x00c4, 0x00c5, 0x00c7, 0x00c9, 0x00d1, 0x00d6, 0x00dc, 0x00e1,
  0x00e0, 0x00e2, 0x00e4, 0x00e3, 0x00e5, 0x00e7, 0x00e9, 0x00e8,
  0x00ea, 0x00eb, 0x00ed, 0x00ec, 0x00ee, 0x00ef, 0x00f1, 0x00f3,
  0x00f2, 0x00f4, 0x00f6, 0x00f5, 0x00fa, 0x00f9, 0x00fb, 0x00fc,

  0x2020, 0x00b0, 0x00a2, 0x00a3, 0x00a7, 0x2022, 0x00b6, 0x00df,
  0x00ae, 0x00a9, 0x2122, 0x00b4, 0x00a8, 0x2260, 0x00c6, 0x00d8,
  0x221e, 0x00b1, 0x2264, 0x2265, 0x00a5, 0x00b5, 0x2202, 0x2211,
  0x220f, 0x03c0, 0x222b, 0x00aa, 0x00ba, 0x2126, 0x00e6, 0x00f8,

  0x00bf, 0x00a1, 0x00ac, 0x221a, 0x0192, 0x2248, 0x2206, 0x00ab,
  0x00bb, 0x2026, 0x00a0, 0x00c0, 0x00c3, 0x00d5, 0x0152, 0x0153,
  0x2013, 0x2014, 0x201c, 0x201d, 0x2018, 0x2019, 0x00f7, 0x25ca,
  0x00ff, 0x0178, 0x2044, 0x00a4, 0x2039, 0x203a, 0xfb01, 0xfb02,

  0x2021, 0x00b7, 0x201a, 0x201e, 0x2030, 0x00c2, 0x00ca, 0x00c1,
  0x00cb, 0x00c8, 0x00cd, 0x00ce, 0x00cf, 0x00cc, 0x00d3, 0x00d4,
  0xf8ff, 0x00d2, 0x00da, 0x00db, 0x00d9, 0x0131, 0x02c6, 0x02dc,
  0x00af, 0x02d8, 0x02d9, 0x02da, 0x00b8, 0x02dd, 0x02db, 0x02c7
};

static const
char *macroman_subst[128] = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	/* 0x80 - 0x8f */
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	/* 0x90 - 0x9f */

  "+", 0, 0, 0, 0, "*", 0, 0,				/* 0xa0 - 0xa7 */
  0, 0, "[tm]", 0, 0, "!=", 0, 0,			/* 0xa8 - 0xaf */

  "[inf]", 0, "<=", ">=", 0, 0, "[partial]", "[Sum]",	/* 0xb0 - 0xb7 */
  "[Prod]", "[pi]", "[Integral]", 0, 0, "[ohm]", 0, 0,	/* 0xb8 - 0xbf */

  0, 0, 0, "[Sqrt]", "[f]", "~=", "[delta]", 0,		/* 0xc0 - 0xc7 */
  0, "...", 0, 0, 0, 0, "OE", "oe",			/* 0xc8 - 0xcf */

  "-", "--", "``", "''", "`", "'", 0, "#",		/* 0xd0 - 0xd7 */
  0, "Y", "/", 0, "<", ">", "fi", "fl",			/* 0xd8 - 0xdf */

  "++", 0, ",", ",,", "o/oo", 0, 0, 0,			/* 0xe0 - 0xe7 */
  0, 0, 0, 0, 0, 0, 0, 0,				/* 0xe8 - 0xef */

  "[Apple]", 0, 0, 0, 0, "i", "^", "~",			/* 0xf0 - 0xf7 */
  0, "-", "\267", "\260", 0, "\"", "-", "^"		/* 0xf8 - 0xff */
};

static
unsigned char latin1[256];

static const
char *latin1_subst[128] = {
  "", "", "", "", "", "", "", "",			/* 0x80 - 0x87 */
  "", "", "", "", "", "", "", "",			/* 0x88 - 0x8f */

  "", "", "", "", "", "", "", "",			/* 0x90 - 0x97 */
  "", "", "", "", "", "", "", "",			/* 0x98 - 0x9f */

  0, 0, 0, 0, 0, 0, "|", 0,				/* 0xa0 - 0xa7 */
  0, 0, 0, 0, 0, "-", 0, 0,				/* 0xa8 - 0xaf */

  0, 0, "[^2]", "[^3]", 0, 0, 0, 0,			/* 0xb0 - 0xb7 */
  0, "[^1]", 0, 0, "[1/4]", "[1/2]", "[3/4]", 0,	/* 0xb8 - 0xbf */

  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	/* 0xc0 - 0xcf */

  "D", 0, 0, 0, 0, 0, 0, "x",				/* 0xd0 - 0xd7 */
  0, 0, 0, 0, 0, "Y", "P", 0,				/* 0xd8 - 0xdf */

  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	/* 0xe0 - 0xef */

  "d", 0, 0, 0, 0, 0, 0, 0,				/* 0xf0 - 0xf7 */
  0, 0, 0, 0, 0, "y", "p", 0				/* 0xf8 - 0xff */
};

/*
 * NAME:	charset->unicode()
 * DESCRIPTION:	return a Unicode string for MacOS Standard Roman
 */
UCS2 *cs_unicode(char *mstr, int *lenptr)
{
  int len, i;
  UCS2 *unicode, *ptr;

  len = lenptr ? *lenptr : strlen(mstr);

  unicode = malloc((len + 1) * sizeof(UCS2));
  if (unicode == 0)
    return 0;

  ptr = unicode;
  for (i = 0; i < len; ++i)
    *ptr++ = macroman[*(unsigned char *) mstr++];

  *ptr = 0;

  return unicode;
}

/*
 * NAME:	charset->latin1()
 * DESCRIPTION:	return a Latin-1 (ISO 8859-1) string for MacOS Standard Roman
 */
char *cs_latin1(char *mstr, int *lenptr)
{
  int ilen, olen, i;
  char *latin1, *ptr;
  const char *subst;
  unsigned char ch;
  UCS2 unicode;

  ilen = lenptr ? *lenptr : strlen(mstr);

  olen = 0;
  for (i = 0; i < ilen; ++i)
    {
      ch = *((unsigned char *) mstr + i);
      unicode = macroman[ch];

      if (unicode & 0xff00)
	olen += strlen(macroman_subst[ch & 0x7f]);
      else
	++olen;
    }

  latin1 = malloc(olen + 1);
  if (latin1 == 0)
    return 0;

  ptr = latin1;
  for (i = 0; i < ilen; ++i)
    {
      ch = *(unsigned char *) mstr++;
      unicode = macroman[ch];

      if (unicode & 0xff00)
	{
	  /* substitute similar Latin-1 character(s) */

	  subst = macroman_subst[ch & 0x7f];

	  strcpy(ptr, subst);
	  ptr += strlen(subst);
	}
      else
	*ptr++ = unicode;
    }

  *ptr = 0;

  if (lenptr)
    *lenptr = olen;

  return latin1;
}

/*
 * NAME:	charset->mktable()
 * DESCRIPTION:	construct latin1[] table from macroman[]
 */
static
void mktable(void)
{
  int i;

  for (i = 0x00; i <= 0xff; ++i)
    latin1[i] = 0xff;

  for (i = 0x00; i <= 0xff; ++i)
    {
      UCS2 unicode = macroman[i];

      if (! (unicode & 0xff00))
	latin1[unicode] = i;
    }
}

/*
 * NAME:	charset->macroman()
 * DESCRIPTION:	return a MacOS Standard Roman string for Latin-1 (ISO 8859-1)
 */
char *cs_macroman(char *lstr, int *lenptr)
{
  int ilen, olen, i;
  char *macroman, *ptr;
  const char *subst;
  unsigned char ch, msr;

  if (latin1[0x80] != 0xff)
    mktable();

  ilen = lenptr ? *lenptr : strlen(lstr);

  olen = 0;
  for (i = 0; i < ilen; ++i)
    {
      ch = *((unsigned char *) lstr + i);
      msr = latin1[ch];

      if (msr == 0xff)
	olen += strlen(latin1_subst[ch & 0x7f]);
      else
	++olen;
    }

  macroman = malloc(olen + 1);
  if (macroman == 0)
    return 0;

  ptr = macroman;
  for (i = 0; i < ilen; ++i)
    {
      ch = *(unsigned char *) lstr++;
      msr = latin1[ch];

      if (msr == 0xff)
	{
	  /* substitute similar MacOS Standard Roman character(s) */

	  subst = latin1_subst[ch & 0x7f];

	  strcpy(ptr, subst);
	  ptr += strlen(subst);
	}
      else
	*ptr++ = msr;
    }

  *ptr = 0;

  if (lenptr)
    *lenptr = olen;

  return macroman;
}
