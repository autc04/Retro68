/*
	Copyright 2017 Wolfgang Thaller.

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

#define ENABLE_ASSERT 1
#define ENABLE_LOG 0

/* a simple version of assert - on failure, the line number is output
 * using DebugStr. 
 
 * It is implimented as a dependency-free macro so it can be used in the
 * earliest stages of program startup.
 */


#if !ENABLE_ASSERT
#define assert(x) do { } while(0)
#else
#define assert(x) do { \
		if(!(x)) {\
			unsigned char str[6];	\
			int i;	\
			int l = __LINE__; \
			for(i = 1; i < 6; i++)	\
				str[i] = ' ';	\
			str[0] = 5;	\
			str[5] = '0';	\
			for(i = 5; l && i > 0; i--)	\
			{	\
				str[i] = '0' + (l % 10);	\
				l /= 10;	\
			}	\
			DebugStr(str);	\
		}	\
	} while(0)
#endif

#if !ENABLE_LOG
#define log(x) do { } while(0)
#else
#define log(x) do { \
		{\
			unsigned char str[10];	\
			int ___i;	\
			unsigned l = (x); \
			for(___i = 2; ___i < 10; ___i++)	\
				str[___i] = ' ';	\
			str[0] = 9;	\
			str[1] = 'L';	\
			str[9] = '0';	\
			for(___i = 8; l && ___i > 1; ___i--)	\
			{	\
				str[___i] = '0' + (l & 0xF);	\
				if((l & 0xF) >= 0xA) \
					str[___i] = 'A' - 10 + (l&0xF); \
				l >>= 4;	\
			}	\
			DebugStr(str);	\
		}	\
	} while(0)

#endif
