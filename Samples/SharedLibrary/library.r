/*
    Copyright 2019 Wolfgang Thaller.

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

#include "Processes.r"
#include "CodeFragments.r"

/*
    cfrg resource for a library.
    It specifies the library name, which must match the name of the library target
    in CMakeLists.txt.
    Note that the actual file name does *not* need to match, renaming the file does *not*
    break things. How cool is that?
*/

resource 'cfrg' (0) {
	{
		kPowerPCCFragArch, kIsCompleteCFrag, kNoVersionNum, kNoVersionNum,
		kDefaultStackSize, kNoAppSubFolder,
		kImportLibraryCFrag, kDataForkCFragLocator, kZeroOffset, kCFragGoesToEOF,
		"Library"
	}
};
