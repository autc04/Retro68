/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#ifndef TRAPS_DEFINED
#define TRAPS_DEFINED

#include "atari-gem_basepage.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
	Only trap calls used by atari libgloss is included here.
*/

unsigned int trap1_e(unsigned short bios_drive);

// Returned drive starts at 0 for A
unsigned short trap1_19(void);

unsigned short trap1_2a(void);

int trap1_2b(unsigned short date);

unsigned short trap1_2c(void);

int trap1_2d(unsigned short time);

struct DTA* trap1_2f(unsigned short bios_handle);

int trap1_39(const char* bios_path);

int trap1_3a(const char* bios_path);

int trap1_3b(const char* bios_path);

int trap1_3c(const char* bios_path, unsigned short bios_attrib);

int trap1_3d(const char* bios_path, unsigned short bios_mode);

#define GSH_BIOSCON		0xFFFF
#define GSH_BIOSAUX		0xFFFE
#define GSH_BIOSPRN		0xFFFD
#define GSH_BIOSMIDIIN	0xFFFC
#define GSH_BIOSMIDIOUT	0xFFFB
#define GSH_CONIN		0x00
#define GSH_CONOUT		0x01
#define GSH_AUX			0x02
#define GSH_PRN			0x03

int trap1_3e(unsigned short bios_handle);

int trap1_3f(unsigned short bios_handle, int length, void* buf);

int trap1_40(unsigned short bios_handle, int length, const void* buf);

int trap1_41(const char* bios_path);

int trap1_42(unsigned int file_position, unsigned short bios_handle, unsigned short bios_mode);

// bios_drive 0 is default drive, and 1 and upwards is A...
int trap1_47(char* buf, unsigned short bios_drive);

#define PE_LOADGO		0
#define PE_LOAD			3
#define PE_GO			4
#define PE_BASEPAGE		5
#define PE_GOTHENFREE	6
int trap1_4b(unsigned short mode, const char* file_name, const char* cmdline, const char* envstring);

int trap1_56(const char* oldname, const char* newname);

unsigned int trap14_11(void);

int trap14_26(int (*callback)(void));

#ifdef __cplusplus
}
#endif

#endif // TRAPS_DEFINED
