/*
    Copyright 2012 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "fixed.h"

long fixed::nMul = 0, fixed::nIMul = 0, fixed::nDiv = 0, fixed::nSqrt = 0;

fixed sqrt(fixed f)
{
	COUNT_OP(fixed::nSqrt);	

	const int FRACBITS  = 16; /* Must be even! */
	const int ITERS = 15 + (FRACBITS >> 1);
	
	unsigned long root, remHi, remLo, testDiv, count;
	root = 0;			/* Clear root */
	remHi = 0;			/* Clear high part of partial remainder */
	remLo = f.val;			/* Get argument into low part of partial remainder */
	count = ITERS;		/* Load loop counter */
		
	do {
		remHi = (remHi << 2) | (remLo >> 30); remLo <<= 2; /* get 2 bits of arg */
		root <<= 1; /* Get ready for the next bit in the root */
		testDiv = (root << 1) + 1; /* Test radical */
		if (remHi >= testDiv) {
			remHi -= testDiv;
			root += 1;
		}
	} while (count-- != 0);

	return fixed(root, fixed::raw());
}
