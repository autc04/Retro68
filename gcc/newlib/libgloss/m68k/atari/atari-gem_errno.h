/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#ifndef GEM_ERRNO_DEFINED
#define GEM_ERRNO_DEFINED

#ifdef __cplusplus
extern "C" {
#endif

#define GEM_E_OK 			0		// No error
#define GEM_ERROR 			-1		// Generic error
#define GEM_EDRVNR 			-2		// Drive not ready
#define GEM_EUNCMD 			-3		// Unknown command
#define GEM_E_CRC 			-4		// CRC error
#define GEM_EBADRQ			-5		// Bad request
#define GEM_E_SEEK			-6		// Seek error
#define GEM_EMEDIA			-7		// Unknown media
#define GEM_ESECNF			-8		// Sector not found
#define GEM_EPAPER			-9		// Out of paper
#define GEM_EWRITF			-10		// Write fault
#define GEM_EREADF			-11		// Read fault
#define GEM_EWRPRO			-12		// Device is write protected
#define GEM_E_CHNG			-14		// Media change detected
#define GEM_EUNDEV			-15		// Unknown device
#define GEM_EBADSF			-16		// Bad sectors on format
#define GEM_EOTHER			-17		// Insert other disk (request)
#define GEM_EINVFN			-32		// Invalid function
#define GEM_EFILNF			-33		// File not found
#define GEM_EPTHNF			-34		// Path not found
#define GEM_ENHNDL			-35		// No more handles
#define GEM_EACCDN			-36		// Access denied
#define GEM_EIHNDL			-37		// Invalid handle
#define GEM_ENSMEM			-39		// Insufficient memory
#define GEM_EIMBA 			-40		// Invalid memory block address
#define GEM_EDRIVE			-46		// Invalid drive specification
#define GEM_ENSAME			-48		// Cross device rename
#define GEM_ENMFIL			-49		// No more files
#define GEM_ELOCKED			-58		// Record is already locked
#define GEM_ENSLOCK			-59		// Invalid lock removal request
#define GEM_ERANGE			-64		// Range error
#define GEM_ENAMETOOLONG	-64		// Range error
#define GEM_EINTRN			-65		// Internal error
#define GEM_EPLFMT			-66		// Invalid program load format
#define GEM_EGSBF			-67		// Memory block growth failure
#define GEM_ELOOP			-80		// Too many symbolic links
#define GEM_EMOUNT			-200	// Mount point crossed (indicator)

void gem_error_to_errno(int gem_error);

#ifdef __cplusplus
}
#endif

#endif // GEM_ERRNO_DEFINED
