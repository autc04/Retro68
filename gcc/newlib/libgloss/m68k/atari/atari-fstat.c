/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <sys/stat.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"
#include "atari-gem_basepage.h"

/*
	From man page:
	"only the st_uid, st_gid, st_size, and st_mode fields,
	and only the S_IRUSR, S_IWUSR, S_IRGRP, S_IWGRP, S_IROTH, and S_IWOTH file permission bits need be valid."
*/

int fstat(int fd, struct stat *buf)
{
	struct DTA *dta = (struct DTA *)GEM_EIHNDL;
	// For now, we just support files.
	if (fd >= 6)
	{
		buf->st_mode = S_IRUSR | S_IRGRP | S_IROTH;
		// files
		dta = trap1_2f((unsigned int)fd);
		if ((int)dta >= 0)
		{
			// Attribs
			buf->st_mode |= (dta->d_attrib & FA_DIR) ? S_IFDIR : S_IFREG;
			if ((dta->d_attrib & FA_READONLY) != 0)
			{
				buf->st_mode |= S_IWUSR | S_IWGRP | S_IWOTH;
			}
			buf->st_size = dta->d_length;
			// st_uid, st_gid have no meaning for the st, so we ignore them.
		}
	}
	else
	{
		// unsupported, fake something.
		buf->st_mode = S_IFCHR;
		buf->st_blksize = 0;
	}
	if ((int)dta < 0)
	{
		gem_error_to_errno((int)dta);
		return -1;
	}
	return 0;
}
