/*
	Copyright 2015 Wolfgang Thaller.

	This file is part of Retro68.

	Retro68 is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Retro68 is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	Under Section 7 of GPL version 3, you are granted additional
	permissions described in the GCC Runtime Library Exception, version
	3.1, as published by the Free Software Foundation.

	You should have received a copy of the GNU General Public License and
	a copy of the GCC Runtime Library Exception along with this program;
	see the files COPYING and COPYING.RUNTIME respectively.  If not, see
	<http://www.gnu.org/licenses/>.
*/

#define RETRO68_GET_DISPLACEMENT(DISPLACEMENT) \
	do {	\
		long virtualstart, realstart;	\
		__asm__( "1:\n"	\
				 "\tmove.l #1b, %0\n"	\
				 "\tlea (1b:w,%%pc), %1" \
				: "=r"(virtualstart) , "=a"(realstart) );	\
		DISPLACEMENT = realstart - virtualstart;	\
	} while(0)

#define RETRO68_CALL_UNRELOCATED(FUN,ARGS) \
	do {	\
		long displacement;	\
		RETRO68_GET_DISPLACEMENT(displacement);	\
		(*(typeof(&FUN)) ((char*)(&FUN) + displacement)) ARGS;	\
	} while(0)

void Retro68Relocate();
void Retro68CallConstructors();
void Retro68FreeGlobals();

#define RETRO68_RELOCATE() RETRO68_CALL_UNRELOCATED(Retro68Relocate,())
