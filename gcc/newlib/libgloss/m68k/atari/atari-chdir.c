/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

int chdir(const char *path)
{
	int err = GEM_E_OK;
	if (path != 0)
	{
		if (path[1] == ':')
		{
			unsigned int drives = 0;
			unsigned short drive = 0;
			if (path[0] >= 'A' && path[0] <= 'Z')
			{
				drive = (unsigned short)(path[0] - 'A');
			}
			else if (path[0] >= 'a' && path[0] <= 'z')
			{
				drive = (unsigned short)(path[0] - 'a');
			}
			drives = trap1_e(drive);
			if ((drives & (1 << drive)) == 0)
			{
				err = GEM_EDRIVE;
			}
			path += 2;
		}
		if (err == GEM_E_OK)
		{
			err = trap1_3b(path);
		}
	}
	else
	{
		err = GEM_EPTHNF;
	}
	if (err < 0)
	{
		gem_error_to_errno(err);
		return -1;
	}
	return 0;
}