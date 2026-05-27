/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

// I really don't like having these defines here,
// fcntl.h where they are, also defines a function for "open",
// that is different from the one libgloss is supposed to provide...
#ifndef O_CREAT
#define O_CREAT 0x0200
#endif // O_CREAT
#ifndef O_APPEND
#define O_APPEND 0x0008
#endif // O_APPEND
#ifndef O_EXCL
#define O_EXCL 0x0800
#endif // O_EXCL
#ifndef O_TRUNC
#define O_TRUNC 0x0400
#endif // O_TRUNC

// mode is ignored. Those kind of settings is not supported by the st.
int open(const char *buf, int flags, int mode)
{
	int bios_handle = -1;
	unsigned short bios_mode = (unsigned short)(flags & 0x3); // bits 0-1 the same for st and linux.
	int create = flags & O_CREAT;
	int append = flags & O_APPEND; // open doc says that seek end should be done before each write call. We assume that newlib handles that.
	int excl = flags & O_EXCL;	   // File must be created by this call.
	int trunc = flags & O_TRUNC;   // File is forced to be created and thus truncated.

	const char *bios_path = buf;
	if (!trunc)
	{
		bios_handle = trap1_3d(bios_path, bios_mode);
	}
	if (bios_handle < 0 && (create || trunc))
	{
		unsigned short bios_attrib = 0;
		bios_handle = trap1_3c(bios_path, bios_attrib);
	}
	else if (create && excl)
	{
		// We explicitly specified that file must be created, and it already existed, so error!
		gem_error_to_errno(GEM_EACCDN);
		// Close file.
		trap1_3e((unsigned short)bios_handle);
		return -1;
	}

	if (bios_handle >= 0 && append)
	{
		// Seek to end.
		int new_file_pos = trap1_42(0, (unsigned short)bios_handle, 2);
		if (new_file_pos < 0)
		{
			gem_error_to_errno(new_file_pos);
			// Close file.
			trap1_3e((unsigned short)bios_handle);
			return -1;
		}
	}

	if (bios_handle < 0)
	{
		gem_error_to_errno(bios_handle);
		bios_handle = -1;
	}
	/*
		If bios_handle is positive, then the low word is the gemdos handle, and the high word is zero.
	*/
	return bios_handle;
}
