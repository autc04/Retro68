/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

int unlink(char *path)
{
	int err = trap1_41(path);
	if (err < 0)
	{
		gem_error_to_errno(err);
		return -1;
	}
	return 0;
}
