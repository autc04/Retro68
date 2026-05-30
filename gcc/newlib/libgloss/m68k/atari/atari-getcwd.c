/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <errno.h>

#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

char *getcwd(char *buf, size_t size)
{
	char *retbuf = buf;
	if (retbuf == 0)
	{
		errno = EIO;
		return 0;
	}

	unsigned short drive = trap1_19();
	int result = trap1_47(retbuf + 2, drive + 1);
	if (result < 0)
	{
		gem_error_to_errno(result);
		return 0;
	}
	retbuf[0] = (char)('A' + drive);
	retbuf[1] = ':';
	return retbuf;
}
