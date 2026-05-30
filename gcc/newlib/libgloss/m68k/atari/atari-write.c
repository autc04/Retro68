/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

const char* lineEnding = "\r\n";

int writeUntilDoneOrError(int fd, size_t len, const char* buf)
{
	size_t written = 0;
	if (len == 0)
	{
		return 0;
	}
	do
	{
		int n = trap1_40((unsigned short)fd, len, buf);
		if (n < 0)
		{
			gem_error_to_errno(n);
			return -1;
		}
		written += n;
		buf += n;
	} while (written < len);
	return 0;
}


_READ_WRITE_RETURN_TYPE write(int fd, const void *buf, size_t nbytes)
{
	int numWritten = GEM_EIHNDL;
	if (fd >= 0)
	{
		if (fd == 2)
		{
			fd = GSH_CONOUT; // Use console out for stderr.
		}
		if (fd == GSH_CONOUT)
		{
			// When we write to stdout on Atari, we must add a \r after \n to
			// get the correct C output behaviour.
			const char* stream = (const char*)buf;
			size_t lastWrite = 0;
			for (size_t i = 0; i < nbytes; ++i)
			{
				if (stream[i] == '\n')
				{
					int len = i - lastWrite; // length up to but not including \n
					if (writeUntilDoneOrError(fd, len, stream + lastWrite) < 0)
					{
						return -1;
					}
					if (writeUntilDoneOrError(fd, 2, lineEnding) < 0)
					{
						return -1;
					}
					lastWrite = i + 1;	// Include the \n
				}
			}
			if (lastWrite < nbytes)
			{
				int len = nbytes - lastWrite;
				if (writeUntilDoneOrError(fd, len, stream + lastWrite) < 0)
				{
					return -1;
				}
			}
			numWritten = nbytes;
		}
		else
		{
			numWritten = trap1_40((unsigned short)fd, nbytes, buf);
		}
	}
	if (numWritten < 0)
	{
		gem_error_to_errno(numWritten);
		return -1;
	}
	return numWritten;
}
