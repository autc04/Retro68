/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <time.h>
#include <sys/times.h>
#include "atari-traps.h"
#include "atari-gem_errno.h"

// Defined and initialized in atari-crti.S
extern unsigned int _atari_4ba_at_prg_start;


// The memory location read is actually unsigned, so we cast that in the caller func.
int read200hzMem(void)
{
	// 0x4ba is a privileged address only readable in supervisor mode.
	return *((int*)0x4ba);
}

clock_t times(struct tms *buf)
{
	// Call callback in supervisor mode.
	unsigned long long int ticks200hz = (unsigned long long int)trap14_26(read200hzMem);
	unsigned long long int libcticks = (ticks200hz * CLK_TCK) / 200;

	unsigned long long int processticks = ((unsigned long long int)_atari_4ba_at_prg_start * CLK_TCK) / 200;
	processticks = libcticks - processticks;

	// For a single threaded system like the atari, only tms_utime is meaningful.
	buf->tms_utime = (clock_t)processticks;
	buf->tms_stime = 0;
	buf->tms_cutime = 0;
	buf->tms_cstime = 0;
	return (clock_t)libcticks;
}
