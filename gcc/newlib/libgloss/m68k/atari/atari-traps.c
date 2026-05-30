/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include "atari-traps.h"

// Store stack pointer in a3, that by Atari documentation will be left untouched by the trap call.
#define TRAP_BEGIN "move.l		%%a7, %%a3\n\t"
// Make trap call and then restore the stack pointer from the stored value in a3
#define TRAP_FUNC(num, func) "move.w		#" #func ", %%a7@-\n\ttrap		#" #num "\n\tmove.l		%%a3, %%a7\n\t"
// Registers d1,d2 and a0, a1, a2 may be affected by trap #1 calls. Register a3 is used to store/restore a7
#define CLOBBER_REG "d1", "d2", "a0", "a1", "a2", "a3"

unsigned int trap1_e(unsigned short bios_drive)
{
	register unsigned int bios_mounted_drives asm ("d0") = 0;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0xe)
		: "=r" (bios_mounted_drives)
		: "r" (bios_drive)
		: CLOBBER_REG);
	return bios_mounted_drives;
}

unsigned short trap1_19(void)
{
	register unsigned short bios_drive asm ("d0") = 0;
	__asm__ volatile (
		TRAP_BEGIN
		TRAP_FUNC(1, 0x19)
		: "=r" (bios_drive)
		:
		: CLOBBER_REG);
	return bios_drive;
}

unsigned short trap1_2a(void)
{
	register unsigned short date asm ("d0") = 0;
	__asm__ volatile (
		TRAP_BEGIN
		TRAP_FUNC(1, 0x2a)
		: "=r" (date)
		:
		: CLOBBER_REG);
	return date;
}

int trap1_2b(unsigned short date)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x2b)
		: "=r" (result)
		:"r" (date)
		: CLOBBER_REG);
	return result;
}

unsigned short trap1_2c(void)
{
	register unsigned short time asm ("d0") = 0;
	__asm__ volatile (
		TRAP_BEGIN
		TRAP_FUNC(1, 0x2c)
		: "=r" (time)
		:
		: CLOBBER_REG);
	return time;
}

int trap1_2d(unsigned short time)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x2d)
		: "=r" (result)
		:"r" (time)
		: CLOBBER_REG);
	return result;
}


struct DTA* trap1_2f(unsigned short bios_handle)
{
	register struct DTA* result asm ("d0") = (struct DTA*)-1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x2f)
		: "=r" (result)
		: "r" (bios_handle)
		: CLOBBER_REG);
	return result;
}


int trap1_39(const char* bios_path)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x39)
		: "=r" (result)
		: "r" (bios_path)
		: CLOBBER_REG);
	return result;
}

int trap1_3a(const char* bios_path)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x3a)
		: "=r" (result)
		: "r" (bios_path)
		: CLOBBER_REG);
	return result;
}

int trap1_3b(const char* bios_path)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x3b)
		: "=r" (result)
		: "r" (bios_path)
		: CLOBBER_REG);
	return result;
}

int trap1_3c(const char* bios_path, unsigned short bios_attrib)
{
	register int bios_handle asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%2, %%a7@-\n\t"
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x3c)
		: "=r" (bios_handle)
		: "r" (bios_path), "r" (bios_attrib)
		: CLOBBER_REG);
	return bios_handle;
}

int trap1_3d(const char* bios_path, unsigned short bios_mode)
{
	register int bios_handle asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%2, %%a7@-\n\t"
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x3d)
		: "=r" (bios_handle)
		: "r" (bios_path), "r" (bios_mode)
		: CLOBBER_REG);
	return bios_handle;
}

int trap1_3e(unsigned short bios_handle)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x3e)
		: "=r" (result)
		: "r" (bios_handle)
		: CLOBBER_REG);
	return result;
}

int trap1_3f(unsigned short bios_handle, int length, void* buf)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%3, %%a7@-\n\t"
		"move.l		%2, %%a7@-\n\t"
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x3f)
		: "=r" (result)
		: "r" (bios_handle), "r" (length), "r" (buf)
		: CLOBBER_REG);
	return result;
}

int trap1_40(unsigned short bios_handle, int length, const void* buf)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%3, %%a7@-\n\t"
		"move.l		%2, %%a7@-\n\t"
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x40)
		: "=r" (result)
		: "r" (bios_handle), "r" (length), "r" (buf)
		: CLOBBER_REG);
	return result;
}

int trap1_41(const char* bios_path)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x41)
		: "=r" (result)
		: "r" (bios_path)
		: CLOBBER_REG);
	return result;
}

int trap1_42(unsigned int file_position, unsigned short bios_handle, unsigned short bios_mode)
{
	register int new_position asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%3, %%a7@-\n\t"
		"move.w		%2, %%a7@-\n\t"
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x42)
		: "=r" (new_position)
		: "r" (file_position), "r" (bios_handle), "r" (bios_mode)
		: CLOBBER_REG);
	return new_position;
}

int trap1_47(char* buf, unsigned short bios_drive)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.w		%2, %%a7@-\n\t"
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x47)
		: "=r" (result)
		: "r" (buf), "r" (bios_drive)
		: CLOBBER_REG);
	return result;
}

int trap1_4b(unsigned short mode, const char* file_name, const char* cmdline, const char* envstring)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%4, %%a7@-\n\t"
		"move.l		%3, %%a7@-\n\t"
		"move.l		%2, %%a7@-\n\t"
		"move.w		%1, %%a7@-\n\t"
		TRAP_FUNC(1, 0x4b)
		: "=r" (result)
		: "r" (mode), "r" (file_name), "r" (cmdline), "r" (envstring)
		: CLOBBER_REG);
	return result;
}

int trap1_56(const char* oldname, const char* newname)
{
	register int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%2, %%a7@-\n\t"
		"move.l		%1, %%a7@-\n\t"
		"move.w		#0, %%a7@-\n\t"
		TRAP_FUNC(1, 0x56)
		: "=r" (result)
		: "r" (oldname), "r" (newname)
		: CLOBBER_REG);
	return result;
}

unsigned int trap14_11(void)
{
	register unsigned int result asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		TRAP_FUNC(14, 0x11)
		: "=r" (result)
		:
		: CLOBBER_REG);
	return result;
}

int trap14_26(int (*callback)(void))
{
	register int callback_return asm ("d0") = -1;
	__asm__ volatile (
		TRAP_BEGIN
		"move.l		%1, %%a7@-\n\t"
		TRAP_FUNC(14, 0x26)
		: "=r" (callback_return)
		: "r" (callback)
		: CLOBBER_REG);
	return callback_return;
}
