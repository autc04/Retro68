/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <unistd.h>
#include <_ansi.h>

/*
 * kill -- go out via exit...
 */
int kill(int pid, int sig)
{
	_exit(sig);
	return 0;
}
