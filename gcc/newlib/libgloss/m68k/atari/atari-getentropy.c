/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

/*
    Xorshift pseudorandom number generator.
    https://en.wikipedia.org/wiki/Xorshift
    Inited with random seed.
*/

int getentropy(void *buf, size_t buflen)
{
    unsigned int a;
    unsigned int state[4];

    // Init state
    a = trap14_11();     // Atari Random func.
    for (int i = 0; i < 4; ++i)
    {
        // xorshift32
        a ^= (a << 13);
        a ^= (a >> 17);
        a ^= (a << 5);
        state[i] = a;
    }

    for (size_t i = 0; i < buflen; ++i)
    {
        // xorshift128
        unsigned int t = state[3];
        unsigned int s = state[0];
        state[3] = state[2];
        state[2] = state[1];
        state[1] = s;

        t ^= t << 11;
        t ^= t >> 7;
        state[0] = t ^ s ^ (s >> 19);

        // use lowest byte (could be optimized to adapt to buf len and output whole 32 bits when possible.)
        ((unsigned char*)buf)[i] = (unsigned char)state[0];
    }

    return 0;
}
