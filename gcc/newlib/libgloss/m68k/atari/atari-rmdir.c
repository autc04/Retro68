/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

int rmdir(const char *pathname)
{
	int result = trap1_3a(pathname);
	if (result < 0)
	{
		gem_error_to_errno(result);
		return -1;
	}
	return 0;
}