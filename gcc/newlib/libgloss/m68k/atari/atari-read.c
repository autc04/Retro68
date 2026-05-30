/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

_READ_WRITE_RETURN_TYPE read(int fd, void *buf, size_t nbytes)
{
	int numRead = GEM_EIHNDL;
	if (fd >= 0)
	{
		numRead = trap1_3f((unsigned short)fd, nbytes, buf);
		if (numRead >= 0 && numRead < nbytes && fd == GSH_CONIN)
		{
			/*
				When reading from console, the EOF character is "\n".
				Atari tos do not return the EOF character, but posix read do.
				So we assume that when the trap call have not reached the nbytes limit,
				then it must have gotten an EOF.
				So in that case we insert "\n" to the end of the buffer and increase lenth by 1.
			*/
			((char*)buf)[numRead] = '\n';
			++numRead;
			/*
				This is not enough however...
				Atari tos requires a line feed to be "\r\n", and apparently, the "\r" is executed by tos
				but not returned when reading. This is not a problem for us, but the "\n" as it is an EOF
				is simply discarded and not executed. So we also need to send a "\n" to stdout to fully comply
				with standard C behaviour.
			*/
			trap1_40(GSH_CONOUT, 1, "\n");
		}
	}
	if (numRead < 0)
	{
		gem_error_to_errno(numRead);
		return -1;
	}
	return numRead;
}
