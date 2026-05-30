/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

int _rename(const char *old_filename, const char *new_filename)
{
	int err = trap1_56(old_filename, new_filename);
	if (err < 0)
	{
		gem_error_to_errno(err);
		return -1;
	}
	return 0;
}