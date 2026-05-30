/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <_ansi.h>
#include "atari-traps.h"

int isatty(int fd)
{
	return fd == GSH_AUX ? 1 : 0;
}
