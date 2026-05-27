/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <sys/stat.h>
#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"

// I don't like this extern declaration here...
extern int open(const char *buf, int flags, int mode);

int stat(const char *path, struct stat *buf)
{
	int handle = open(path, 0, 0); // read only
	if (handle >= 0)
	{
		int err = fstat(handle, buf);
		close(handle);
		handle = err;
	}
	if (handle < 0)
	{
		gem_error_to_errno(handle);
		return -1;
	}
	return 0;
}
