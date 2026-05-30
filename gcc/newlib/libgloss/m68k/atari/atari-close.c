/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

int close(int fd)
{
	int err = GEM_EIHNDL;
	if (fd >= 0)
	{
		err = trap1_3e((unsigned short)fd);
	}
	if (err <  0)
	{
		gem_error_to_errno(err);
		return -1;
	}
	return 0;
}
