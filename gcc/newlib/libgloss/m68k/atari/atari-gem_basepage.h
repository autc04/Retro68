/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#ifndef GEM_BASEPAGE_H
#define GEM_BASEPAGE_H

#ifdef __cplusplus
extern "C" {
#endif

/*
	This is the process base page data, containing information about the executable.
*/

#define FA_READONLY	0x01	// Read-only flag
#define FA_HIDDEN 0x02		// Hidden file flag
#define FA_SYSTEM 0x04		// System file flag
#define FA_VOLUME 0x08		// Volume label flag
#define FA_DIR 0x10			// Subdirectory
#define FA_ARCHIVE 0x20		// Archive flag

struct DTA
{
	unsigned char d_reserved[21];
	unsigned char d_attrib;
	unsigned short d_time;
	unsigned short d_date;
	unsigned int d_length;
	char d_fname[14];
};

struct BasePage
{
	unsigned char* p_lowtpa;	// This LONG contains a pointer to the Transient Program Area (TPA).
	unsigned char* p_hitpa;		// This LONG contains a pointer to the top of the TPA + 1.
	unsigned char* p_tbase;		// This LONG contains a pointer to the base of the text segment
	unsigned int p_tlen;		// This LONG contains the length of the text segment.
	unsigned char* p_dbase;		// This LONG contains a pointer to the base of the data segment.
	unsigned int p_dlen;		// This LONG contains the length of the data segment.
	unsigned char* p_bbase;		// This LONG contains a pointer to the base of the BSS segment.
	unsigned int p_blen;		// This LONG contains the length of the BSS segment.
	struct DTA* p_dta;			// This LONG contains a pointer to the processes’ DTA.
	struct BasePage* p_parent;	// This LONG contains a pointer to the processes’ parent’s basepage.
	unsigned int p_reserved;	// This LONG is currently unused and is reserved.
	char* p_env;				// This LONG contains a pointer to the processes’ environment string.
	unsigned char p_undef[80];	// This area contains 80 unused, reserved bytes.
	char p_cmdlin[128];			// This area contains a copy of the 128 byte command line string.
};

extern struct BasePage* _BasePage;

#ifdef __cplusplus
}
#endif

#endif // GEM_BASEPAGE_H
