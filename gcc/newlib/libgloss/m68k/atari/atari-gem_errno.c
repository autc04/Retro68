/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <errno.h>
#include "atari-gem_errno.h"
#include <_ansi.h>

/*
	The conversion between gem errors and errno is not a one to one match,
	so the goal has been to try and report errors to errno in such way that
	code depending on this will run as expected.
	This remains to be proven correct.
*/
void gem_error_to_errno(int gem_error)
{
	errno = ENOSYS; // Use this as default error code.
	switch (gem_error)
	{
	case GEM_EDRVNR:
	case GEM_EMEDIA:
	case GEM_EPAPER:
		errno = EIO;
		break;
	case GEM_EBADRQ:
		errno = EINVAL;
		break;
	case GEM_E_SEEK:
		errno = ESPIPE;
		break;
	case GEM_ESECNF:
	case GEM_EWRITF:
	case GEM_EREADF:
		errno = EIO;
		break;
	case GEM_EWRPRO:
		errno = EROFS;
		break;
	case GEM_EUNDEV:
	case GEM_EDRIVE:
		errno = ENODEV;
		break;
	case GEM_EFILNF:
	case GEM_EPTHNF:
	case GEM_EMOUNT:
		errno = ENOENT;
		break;
	case GEM_ENHNDL:
	case GEM_ENMFIL:
		errno = EMFILE;
		break;
	case GEM_EACCDN:
		errno = EACCES;
		break;
	case GEM_EIHNDL:
		errno = EBADF;
		break;
	case GEM_ENSMEM:
	case GEM_EGSBF:
		errno = ENOMEM;
		break;
	case GEM_EIMBA:
		errno = EADDRNOTAVAIL;
		break;
	case GEM_ENSAME:
		errno = EXDEV;
		break;
	case GEM_ELOCKED:
	case GEM_ENSLOCK:
		errno = ENOLCK;
		break;
	case GEM_ENAMETOOLONG:
		errno = ENAMETOOLONG;
		break;
	case GEM_EPLFMT:
		errno = ENOEXEC;
		break;
	case GEM_ELOOP:
		errno = EMLINK;
		break;
	case GEM_E_OK:
	case GEM_ERROR:
	case GEM_EUNCMD:
	case GEM_E_CRC:
	case GEM_E_CHNG:
	case GEM_EBADSF:
	case GEM_EOTHER:
	case GEM_EINVFN:
	case GEM_EINTRN:
	default:
		errno = -gem_error;
		break;
	}
}
