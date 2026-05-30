/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

off_t lseek(int fd, off_t offset, int whence)
{
	int newoff = GEM_EIHNDL;
	if (fd >= 0 && fd <= 2)
	{
		// stdin, stdout and stderr just returns OK without doing anything.
		return 0;
	}
	else if (fd >= 3)
	{
		// Any file descriptor
		unsigned short bios_mode = 3; // invalid mode
		switch (whence)
		{
		case SEEK_SET:
			bios_mode = 0;
			break;
		case SEEK_CUR:
			bios_mode = 1;
			break;
		case SEEK_END:
			bios_mode = 2;
			break;
		}
		newoff = trap1_42((unsigned int)offset, (unsigned short)fd, bios_mode);
	}
	if (newoff < 0)
	{
		gem_error_to_errno(newoff);
		return (off_t)-1;
	}
	return (off_t)newoff;
}
