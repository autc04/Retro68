/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include "config.h"
#include <errno.h>
#include "libnosys/warning.h"

int execve(char *name, char **argv, char **env)
{
    errno = ENOSYS;
	return -1;
}

stub_warning(execve)
