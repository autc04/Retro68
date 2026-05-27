/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include "config.h"
#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#include "atari-gem_errno.h"
#include "libnosys/warning.h"

int symlink(const char *path1, const char *path2)
{
    errno = ENOSYS;
    return -1;
}

stub_warning(symlink)
